/ip address add address=10.0.5.2/30 interface=ether4
/ip address add address=10.0.6.2/30 interface=ether2
/ip address add address=10.0.7.2/30 interface=ether3

/interface bridge add name=loopback
/ip address add address=6.6.6.6/32 interface=loopback
/routing ospf instance set default router-id=6.6.6.6

/routing ospf network add network=10.0.5.0/30 area=backbone
/routing ospf network add network=10.0.6.0/30 area=backbone
/routing ospf network add network=10.0.7.0/30 area=backbone
/routing ospf network add network=6.6.6.6/32 area=backbone

/mpls ldp set enabled=yes transport-address=6.6.6.6 lsr-id=6.6.6.6
/mpls ldp interface add interface=ether2
/mpls ldp interface add interface=ether3
/mpls ldp interface add interface=ether4

/system identity set name=R01.LBN
/user add name=agonek group=full password=******
/user remove admin