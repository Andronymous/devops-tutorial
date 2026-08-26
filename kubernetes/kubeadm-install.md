# Installing Kubernetes with kubeadm (Calico + nerdctl + Proxy)

## Setup

- 1 Master node (Control Plane)
- 2 Worker nodes
- OS: Ubuntu 22.04 (fresh VMs)
- Network plugin: **Calico**
- Container CLI: **nerdctl**

Some steps run on **all 3 servers**. Some steps run **only on the master**. Some steps run **only on the workers**. Each step is marked clearly.

> **Note:** Replace `<PROXY_URL>` (example: `http://10.0.0.5:3128`) with your real proxy address before running the proxy-related commands.

---

## Part 1: Steps on ALL 3 Servers

### Step 1 — Set a unique hostname

```bash
sudo hostnamectl set-hostname master-node      # run on master
sudo hostnamectl set-hostname worker-node-1    # run on worker 1
sudo hostnamectl set-hostname worker-node-2    # run on worker 2
```

**Why:** Kubernetes identifies nodes by hostname. Two nodes with the same name will confuse the cluster.

---

### Step 2 — Update the system

```bash
sudo apt update && sudo apt upgrade -y
```

**Why:** Start from a clean, updated base to avoid dependency and security problems.

---

### Step 3 — Disable swap

```bash
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
```

**Why:** `kubelet` needs to know the exact memory usage on the node. Swap hides real memory pressure, so Kubernetes does not support it.

---

### Step 4 — Load required kernel modules

```bash
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
```

**Why:**
- `overlay` — needed by containerd for its storage filesystem.
- `br_netfilter` — lets the kernel filter traffic that passes through a network bridge. Pod-to-pod networking depends on this.

---

### Step 5 — Set required sysctl parameters

```bash
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
```

**Why:** These settings let network rules (Services, load balancing) work correctly, and let the node forward packets between pods on different nodes.

---

### Step 6 — Install containerd

```bash
sudo apt install -y containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
```

**Why:** Kubernetes needs a container runtime to actually start and manage containers. We use `containerd`.

---

### Step 7 — Set containerd to use the systemd cgroup driver

Edit `/etc/containerd/config.toml` and change:

```
SystemdCgroup = false
```

to:

```
SystemdCgroup = true
```

Then restart:

```bash
sudo systemctl restart containerd
sudo systemctl enable containerd
```

**Why:** `kubelet` uses `systemd` to manage CPU/memory limits on Ubuntu. containerd must use the same cgroup driver, or the node can become unstable.

---

### Step 8 — Configure a proxy for containerd (NEW)

This lets containerd (and `nerdctl`) reach the internet through your proxy to pull images.

```bash
sudo mkdir -p /etc/systemd/system/containerd.service.d
cat <<EOF | sudo tee /etc/systemd/system/containerd.service.d/http-proxy.conf
[Service]
Environment="HTTP_PROXY=<PROXY_URL>"
Environment="HTTPS_PROXY=<PROXY_URL>"
Environment="NO_PROXY=localhost,127.0.0.1,10.0.0.0/8,192.168.0.0/16"
EOF

sudo systemctl daemon-reload
sudo systemctl restart containerd
```

**Why:** By default, containerd only sees your shell's proxy variables, not a systemd service's variables. This file gives containerd its own proxy settings so image pulls work behind the proxy. `NO_PROXY` keeps internal cluster traffic going direct, not through the proxy.

---

### Step 9 — Install nerdctl (NEW)

```bash
curl -LO https://github.com/containerd/nerdctl/releases/download/v1.7.6/nerdctl-1.7.6-linux-amd64.tar.gz
sudo tar Cxzvf /usr/local/bin nerdctl-1.7.6-linux-amd64.tar.gz
nerdctl version
```

**Why:** `containerd` alone has no user-friendly command-line tool. `nerdctl` gives you Docker-like commands (`nerdctl pull`, `nerdctl images`, `nerdctl ps`) to work directly with containerd — useful for checking and testing images on the node.

---

### Step 10 — Configure a proxy for apt (NEW)

This lets `apt` reach the Kubernetes package repository through your proxy.

```bash
cat <<EOF | sudo tee /etc/apt/apt.conf.d/95proxies
Acquire::http::Proxy "<PROXY_URL>";
Acquire::https::Proxy "<PROXY_URL>";
EOF
```

**Why:** The Kubernetes repository (`pkgs.k8s.io`) may not be reachable directly from your network. This tells `apt` to use your proxy for all downloads, including the Kubernetes packages in the next steps.

---

### Step 11 — Add the Kubernetes apt repository

```bash
sudo apt install -y apt-transport-https ca-certificates curl gpg

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```

**Why:** Kubernetes packages are not in Ubuntu's default repositories. We add the official Kubernetes repository so we install a trusted, correct version.

---

### Step 12 — Install kubeadm, kubelet, and kubectl

```bash
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```

**Why:**
- `kubelet` — the agent that runs on every node and starts/stops containers.
- `kubeadm` — the tool we use to build the cluster.
- `kubectl` — the command-line tool to talk to the cluster.
- `apt-mark hold` — locks the versions so `apt upgrade` doesn't accidentally break the cluster.

---

## Part 2: Steps ONLY on the Master Node

### Step 13 — Initialize the Control Plane

```bash
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```

**Why:** This creates the Control Plane (API Server, Scheduler, Controller Manager, etcd). We use `192.168.0.0/16` because this is the default pod network range expected by **Calico** (different from Flannel's `10.244.0.0/16`).

At the end, `kubeadm` prints a `kubeadm join ...` command with a token. **Save this — you need it for the workers.**

---

### Step 14 — Configure kubectl access for your user

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

**Why:** `kubectl` needs credentials and connection info, stored in `admin.conf`. Copying it to your user's folder lets you run `kubectl` without `sudo`.

---

### Step 15 — Install Calico (Pod Network / CNI)

```bash
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml
```

**Why:** Pods cannot talk to each other across nodes until a CNI (Container Network Interface) plugin is installed. We use **Calico** here — it supports network policies (security rules between pods), which Flannel does not.

---

## Part 3: Steps ONLY on the Worker Nodes

### Step 16 — Join the cluster

Run the command that `kubeadm init` printed in Step 13:

```bash
sudo kubeadm join <MASTER_IP>:6443 --token <TOKEN> \
  --discovery-token-ca-cert-hash sha256:<HASH>
```

**Why:** This tells the worker's `kubelet` where the Control Plane is, and gives it a secure token to register itself as a node.

---

## Part 4: Verify the Cluster (on Master)

```bash
kubectl get nodes
kubectl get pods -n kube-system
```

**Why:** Confirms all 3 nodes joined and are `Ready`, and that Calico's pods are running correctly.

---

## Quick Reference Table

| Step | Runs on | Purpose |
|------|---------|---------|
| Hostname, swap off, kernel modules, sysctl | All nodes | Prepare the OS |
| Install containerd + cgroup fix | All nodes | Container runtime |
| Containerd proxy | All nodes | Allow image pulls via proxy |
| Install nerdctl | All nodes | CLI to manage containers |
| Apt proxy | All nodes | Allow apt to reach k8s repo |
| Add k8s repo + install kubeadm/kubelet/kubectl | All nodes | Install Kubernetes tools |
| `kubeadm init` | Master only | Create Control Plane |
| Configure kubectl | Master only | Access the cluster |
| Install Calico | Master only | Enable pod networking |
| `kubeadm join` | Workers only | Add node to cluster |
| `kubectl get nodes` | Master only | Verify cluster |
