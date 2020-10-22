# Demo: Web Server on AWS EC2 Instances

Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides secure and resizable compute capacity in the cloud. It's designed to make web-scale cloud computing easier for developers.

Amazon EC2 presents a true virtual computing environment, and it allows you to use web service interfaces to launch instances with a variety of operating systems, load them with your custom application environment, manage your network’s access permissions, and run your image by using as many or few systems as you want.

Details on the features and cost of Amazon EC2 are available at: [https://aws.amazon.com/ec2/](https://aws.amazon.com/ec2/)


Amazon EC2 provides a wide selection of instance types that are optimized to fit different use cases. Instance types comprise varying combinations of CPU, memory, storage, and networking capacity. They give you the flexibility to choose the appropriate mix of resources for your applications. Each instance type includes one or more instance sizes, which allows you to scale your resources to the requirements of your target workload. Current details about available instance types are available at: [https://aws.amazon.com/ec2/instance-types/](https://aws.amazon.com/ec2/instance-types/)


In this section, you find one of the mostly used servers nowadays (e.g. web server) built on the EC2 comput instances on two different AMI, the first on [Linux machine](#creating-a-web-server-on-ec2-instance:-linux-machine), the second on [ubuntu machine](#creating-a-web-server-on-ec2-instance:-ubuntu-machine), third one on [Windows machine](#creating-a-web-server-on-ec2-instance:-windows-machine).


## Creating a web server on EC2 instance: Linux Machine


### 1. Launching the Instance with the proper setting

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




### 2. Installing the webserver [OR [User data and shell scripts](#running-commands-on-your-linux-instance-at-launch)]



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

You can run the previous commands in the terminal or run it as a bash script, see all [scripts](slides.md#scripts), Check [Apache: Webserver installation Linux bash script (Script_linux.sh)](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/script_linux.sh), it is as follow:

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



In order to run this in the terminal directly, do the following:

		$> wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/script_linux.sh
		$> ./script_linux.sh






### 3. Test the installed webserver

In order to test your webserver in the instance, in a web browser, enter the URL of the PHP test file the script created. This URL is the `public DNS address` of your instance followed by a forward slash and the file name.

		http://my.public.dns.amazonaws.com(or the public IP)/phpinfo.php










## Creating a web server on EC2 instance: Ubuntu Machine



### 1. Launching the Instance with the proper setting

To create the web server on Amazon linux machine, follow the steps in [Launcing EC2 Instance](EC2.md):

1. Choose Ubuntu server AMI, and decide on which kind of instance you need
2. Configure instance details, up tp now leave it as is
3. In case you need more storage, add in the next step more volumes
4. Mange your resources by tags
5. Very important is to manage your security groups, see [Create a security group](https://hands-on.readthedocs.io/en/latest/EC2/#create-a-security-group)
	a. Do not forget to add the `HTTP/HTTPs` rule in order to access your web server
	b. Make this rule to be accessed from **anywhere**
	c. Keep the `SSH` rule as is, this will allow you to access the machin through `SSh`

6. Review your instance by adding a `public key` to access it 




### 2. Installing the webserver [OR [User data and shell scripts](#running-commands-on-your-linux-instance-at-launch)]


#### A. Installing Apache Web Server

Once instance is launched and running:

1. Connect to it through `SSH`
2. Transfer the files you may need to install them, through internet or from your local machin
3. Install the `web server` by using the followin script:

		$> sudo apt-get update
		$> sudo add-apt-repository ppa:ondrej/php
		$> sudo apt update
		$> sudo apt install php7.2
		$> sudo groupadd apache
		$> sudo usermod -a -G apache ubuntu
		$> sudo chown -R ubuntu:apache /var/www
		$> sudo chmod 2775 /var/www
		$> find /var/www -type d -exec chmod 2775 {} \;
		$> find /var/www -type f -exec chmod 0664 {} \;
		$> echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
		$> cd /var/www/html/
		$> wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/hydro.html

You can run the previous commands in the terminal or run it as a bash script, see all [scripts](slides.md#scripts), Check [Apache: Webserver installation Ubuntu bash script (Script_linux_1.sh)](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/script_ubuntu_1.sh), it is as follow:

		#!/bin/bash
		echo "Y" | sudo apt-get update
		echo "" | sudo add-apt-repository ppa:ondrej/php
		echo "Y" | sudo apt update
		echo "Y" | sudo apt install php7.2
		sudo groupadd apache
		sudo usermod -a -G apache ubuntu
		sudo chown -R ubuntu:apache /var/www
		sudo chmod 2775 /var/www
		find /var/www -type d -exec chmod 2775 {} \;
		find /var/www -type f -exec chmod 0664 {} \;
		echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
		cd /var/www/html/
		wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/hydro.html 



In order to run this in the terminal directly, do the following:

		$> wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/script_ubuntu_1.sh
		$> chmod +x script_ubuntu_1.sh
		$> ./script_ubuntu_1.sh



#### B. Installing Flusk through Python

Once instance is launched and running:

1. Connect to it through `SSH`
2. Transfer the files you may need to install them, through internet or from your local machin
3. Install the `web server` by using the followin script:

		$> git clone https://github.com/WillKoehrsen/recurrent-neural-networks.git
		$> sudo apt-get update
		$> sudo apt-get install python3-pip
		$> cd recurrent-neural-networks
		$> pip3 install --user -r requirements.txt
		$> cd deployment
		$> sudo python3 run_keras_server.py

You can run the previous commands in the terminal or run it as a bash script, see all [scripts](slides.md#scripts), [Python web flax: Webserver installation Ubuntu bash script (test.sh)](https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/test.sh), it is as follow:

		#!/bin/bash
		git clone https://github.com/WillKoehrsen/recurrent-neural-networks.git
		echo "Y" | sudo apt-get update
		echo "Y" | sudo apt-get install python3-pip
		cd recurrent-neural-networks
		pip3 install --user -r requirements.txt
		cd deployment
		sudo python3 run_keras_server.py



In order to run this in the terminal directly, do the following:

		$> wget https://raw.githubusercontent.com/AbdallahCoptan/HandsOn/master/AWS/docs/Codes/test.sh
		$> chmod +x test.sh
		$> ./test.sh




### 3. Test the installed webserver


#### A. Test Apache Server

In order to test your webserver in the instance, in a web browser, enter the URL of the PHP test file the script created. This URL is the `public DNS address` of your instance followed by a forward slash and the file name.

		http://my.public.dns.amazonaws.com(or the public IP)/phpinfo.php
		http://my.public.dns.amazonaws.com(or the public IP)/
		http://my.public.dns.amazonaws.com(or the public IP)/hydro.html 



#### B. Test Flusk Server


In order to test your webserver in the instance, in a web browser, enter the URL of the PHP test file the script created. This URL is the `public DNS address` of your instance followed by a forward slash and the file name.


		http://my.public.dns.amazonaws.com(or the public IP)/






## Creating a web server on EC2 instance: Windows Machine


### 1. Create instance with a Windwos AMI 

To creat an instance, please check [Getting started with Amazon EC2 Windows instances](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/EC2_GetStarted.html).



### 2. Connect to the Windows instance

To connect to a Windows instance, see [Connecting to Your Windows Instance](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html) in the Amazon EC2 User Guide for Windows Instances. 

To transfer files to and from a Windows instance, see [Transfer files to Windows instances](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html#AccessingInstancesWindowsFileTransfer) in the Amazon EC2 User Guide for Windows Instances.

Use [remmina](https://remmina.org/) to connect to your instance and transfer files from ubuntu machine. Check [How to create shared folder on Windows Remote Desktop from Ubuntu via Remmina](https://yatsushi.com/blog/how-to-create-shared-folder-on-windows-vm-from-ubuntu-with-Remmina/).

### 3. Install the web server on Windows


- [How to Install Apache on a Windows Server](https://www.liquidweb.com/kb/how-to-install-apache-on-a-windows-server/)




## Running commands on your Linux instance at launch


When you launch an instance in Amazon EC2, you have the option of passing user data to the instance that can be used to perform common automated configuration tasks and even run scripts after the instance starts. You can pass two types of user data to Amazon EC2: shell scripts and cloud-init directives. You can also pass this data into the launch wizard as plain text, as a file (this is useful for launching instances using the command line tools), or as base64-encoded text (for API calls). 



### Specify instance user data at launch

You can specify instance user data when you launch the instance. If the root volume of the instance is an EBS volume, you can also stop the instance and update its user data. 

Follow the procedure for launching an instance at [Launching an instance using the Launch Instance Wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html), but when you get to [Step 3: Configure Instance Details](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html#configure_instance_details_step) in that procedure, copy your shell script in the User data field, and then complete the launch procedure.

In the example script below, the script creates and configures our web server.

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


Allow enough time for the instance to launch and execute the commands in your script, and then check to see that your script has completed the tasks that you intended.

For our example, in a web browser, enter the URL of the PHP test file the script created. This URL is the public DNS address of your instance followed by a forward slash and the file name. 

		http://my.public.dns.amazonaws.com/phpinfo.php

You should see the PHP information page. If you are unable to see the PHP information page, check that the security group you are using contains a rule to allow HTTP (port 80) traffic. For more information, see [Adding rules to a security group](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/working-with-security-groups.html#adding-security-group-rule).

`(Optional)` If your script did not accomplish the tasks you were expecting it to, or if you just want to verify that your script completed without errors, examine the cloud-init output log file at `/var/log/cloud-init-output.log` and look for error messages in the output. 


### View and update the instance user data


**To modify instance user data**

1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. In the navigation pane, choose **Instances**.

3. Select the instance and choose **Actions, Instance State, Stop**.

		/!\ Warning

		When you stop an instance, the data on any instance store volumes is erased. 
		To keep data from instance store volumes, be sure to back it up to persistent storage.

4. When prompted for confirmation, choose **Yes, Stop**. It can take a few minutes for the instance to stop.

5. With the instance still selected, choose **Actions, Instance Settings, View/Change User Data**. You can't change the user data if the instance is running, but you can view it.

6. In the **View/Change User Data** dialog box, update the user data, and then choose Save.

7. Restart the instance. The new user data is visible on your instance after you restart it; however, user data scripts are not executed.











## Running commands on your Windows instance at launch

For information about running commands on your Windows instance at launch, see [Running Commands on Your Windows Instance at Launch](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-windows-user-data.html) and [Managing Windows Instance Configuration](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-state.html) in the Amazon EC2 User Guide for Windows Instances. 

## More complex automation scenarios during the launching of instances

If you are interested in more complex automation scenarios, consider using AWS CloudFormation and AWS OpsWorks. For more information, see the [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html) and the [AWS OpsWorks User Guide](https://docs.aws.amazon.com/opsworks/latest/userguide/welcome.html). 