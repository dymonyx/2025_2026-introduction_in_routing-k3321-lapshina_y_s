/ip address add address=192.168.2.2/30 interface=ether2
/ip address add address=192.168.3.2/30 interface=ether3
/ip address add address=10.0.2.1/24 interface=ether4
/ip pool add name=pool ranges=10.0.2.2-10.0.2.254
/ip dhcp-server add name=dhcp interface=ether4 address-pool=pool disabled=no
/ip dhcp-server network add address=10.0.2.0/24 gateway=10.0.2.1
/ip route add dst-address=10.0.1.0/24 gateway=192.168.3.1
/ip route add dst-address=10.0.3.0/24 gateway=192.168.2.1
/system identity set name=R01.FRT
/user add name=agonek group=full password=******
/user remove admin