/interface bridge add name=loopback

/ip address add address=10.0.1.1/30 interface=ether2
/ip address add address=10.0.6.1/30 interface=ether3
/ip address add address=172.16.1.1/24 interface=loopback

/ip pool add name=pool ranges=172.16.1.2-172.16.1.254
/ip dhcp-server add name=dhcp interface=loopback address-pool=pool disabled=no
/ip dhcp-server network add address=172.16.1.0/24 gateway=172.16.1.1

/ip address add address=1.1.1.1/32 interface=loopback
/routing ospf instance set default router-id=1.1.1.1

/routing ospf network add network=10.0.1.0/30 area=backbone
/routing ospf network add network=10.0.6.0/30 area=backbone
/routing ospf network add network=1.1.1.1/32 area=backbone

/mpls ldp set enabled=yes transport-address=1.1.1.1 lsr-id=1.1.1.1
/mpls ldp interface add interface=ether2
/mpls ldp interface add interface=ether3


/interface vpls add name=vpn remote-peer=4.4.4.4 disabled=no cisco-style=yes cisco-style-id=14
/interface bridge port add bridge=loopback interface=ether4
/interface bridge port add bridge=loopback interface=vpn

/system identity set name=R01.NY
/user add name=agonek group=full password=******
/user remove admin