/ip address add address=10.0.3.2/30 interface=ether2
/ip address add address=10.0.4.1/30 interface=ether3

/interface bridge add name=loopback
/ip address add address=4.4.4.4/32 interface=loopback
/routing ospf instance set default router-id=4.4.4.4

/routing ospf network add network=10.0.3.0/30 area=backbone
/routing ospf network add network=10.0.4.0/30 area=backbone
/routing ospf network add network=4.4.4.4/32 area=backbone

/mpls ldp set enabled=yes transport-address=4.4.4.4 lsr-id=4.4.4.4
/mpls ldp interface add interface=ether2
/mpls ldp interface add interface=ether3

/interface vpls add name=vpn remote-peer=1.1.1.1 disabled=no cisco-style=yes cisco-style-id=14
/interface bridge port add bridge=loopback interface=ether4
/interface bridge port add bridge=loopback interface=vpn

/system identity set name=R01.SPB
/user add name=agonek group=full password=******
/user remove admin
