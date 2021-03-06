# Network Addressing

In this section, you need to test your experiance in computer networks and specialy the network addressing. Network addressing is an important part in managing your network topology and sub networks either inside AWS or in your on-premises data center.


In order to test your knowledge, ask yourself if you know the following:

- Subnets, prefix, and network maskes
- Classfull / Classless network addressing
- Gateway and public IP
- Natting and Private IP
- ...etc


## Cisco: Addressing of a Network



Check the following documentation to know the important terms and to see how to devide your IP range into multiple subnetworks.

[![](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/HydrosatTrainingSlides/networkaddressing.png)](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/HydrosatTrainingSlides/Network%20addressing.pdf) 








## CIDR Notation

An important concept that's used in networking on AWS is CIDR, or Classless Inter-Domain Routing. CIDR network addresses are allocated in a virtual private cloud (VPC) and in a subnet by using CIDR notation. A /16 block provides 65,536 IPv4 addresses. A /24 block provides 256 addresses. [See this article](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) for more information about CIDR. 

Please check the [IP Addressing in your VPC](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-ip-addressing.html#subnet-public-ip).