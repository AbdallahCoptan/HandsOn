# Demo: Web Server on AWS EC2 Instances

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure and resizable compute capacity in the cloud. It's designed to make web-scale cloud computing easier for developers.

Amazon EC2 presents a true virtual computing environment, and it allows you to use web service interfaces to launch instances with a variety of operating systems, load them with your custom application environment, manage your network’s access permissions, and run your image by using as many or few systems as you want.

Details on the features and cost of Amazon EC2 are available at: [https://aws.amazon.com/ec2/](https://aws.amazon.com/ec2/)


Amazon EC2 provides a wide selection of instance types that are optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity. They give you the flexibility to choose the appropriate mix of resources for your applications. Each instance type includes one or more instance sizes, which allows you to scale your resources to the requirements of your target workload. Current details about available instance types are available at: [https://aws.amazon.com/ec2/instance-types/](https://aws.amazon.com/ec2/instance-types/)


In this section, you find one of the mostly used servers nowadays (e.g. web server) built on the EC2 comput instances on two different AMI, the first on [Linux machine](#creating-a-web-server-on-ec2-instance:-linux-machine), the second on [ubuntu machine](#creating-a-web-server-on-ec2-instance:-ubuntu-machine), third one on [Windows machine](#creating-a-web-server-on-ec2-instance:-windows-machine).


## Creating a web server on EC2 instance: Linux Machine


To create the web server on Amazon linux machine, follow the steps in [Launcing EC2 Instance](EC2.md):

1. Choose Linux AMI, and decide on which kind of instance you need
2. Configure instance details, up tp now leave it as is
3. In case you need more storage, add in the next step more volumes
4. Mange your resources by tags
5. Very important is to manage your security groups, see [Create a security group](https://hands-on.readthedocs.io/en/latest/EC2/#create-a-security-group)
	a. Do not forget to add the `HTTP/HTTPs` rule in order to access your web server
	b. Make this rule to be accessed from **anywhere**
	c. Keep the `SSH` rule as is, this will allow you to access the machin through `SSh`

6. Review your instance by adding a `public key` to access it 


Once instance is launched and running:

1. Connect to it through `SSH`
2. Transfer the files you may need to install them, through internet or from your local machin
3. Install the `web server` by using the followin script:

		$> yum update -y
		$> amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
		$> yum install -y httpd mariadb-server
		$> systemctl start httpd
		$> systemctl enable httpd
		$> usermod -a -G apache ec2-user
		$> chown -R ec2-user:apache /var/www
		$> chmod 2775 /var/www
		$> find /var/www -type d -exec chmod 2775 {} \;
		$> find /var/www -type f -exec chmod 0664 {} \;
		$> echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php

You can run the previous commands in the terminal or run it as a bash script, see all [scripts](slides.md#scripts), Check [Apache: Webserver installation Linux bash script (Script_linux.sh)](), it is as follow:

		#!/bin/bash
		yum update -y
		amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
		yum install -y httpd mariadb-server
		systemctl start httpd
		systemctl enable httpd
		usermod -a -G apache ec2-user
		chown -R ec2-user:apache /var/www
		chmod 2775 /var/www
		find /var/www -type d -exec chmod 2775 {} \;
		find /var/www -type f -exec chmod 0664 {} \;
		echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php  

























## Creating a web server on EC2 instance: Ubuntu Machine



















## Creating a web server on EC2 instance: Windows Machine















## Running commands on your Linux instance at launch