#!/bin/sh
#############################################
### command to start the packet capturing ###
/usr/sbin/tcpdump  -i wlan0 -ne -c 1000 > hcl
#############################################################################
### Grep the IP, ARP, UDP packets info from the captured packet by tcpdump###
grep "IP" hcl >  hcl1
grep "ARP" hcl >  hcl2
grep "UDP" hcl >  hcl3

######################################################################
### cut different field from the IP packets which are place in hcl1###
cut -d " " -f1 hcl1 > ip1
cut -d " " -f2 hcl1 > ip2
cut -d " " -f4 hcl1 > ip11
cut -d "," -f1 ip11 > ip3
cut -d " " -f9 hcl1 > ip12
cut -d ":" -f1 ip12 > ip4
cut -d " " -f10 hcl1 > ip13
cut -d "." -f5 ip13 > ip7
cut -d "." -f1,2,3,4 ip13 > ip5
cut -d " " -f12 hcl1 > ip14
cut -d "." -f5 ip14 > ip15
cut -d ":" -f1 ip15 > ip8
cut -d "." -f1,2,3,4 ip14 > ip6

############################################################################
### combine all the 8 field and place it into a single file named as ip10###
paste ip1 ip2 ip3 ip4 ip5 ip6 ip7 ip8 > ip10


######################################################################
### cut different field from the ARP packets which are place in hcl2###
cut -d " " -f1 hcl2 > arp1
cut -d " " -f2 hcl2 > arp2
cut -d " " -f4 hcl2 > arp10
cut -d "," -f1 arp10 > arp3
cut -d " " -f9 hcl2 > arp11
cut -d ":" -f1 arp11 > arp4
cut -d " " -f12 hcl2 > arp5
cut -d " " -f14 hcl2 > arp6

############################################################################
### combine all the 8 field and place it into a single file named as arp9###
paste arp1 arp2 arp3 arp4 arp5 arp6 > arp9


######################################################################
### cut different field from the UDP packets which are place in hcl3###
cut -d " " -f1 hcl3 > udp1
cut -d " " -f2 hcl3 > udp2
cut -d " " -f4 hcl3 > udp10
cut -d "," -f1 udp10 > udp3
cut -d " " -f9 hcl3 > udp11
cut -d ":" -f1 udp11 > udp4
cut -d " " -f10 hcl3 > udp13
cut -d "." -f5 udp13 > udp7
cut -d "." -f1,2,3,4 udp13 > udp5
cut -d " " -f12 hcl3 > udp14
cut -d "." -f5 udp14 > udp15
cut -d ":" -f1 udp15 > udp8
cut -d "." -f1,2,3,4 udp14 > udp6

############################################################################
### combine all the 8 field and place it into a single file named as udp9###
paste udp1 udp2 udp3 udp4 udp5 udp6 udp7 udp8 > udp9

####################################################
### place all packet info into a single file all1###
cat ip10 udp9 arp9 > all1

#####################################################
### place all the source_ip into a single file top###
cat ip5 arp5 udp5 > top

################################################################
### take top five source_ip machine which are send max packet###
sort -nr top > top1
uniq -c top1 > top2
sort -nr top2 > top3
head -n 05 top3 > top4

################################################################
### seperate the source_ip field and total no. of packet info###
cut -c9- top4 > top5
### combine all the 8 field and place it into a single file named as udp9###
paste udp1 udp2 udp3 udp4 udp5 udp6 udp7 udp8 > udp9

####################################################
### place all packet info into a single file all1###
cat ip10 udp9 arp9 > all1

#####################################################
### place all the source_ip into a single file top###
cat ip5 arp5 udp5 > top

################################################################
### take top five source_ip machine which are send max packet###
sort -nr top > top1
uniq -c top1 > top2
sort -nr top2 > top3
head -n 05 top3 > top4

################################################################
### seperate the source_ip field and total no. of packet info###
cut -c9- top4 > top5
### combine all the 8 field and place it into a single file named as udp9###
paste udp1 udp2 udp3 udp4 udp5 udp6 udp7 udp8 > udp9

####################################################
### place all packet info into a single file all1###
cat ip10 udp9 arp9 > all1

#####################################################
### place all the source_ip into a single file top###
cat ip5 arp5 udp5 > top

################################################################
### take top five source_ip machine which are send max packet###
sort -nr top > top1
uniq -c top1 > top2
sort -nr top2 > top3
head -n 05 top3 > top4

################################################################
### seperate the source_ip field and total no. of packet info###
cut -c9- top4 > top5
cut -c1,2,3,4,5,6,7 top4 > top6
paste top6 top5 > top7


#############################################################################
### commands for database and load the info into the created database in the form of table###

mysql --local-infile=1 -u root -e"
drop database if exists dump;
create database dump;
use dump;
drop table if exists arptable;
drop table if exists iptable;
drop table if exists udptable;
drop table if exists top;
drop table if exists alltable;
create table arptable(timestamp varchar(20),source_mac varchar(25),des_mac varchar(25),pointer_length varchar(20),source_ip varchar(25),des_ip varchar(25));
create table iptable(timestamp varchar(20),source_mac varchar(25),des_mac varchar(25),pointer_length varchar(20),source_ip varchar(25),des_ip varchar(25),source_port varchar(20), des_port varchar(20));
create table udptable(timestamp varchar(20),source_mac varchar(25),des_mac varchar(25),pointer_length varchar(20),source_ip varchar(25),des_ip varchar(25),source_port varchar(20), des_port varchar(20));
create table top(total varchar(20), source_ip varchar(30));
create table alltable(timestamp varchar(20),source_mac varchar(25),des_mac varchar(25),pointer_length varchar(20),source_ip varchar(25),des_ip varchar(25),source_port varchar(20), des_port varchar(20));
LOAD DATA LOCAL INFILE 'ip10' INTO TABLE iptable;
LOAD DATA LOCAL INFILE 'udp9' INTO TABLE udptable;
LOAD DATA LOCAL INFILE 'arp9' INTO TABLE arptable;
LOAD DATA LOCAL INFILE 'top7' INTO TABLE top;
LOAD DATA LOCAL INFILE 'all1' INTO TABLE alltable;";

