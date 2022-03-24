#!/bin/bash
ip netns add ns1;
ip netns add ns2;
ip netns exec ns1 ip link set dev lo up;
ip netns exec ns1 ip address;
ip link set eth0 netns ns1;
ip address show eth0;
ip netns exec ns1 ip address add 192.168.1.1/24 dev eth0;
ip netns exec ns1 ip address show eth0;
ip netns exec ns1 ip link set dev eth0 up;
ip netns exec ns1 ip address show eth0 ;
ip netns exec ns1 ip link set eth0 netns 1 ;
ip netns exec ns2 ip link set dev lo up;
ip netns exec ns2 ip address;
ip link set  netns ns2;
ip address show wlan0;
ip netns exec ns2 ip address add 192.168.1.2/24 dev wlan0;
ip netns exec ns2 ip address show wlan0;
ip netns exec ns2 ip link set dev wlan0 up;
ip netns exec ns2 ip address show wlan0 ;
ip netns exec ns2 ip link set wlan0 netns 1 ;
Exit
