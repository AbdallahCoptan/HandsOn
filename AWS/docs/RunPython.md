# Running Python Scripts on EC2 Instances

In order to run a python script on an EC2 instance, yuo need to:

1. [Login to the AWS webservices Console](#logging-into-the-aws-console)
2. [Launcing an EC2 Instance](#launching-an-ec2-instance)
3. [Connecting to the EC2 Instance](#connecting-to-the-ec2-instance)
4. [Transfering files to the EC2 Instance](#transfering-files-to-the-ec2-instance)
5. [Running Python Scripts on the EC2 Instance](#running-python-scripts-on-the-ec2-instance)



---

## Logging into the AWS Console

Connectig to console by browsing [https://console.aws.amazon.com/](https://console.aws.amazon.com/), then choose the **Sign Into the Console** :

- You need to sign as a **Root User**.
- Enter you **user name** and **password**.
- After a sucessful login, you will see the **AWS Management Console** in your screen.
- In the **Find Services** bar, search for **EC2**
- Once founded, press on **EC2**

Check more details on how to login and create an AWS user, see [Setting Up an AWS Account](AWS_Account.md).

- You need to think about your [Availability Zone](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html), before start launching an instance, see [AWS Infrastructure](https://www.infrastructure.aws/).

## Launching an EC2 Instance

To launch an EC2 instance, you need to press the **Launch Instance** button in your **EC2 Dashboard**. Then follow the wizard:

- _Step1:_  Choose an Amazone Machine Image (AMI), check all the [AMIs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html), We recommend a **[Free tier eligible](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/free-tier-limits.html) AMIs** for training,
	- the name of the free AMIs, such as **Ubuntu Server 16.04 LTS** 

- _Step2:_ Choose an Instance Type, Check all the [Instances Types and Capabilities](https://aws.amazon.com/ec2/instance-types/), We recommend a **[Free tier eligible](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/free-tier-limits.html) Instances** for training,
	-  The AWS Free Tier allotment for Linux and Microsoft Windows instances is counted separately. You can run **750** hours of a Linux `t3.micro`, `t2.micro`, or `t1.micro` instance plus **750** hours of a Windows `t3.micro`, `t2.micro`, or `t1.micro` instance each month for **the first 12 months**. 

- _Steps 3 to 6:_ Configure Isnstance, Add Storage, Add Tags, and Configure Security Group
	- You can skip these three steps by just pressing **Review and Launch**
	- These three steps are related to the instance networking, storage, tags, and security accordingly. 
	- By default, the instance is configured well and has a small storage EBS.
	- In case you need to configure those elements and for example add storage, you should not skip these steps.


- _Step7:_ Review Instance Launch
	- You need just press **Launch**.
	- You have to use either an **existing key pair** or generating a **new** one, see, [Create a key pair](EC2.md#create-a-key-pair).
	- Finally, press **Launch Instances**
	- Press **View Instances** to see the status of your new instance and give it a **Name**.
	- Wait until you find your instance status is **running**.


Check more details on how to launch an AWS EC2 instance, see [Launch an EC2 instance](EC2.md#launch-an-instance).


## Connecting to the EC2 Instance

Connecting to the EC2 instances depends on many parameters and there are many ways to establish the connection and to exchange files between your local machine and the instance machine:

- Connecting to a **Linux instance** through **Local Linux Machine**, this can be accomplished by:
	- [SSH Connection](EC2.md#connect-to-your-linux-instance-using-an-ssh-client)
- Connecting to a **Linux instance** through **Local Windows Machine**, this can be accomplished by:
	- [Putty or MobaXterm](EC2.md#connecting-to-your-linux-instance-from-windows-using-putty-or-mobaxterm)
- [Connecting to a **Windows instance** through **Local Windows | Linux Machine**](EC2.md#connecting-to-your-windows-instance)

Check more details on how to connect to an AWS EC2 instance, see [Connect to an EC2 instance](EC2.md#connecting-to-your-linux-ec2-instances).


## Transfering files to the EC2 Instance

Transfering files to the EC2 instances depends on many parameters and there are many ways to exchange files between your local machine and the instance machine:

- Transferring to | from a **Linux instance** through **Local Linux Machine**, this can be accomplished by:
	- [SCP](EC2.md#transferring-files-to-linux-instances-from-linux-using-scp)
	- [FilZilla](EC2.md#transferring-files-to-your-linux-instance-using-filezilla)

- Transferring to | from a **Linux instance** through **Local Windows Machine**, this can be accomplished by:
	- [PSCP](EC2.md#transferring-files-to-your-linux-instance-using-the-putty-secure-copy-client)
	- [WinSCP](EC2.md#transferring-files-to-your-linux-instance-using-winscp)
	- [FilZilla](EC2.md#transferring-files-to-your-linux-instance-using-filezilla)
- [Transferring to | from a **Windows instance** through **Local Windows | Linux Machine**](EC2.md#transfer-files-to-windows-instances)

Check more details on how to transfer [to|from] an AWS EC2 instance, see [transfer to|from an EC2 instance](EC2.md#transferring-files-to-linux-instances).




## Running Python Scripts on the EC2 Instance

After connecting and traferrin files to the Ec2 instance. You can check the availability of the **Python** on the machine you have.

What you need to start running python:

1. Install **Python3** 
It is already installed in the instance machine, and you can check on this by writing:


		ubuntu@ip-172-31-38-59:~$ python3
		Python 3.5.2 (default, Jul 17 2020, 14:04:10) 
		[GCC 5.4.0 20160609] on linux
		Type "help", "copyright", "credits" or "license" for more information.
		>>> exit()
		ubuntu@ip-172-31-38-59:~$ 


2. Install `pip3`, will  be needed to install more libraries and packages in python:


		ubuntu@ip-172-31-38-59:~$ sudo apt-get install python3-pip


3. Install new packages by using `pip3`, for example install `numpy`


		ubuntu@ip-172-31-38-59:~$ pip3 install numpy


4. Prepare a python script to test it, such as 

		import numpy as np
		a = np.sum([10,20])
		print('hello from Hydro!\n the result is= {}'.format(str(a)))

5. Save this script in a file, named for example `test.py`, then run it by 


		ubuntu@ip-172-31-38-59:~/testfolder$ python3 test.py 
		hello from Hydro!
 		the result is= 30



### Prepare your virtual environment in Python3


#### Installing Virtualenv using pip3


1. Install `Virtualenv`:

		ubuntu@ip-172-31-38-59:~$ pip3 install virtualenv
		Collecting virtualenv
		  Downloading virtualenv-15.1.0-py2.py3-none-any.whl (1.8MB)
		    100% |████████████████████████████████| 1.8MB 367kB/s
		Installing collected packages: virtualenv
		Successfully installed virtualenv-15.1.0

2. Where it is located:

		ubuntu@ip-172-31-38-59:~$ which virtualenv 
		/home/ubuntu/.local/bin/virtualenv

3. Where is python3:

		ubuntu@ip-172-31-38-59:~$ which python3
		/usr/bin/python3

#### Create a new `Virtualenv`


1. Initiate a new virtual environment, and name it `hydrosat`:
		
		ubuntu@ip-172-31-38-59:~$ virtualenv -p /usr/bin/python3 hydrosat
		created virtual environment CPython3.5.2.final.0-64 in 130ms
		  creator CPython3Posix(dest=/home/ubuntu/hydrosat, clear=False, global=False)
		  seeder FromAppData(download=False, setuptools=bundle, pip=bundle, wheel=bundle, via=copy, app_data_dir=/home/ubuntu/.local/share/virtualenv)
		    added seed packages: pip==20.1.1, setuptools==49.2.0, wheel==0.34.2
		  activators FishActivator,PowerShellActivator,BashActivator,CShellActivator,PythonActivator,XonshActivator


2. `activate` the new virtual environment:

		ubuntu@ip-172-31-38-59:~$ source hydrosat/bin/activate
		(hydrosat) ubuntu@ip-172-31-38-59:~$ python -V
		Python 3.5.2

3. `deactivate` the  virtual environment:

		(hydrosat) ubuntu@ip-172-31-38-59:~$ deactivate
		ubuntu@ip-172-31-38-59:~$

#### Delete the virtual environment

To delete a virtual environment, simply delete the project folder. Using the previous example, run the following command:

	ubuntu@ip-172-31-38-59:~$ rm -rf hydrosat
	ubuntu@ip-172-31-38-59:~$ ls
	testfolder  TextFile.txt
	ubuntu@ip-172-31-38-59:~$ 

For mor information, see [Installing and using virtualenv with Python 3](https://help.dreamhost.com/hc/en-us/articles/115000695551-Installing-and-using-virtualenv-with-Python-3) and other techniques are here for [Virtualenv](https://virtualenv.pypa.io/en/stable/).



## Watch it all here


### Run python on Linux instance, connected from Linux machine


<figure class="video_container">
<iframe width="560" height="315" src="https://www.youtube.com/embed/hgoGoLOaN_0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</figure>


### Run python on Linux instance, connected from Windows machine


<figure class="video_container">
<iframe width="560" height="315" src="https://www.youtube.com/embed/7l5PSCiwgFk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</figure>