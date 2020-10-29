# Mounting EFS File System in Linux and Ubuntu

To mount the EFS system you need to check the recommendation before starting the installations in your instances. Then you can mount your EFS volume either by:

1. [NFS client](#nfs-client) {Network-based mounting}
2. [EFS mount helper](#efs-mount-helper) {Local-based mounting}


## Recommendations

There are some recommendations to have your EFS volume mounted successfully, such as:

1. VPC
2. Security groups 

### VPC

You should keep all the components of your environment in one VPC, either the default VPC or your created VPC, see [Create Your Amazon EFS File System](EFS.md#step-1-create-your-amazon-efs-file-system).


### Security groups

In case you need to mount your EFS by using the `nfs` (Netwrk File System), you need to have two security groupes in each of your instances:

1. the **default security group** to make sure that it can access your EFS file system. , and
2. your security group for accessing the instance.

To do that, see [Create Your EC2 Resources](https://docs.aws.amazon.com/efs/latest/ug/gs-step-one-create-ec2-resources.html):

- In **Step 6: Configure Security Group**, set **Assign a security group** to Select an existing security group. Choose the **default security group** to make sure that it can access your EFS file system. 

- With your instance selected, select **Actions > Networking > Change Security Groups**.

	- Select the checkbox for the default VPC security group and click **Assign Security Groups**.


## NFS client

After connecting to your instances, you can install the **NFS client** either by the following [commands](https://aws.amazon.com/getting-started/tutorials/create-network-file-system/) or by copying these commands in the **User data** section to run them during the instances boot. To do so, **Stop** your instances and right cick on instance and in the **Instance Setting** list, choose **Edit user data**, and write the commands there.

### Linux AMI Instance

1. Install the `NFS` client by:

		$> sudo yum install -y nfs-utils

2. Make a directory called `efs` to mount on it:

		$> sudo mkdir efs

3. Go back to the **EFS Attach** window (in the [EFS console](https://console.aws.amazon.com/efs/)). Mount your file system as your new directory.

		$> sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-38920a40.efs.us-east-2.amazonaws.com:/ efs

4. Verify your file system has been successfully mounted by running the following command:

		$> df -h 


5. Create a test file in your new file system by running a simple dd command to generate a 1GiB file in your new directory. Run the following dd command in your SSH window:

		$> sudo dd if=/dev/zero of=~/efs/1GiB bs=1M count=1024 status=progress



### Ubuntu AMI Instance


1. Install the `NFS` client by:

		S> sudo apt-get update
		$> sudo apt-get install nfs-common

2. Make a directory called `efs` to mount on it:

		$> sudo mkdir efs

3. Go back to the **EFS Attach** window (in the [EFS console](https://console.aws.amazon.com/efs/)). Mount your file system as your new directory.

		$> sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-38920a40.efs.us-east-2.amazonaws.com:/ efs

4. Verify your file system has been successfully mounted by running the following command:

		$> df -h 


5. Create a test file in your new file system by running a simple dd command to generate a 1GiB file in your new directory. Run the following dd command in your SSH window:

		$> sudo dd if=/dev/zero of=~/efs/1GiB bs=1M count=1024 status=progress




## EFS mount helper 

After connecting to your instances, you can install the **aws-mount-helper** either by the following [commands](https://docs.aws.amazon.com/efs/latest/ug/installing-other-distro.html) or by copying these commands in the **User data** section to run them during the instances boot. To do so, **Stop** your instances and right cick on instance and in the **Instance Setting** list, choose **Edit user data**, and write the commands there.


If you don't want to get the amazon-efs-utils package from Amazon Linux or Amazon Linux 2 AMIs, the amazon-efs-utils package is also available on GitHub.

After you clone the package, you can build and install amazon-efs-utils using one of the following methods, depending on the package type supported by your Linux distribution: 

- **RPM** – This package type is supported by Amazon Linux, Red Hat Linux, CentOS, and similar.

- **DEB** – This package type is supported by Ubuntu, Debian, and similar.

[Installing the amazon-efs-utils Package on Other Linux Distributions ](https://docs.aws.amazon.com/efs/latest/ug/installing-other-distro.html):

1. If you haven't done so already, install git with the following commands.

		$> sudo yum -y install git

2. From the terminal, clone the amazon-efs-utils tool from GitHub to a directory of your choice, with the following command.

		$> git clone https://github.com/aws/efs-utils

4. Because you need the bash command make, you can install it with the following command if your operating system doesn't already have it. 

		$> sudo yum -y install make


### Linux AMI Instance

1. Build and install `amazon-efs-utils` as an RPM package

	a. Open a terminal on your client and navigate to the directory that has the cloned amazon-efs-utils package from GitHub (for example "/home/centos/efs-utils"). 

	b. If you haven't done so already, install the rpm-builder package with the following command. 

			$> sudo yum -y install rpm-build

	c. Build the package with the following command.

			$> sudo make rpm

	d. Install the `amazon-efs-utils` package with the following command.

			$> sudo yum -y install ./build/amazon-efs-utils*rpm


2. Make a directory called `efs` to mount on it:

		$> sudo mkdir efs

3. Go back to the **EFS Attach** window (in the [EFS console](https://console.aws.amazon.com/efs/)). Mount your file system as your new directory.

		$> sudo mount -t efs -o tls fs-38920a40:/ efs

4. Verify your file system has been successfully mounted by running the following command:

		$> df -h 


5. Create a test file in your new file system by running a simple dd command to generate a 1GiB file in your new directory. Run the following dd command in your SSH window:

		$> sudo dd if=/dev/zero of=~/efs/1GiB bs=1M count=1024 status=progress




### Ubuntu AMI Instance


1. Build and install `amazon-efs-utils` as a DEB package

	a. Open a terminal on your client and navigate to the directory that has the cloned amazon-efs-utils package from GitHub.  

	b. Install the binutils package, a dependency for building DEB packages. 

			$> sudo apt-get -y install binutils

	c. Build the package with the following command.

			$> ./build-deb.sh

	d. Install the package with the following command.

			$> sudo apt-get -y install ./build/amazon-efs-utils*deb


2. Make a directory called `efs` to mount on it:

		$> sudo mkdir efs

3. Go back to the **EFS Attach** window (in the [EFS console](https://console.aws.amazon.com/efs/)). Mount your file system as your new directory.

		$> sudo mount -t efs -o tls fs-38920a40:/ efs
		
4. Verify your file system has been successfully mounted by running the following command:

		$> df -h 


5. Create a test file in your new file system by running a simple dd command to generate a 1GiB file in your new directory. Run the following dd command in your SSH window:

		$> sudo dd if=/dev/zero of=~/efs/1GiB bs=1M count=1024 status=progress