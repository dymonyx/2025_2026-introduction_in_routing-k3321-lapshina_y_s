/ip address add address=10.0.1.2/30 interface=ether2
/ip address add address=10.0.2.1/30 interface=ether3

/interface bridge add name=loopback
/ip address add address=2.2.2.2/32 interface=loopback
/routing ospf instance set default router-id=2.2.2.2

/routing ospf network add network=10.0.1.0/30 area=backbone
/routing ospf network add network=10.0.2.0/30 area=backbone
/routing ospf network add network=2.2.2.2/32 area=backbone

/mpls ldp set enabled=yes transport-address=2.2.2.2 lsr-id=2.2.2.2
/mpls ldp interface add interface=ether2
/mpls ldp interface add interface=ether3

/system identity set name=R01.LND
/user add name=agonek group=full password=******
/user remove admin