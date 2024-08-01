### There are different ways to install Docker, particularly on Ubuntu, each with its pros and cons.
## 1. Using the Docker Repository (Recommended):
```shell
apt update
apt install apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Set up the stable repository:
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update
apt install docker-ce
```
## 2. Using the Convenience Script:(Not Recommended):
```shell
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```


## 3. Using the Default Ubuntu Repositories:
```shell
apt update
apt install docker.io
```
