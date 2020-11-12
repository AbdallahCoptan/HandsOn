# Amazon EC2 Elastic Load Balancing

[Elastic Load Balancing (ELB)](https://aws.amazon.com/elasticloadbalancing/?elb-whats-new.sort-by=item.additionalFields.postDateTime&elb-whats-new.sort-order=desc) automatically distributes incoming application traffic across multiple targets, such as Amazon EC2 instances, containers, and IP addresses. It can handle the varying load of your application traffic in a single Availability Zone or across multiple Availability Zones.



## Load Balancers in AWS

ELB offers three types of load balancers that all feature the high availability, automatic scaling, and robust security that are necessary to make your applications fault-tolerant.

1. An Application Load Balancer operates at the request level (Layer 7), routing traffic to targets--such as EC2 instances, microservices and containers--within Amazon VPC, based on the content of the request. It's ideal for the advanced load balancing of Hypertext Transfer Protocol (HTTP) and Secure HTTP (HTTPS) traffic.

2. A Network Load Balancer operates at the connection level (Layer 4), routing connections to targets--such as Amazon EC2 instances, microservices, and containers--within Amazon VPC, based on IP protocol data. It's ideal for load-balancing Transmission Control Protocol (TCP) traffic.

3. The Classic Load Balancer provides basic load balancing across multiple Amazon EC2 instances, and it operates at both the request level and the connection level.




## Load Balancing: Manage your application workload by ELB


Check, 

- [ELB: Benefits and Use Cases](ELB.md#elb-benefits-and-use-cases), and 
- [How Elastic Load Balancing works](ELB.md#how-elastic-load-balancing-works). 

Then,

- [Getting started with Elastic Load Balancing](ELB.md#getting-started-with-elastic-load-balancing)