#!/bin/bash

#ifconfig NIC information --> ipv4 ipv6 netmask
get_interface_ip_addresses(){
    interface="ens160"
    ip_address=$(ifconfig $interface | grep 'inet ' | awk '{ print $2 }')
    echo "IP address of $interface: $ip_address"
    ifconfig $interface | grep 'inet '
    echo -e "end of ifconfig\n"
}

#ping ICMP packet in a RESPONSE-ECHO structure to check availability
custom_ping(){
    ip_address="8.8.8.8"
    packet_count=2
    ping=$(ping -c $packet_count $ip_address | grep 'time=')
    echo -e "Result of pinging $ip_address: \n $ping"
    echo -e "end of ping\n"
}

#dig DNS Lookup --> A/AAA MX CNAME records
dns_record(){
    domain="google.com"
    ip_for_domain=$(dig $domain +short)
    echo "A record for $domain : $ip_for_domain"
    echo -e " end of dig\n"
}

#tracerout ip packet route from source to destination showing response time of each hop
custom_traceroute(){
    domain="andronymous.ir"
    max_hop='35'
    route=$(traceroute -I -m $max_hop $domain)
    echo -e "this is route to $domain using ICMP packets:\n $route"
}

#netstat network connection, open ports
port_checker(){
    port='80'
    status=$(netstat -an | grep $port | head -n 1 | awk '{ print $6 }')
    echo "the status for port $port is : $status"
    netstat -an | grep $port
    echo -e "end of netstat\n"
}

#whois
domain_whois(){
    domain="andronymous.ir"
    nameserver=$(whois $domain | grep nserver | awk '{ print $2 }')
    echo -e "the nameserver for $domain is :\n $nameserver\n"
    whois $domain | grep ns
}

#get_interface_ip_addresses

#custom_ping

#dns_record

#custom_traceroute

#port_checker

#domain_whois