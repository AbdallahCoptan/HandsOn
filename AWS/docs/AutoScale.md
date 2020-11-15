# Amazon EC2 Auto Scaling

[Amazon EC2 Auto Scaling](https://aws.amazon.com/ec2/autoscaling/) helps you maintain application availability, and it allows you to dynamically scale your Amazon EC2 capacity up or down automatically according to conditions that you define. You can use Amazon EC2 Auto Scaling for fleet management of Amazon EC2 instances, which can help maintain the health and availability of your fleet, and ensure that you are running your desired number of Amazon EC2 instances. You can also use Amazon EC2 Auto Scaling to dynamically scale Amazon EC2 instances. Dynamic scaling automatically increases the number of Amazon EC2 instances during demand spikes to maintain performance and decrease capacity during lulls, which can help reduce costs. Amazon EC2 Auto Scaling is well-suited to applications that have stable demand patterns, or applications that experience hourly, daily, or weekly variability in usage.


## Auto Scaling: Add or remove compute capacity to meet changes in demand


Amazon EC2 Auto Scaling helps you maintain application availability and allows you to automatically add or remove EC2 instances according to conditions you define. You can use the fleet management features of EC2 Auto Scaling to maintain the health and availability of your fleet. You can also use the dynamic and predictive scaling features of EC2 Auto Scaling to add or remove EC2 instances. Dynamic scaling responds to changing demand and predictive scaling automatically schedules the right number of EC2 instances based on predicted demand. Dynamic scaling and predictive scaling can be used together to scale faster. 


### Benefits

-  Improve Fault Tolerance
-  Increase Application Availability
-  Lower Costs


### How it works

#### Fleet Management

Whether you are running one Amazon EC2 instance or thousands, you can use Amazon EC2 Auto Scaling to detect impaired Amazon EC2 instances and unhealthy applications, and replace the instances without your intervention. This ensures that your application is getting the compute capacity that you expect. Amazon EC2 Auto Scaling will perform three main functions to automate fleet management for EC2 instances:

- Monitor the health of running instances
Amazon EC2 Auto Scaling ensures that your application is able to receive traffic and that EC2 instances are working properly. Amazon EC2 Auto Scaling periodically performs health checks to identify any instances that are unhealthy.
- Replace impaired instances automatically
When an impaired instance fails a health check, Amazon EC2 Auto Scaling automatically terminates it and replaces it with a new one. That means that you don’t need to respond manually when an instance needs replacing.
- Balance capacity across Availability Zones
Amazon EC2 Auto Scaling can automatically balance instances across zones, and always launches new instances so that they are balanced between zones as evenly as possible across your entire fleet.

Learn more about Fleet Management, see this [blog](https://aws.amazon.com/blogs/compute/fleet-management-made-easy-with-auto-scaling/)


####  Scheduled Scaling

Scaling based on a schedule allows you to scale your application ahead of known load changes. For example, every week the traffic to your web application starts to increase on Wednesday, remains high on Thursday, and starts to decrease on Friday. You can plan your scaling activities based on the known traffic patterns of your web application.


####  Dynamic Scaling

Amazon EC2 Auto Scaling enables you to follow the demand curve for your applications closely, reducing the need to manually provision Amazon EC2 capacity in advance. For example, you can use target tracking scaling policies to select a load metric for your application, such as CPU utilization. Or, you could set a target value using the new “Request Count Per Target” metric from Application Load Balancer, a load balancing option for the Elastic Load Balancing service. Amazon EC2 Auto Scaling will then automatically adjust the number of EC2 instances as needed to maintain your target.
Auto Scaling Prime Time: Target Tracking Hits the Bullseye at Netflix


####  Predictive Scaling

Predictive Scaling, a feature of AWS Auto Scaling uses machine learning to schedule the right number of EC2 instances in anticipation of approaching traffic changes. Predictive Scaling predicts future traffic, including regularly-occurring spikes, and provisions the right number of EC2 instances in advance. Predictive Scaling’s machine learning algorithms detect changes in daily and weekly patterns, automatically adjusting their forecasts. This removes the need for manual adjustment of Auto Scaling parameters as cyclicality changes over time, making Auto Scaling simpler to configure. Auto Scaling enhanced with Predictive Scaling delivers faster, simpler, and more accurate capacity provisioning resulting in lower cost and more responsive applications.


### Amazon EC2 Auto Scaling Features


- Automatically scale in and out
- Choose when and how to scale
- Fleet management
- Predictive Scaling
- Support for multiple purchase models, instance types, and AZs
- Included with Amazon EC2





## Amazon EC2 Auto Scaling Getting Started


There are several ways to get started with Amazon EC2 Auto Scaling.


Check, the [Getting started with Amazon EC2 Auto Scaling](https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html) and do the following:


#### Step 1: Sign into the AWS Management Console

Create an account and sign into the console. With Amazon EC2, you pay only for what you use. If you are a new AWS customer, you can get started with Amazon EC2 for free. For more information, see AWS Free Tier.

#### Step 2: Create a launch template

In the Amazon EC2 Dashboard, choose "Launch Templates" to create a launch template, specifying a name, AMI, instance type, and other details. Below are some guidelines on setting up your first launch template.

   - Choose an Amazon Machine Image (AMI): We recommend the Amazon Linux 2 AMI (free-tier eligible). 
   - Choose an instance type: We recommend the t2.micro (free-tier eligible).
   - Security group: You have the option to configure your virtual firewall.

#### Step 3: Create an Auto Scaling group

Using the Auto Scaling wizard, create an Auto Scaling group specifying a name, size, and network for your Auto Scaling group.

#### Step 4: Add Elastic Load Balancers (Optional)

When you set up Auto Scaling with Elastic Load Balancing, you can automatically distribute incoming application traffic across Amazon EC2 instances within your Auto Scaling groups to build highly available, fault-tolerant applications.

Associate your load balancer with your Auto Scaling group to distribute traffic for your application across a fleet of EC2 instances that can scale with demand.

You must first create a load balancer.

#### Step 5: Configure Scaling Policies (Optional)

Configure scaling policies for your Amazon EC2 Auto Scaling group.


