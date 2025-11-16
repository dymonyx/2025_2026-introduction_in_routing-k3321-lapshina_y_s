/ip address add address=10.0.4.2/30 interface=ether2
/ip address add address=10.0.5.1/30 interface=ether3

/interface bridge add name=loopback
/ip address add address=5.5.5.5/32 interface=loopback
/routing ospf instance set default router-id=5.5.5.5

/routing ospf network add network=10.0.4.0/30 area=backbone
/routing ospf network add network=10.0.5.0/30 area=backbone
/routing ospf network add network=5.5.5.5/32 area=backbone

/mpls ldp set enabled=yes transport-address=5.5.5.5 lsr-id=5.5.5.5
/mpls ldp interface add interface=ether2
/mpls ldp interface add interface=ether3

/system identity set name=R01.MSK
/user add name=agonek group=full password=******
/user remove admin