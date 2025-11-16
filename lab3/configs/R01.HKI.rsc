/ip address add address=10.0.2.2/30 interface=ether2
/ip address add address=10.0.3.1/30 interface=ether3
/ip address add address=10.0.7.1/30 interface=ether4

/interface bridge add name=loopback
/ip address add address=3.3.3.3/32 interface=loopback
/routing ospf instance set default router-id=3.3.3.3

/routing ospf network add network=10.0.2.0/30 area=backbone
/routing ospf network add network=10.0.3.0/30 area=backbone
/routing ospf network add network=10.0.7.0/30 area=backbone
/routing ospf network add network=3.3.3.3/32 area=backbone

/mpls ldp set enabled=yes transport-address=3.3.3.3 lsr-id=3.3.3.3
/mpls ldp interface add interface=ether2
/mpls ldp interface add interface=ether3
/mpls ldp interface add interface=ether4

/system identity set name=R01.HKI
/user add name=agonek group=full password=******
/user remove admin