# Amazon EBS volumes

An Amazon EBS volume is a durable, block-level storage device that you can attach to your instances. After you attach a volume to an instance, you can use it as you would use a physical hard drive. EBS volumes are flexible. For current-generation volumes attached to current-generation instance types, you can dynamically increase size, modify the provisioned IOPS capacity, and change volume type on live production volumes.

You can use EBS volumes as primary storage for data that requires frequent updates, such as the system drive for an instance or storage for a database application. You can also use them for throughput-intensive applications that perform continuous disk scans. EBS volumes persist independently from the running life of an EC2 instance.

You can attach multiple EBS volumes to a single instance. The volume and instance must be in the same Availability Zone. Depending on the volume and instance types, you can use [Multi-Attach](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes-multi.html) to mount a volume to multiple instances at the same time.

Amazon EBS provides the following volume types: General Purpose SSD (`gp2`), Provisioned IOPS SSD (`io1`), Throughput Optimized HDD (`st1`), Cold HDD (`sc1`), and Magnetic (`standard`, a previous-generation type). They differ in performance characteristics and price, allowing you to tailor your storage performance and cost to the needs of your applications. For more information, see [Amazon EBS volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html).


Your account has a limit on the number of EBS volumes that you can use, and the total storage available to you. For more information about these limits, and how to request an increase in your limits, see [Amazon EC2 Service Quotas](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html).


## What to know befor creating an EBS volume



1. [Benefits of using EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes.html#EBSFeatures)
2. [Amazon EBS volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)
3. [Constraints on the size and configuration of an EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_constraints.html)



## Creating an Amazon EBS volume

You can create an Amazon EBS volume and then attach to any EC2 instance in the same Availability Zone. If you create an encrypted EBS volume, you can only attach it to supported instance types. For more information, see [Supported instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances). 


If you are creating a volume for a high-performance storage scenario, you should make sure to use a Provisioned IOPS SSD (io1) volume and attach it to an instance with enough bandwidth to support your application, such as an EBS-optimized instance or an instance with 10-Gigabit network connectivity. The same advice holds for Throughput Optimized HDD (st1) and Cold HDD (sc1) volumes. For more information, see [Amazon EBS–optimized instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html). 

Empty EBS volumes receive their maximum performance the moment that they are available and do not require initialization (formerly known as pre-warming). However, storage blocks on volumes that were created from snapshots must be initialized (pulled down from Amazon S3 and written to the volume) before you can access the block. This preliminary action takes time and can cause a significant increase in the latency of an I/O operation the first time each block is accessed. Volume performance is achieved after all blocks have been downloaded and written to the volume. For most applications, amortizing this cost over the lifetime of the volume is acceptable. To avoid this initial performance hit in a production environment, you can force immediate initialization of the entire volume or enable fast snapshot restore. For more information, see [Initializing Amazon EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-initialize.html).



### Methods of creating a volume

- Create and attach EBS volumes when you launch instances by specifying a block device mapping. For more information, see [Launching an instance using the Launch Instance Wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html) and [Block device mapping](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html).

- Create an empty EBS volume and attach it to a running instance. For more information, see [Creating an empty volume](#creating-an-empty-volume) below.

- Create an EBS volume from a previously created snapshot and attach it to a running instance. For more information, see [Creating a volume from a snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html#ebs-create-volume-from-snapshot) below.




### Creating an empty volume

Empty volumes receive their maximum performance the moment that they are available and **do not require initialization**. 

#### To create a empty EBS volume using the console

1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. From the navigation bar, select the Region in which you would like to create your volume. This choice is important because some Amazon EC2 resources can be shared between Regions, while others can't. For more information, see [Resource locations](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/resources.html).

3. In the navigation pane, choose **ELASTIC BLOCK STORE, Volumes**.

4. Choose **Create Volume**.

5. For **Volume Type**, choose a volume type. For more information, see [Amazon EBS volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html).

6. For **Size (GiB)**, type the size of the volume. For more information, see [Constraints on the size and configuration of an EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_constraints.html).

7. With a Provisioned IOPS SSD volume, for **IOPS**, type the maximum number of input/output operations per second (IOPS) that the volume should support.

8. For **Availability Zone**, choose the Availability Zone in which to create the volume. EBS volumes can only be attached to EC2 instances within the same Availability Zone.

9. (Optional) If the instance type supports EBS encryption and you want to encrypt the volume, select **Encrypt this volume** and choose a **CMK**. If encryption by default is enabled in this Region, EBS encryption is enabled and the default CMK for EBS encryption is chosen. You can choose a different CMK from **Master Key** or paste the full ARN of any key that you can access. For more information, see [Amazon EBS encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html).

10. (Optional) Choose **Create additional tags** to add tags to the volume. For each tag, provide a tag key and a tag value. For more information, see [Tagging your Amazon EC2 resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html).

11. Choose **Create Volume**. The volume is ready for use when the volume status is **Available**.

To use your new volume, attach it to an instance, format it, and mount it. For more information, see [Attaching an Amazon EBS volume to an instance](#attaching-an-amazon-ebs-volume-to-an-instance).




#### To create an empty EBS volume using the command line

You can use one of the following commands. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).

- [create-volume](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-volume.html) (AWS CLI)

- [New-EC2Volume](https://docs.aws.amazon.com/powershell/latest/reference/items/New-EC2Volume.html) (AWS Tools for Windows PowerShell)


### Creating a volume from a snapshot


Volumes created from snapshots load lazily in the background. This means that there is no need to wait for all of the data to transfer from Amazon S3 to your EBS volume before the instance can start accessing an attached volume and all its data. If your instance accesses data that hasn't yet been loaded, the volume immediately downloads the requested data from Amazon S3, and then continues loading the rest of the volume data in the background. Volume performance is achieved after all blocks are downloaded and written to the volume. To avoid the initial performance hit in a production environment, see  [Initializing Amazon EBS volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-initialize.html).


New EBS volumes that are created from encrypted snapshots are automatically encrypted. You can also encrypt a volume on-the-fly while restoring it from an unencrypted snapshot. Encrypted volumes can only be attached to instance types that support EBS encryption. For more information, see [Supported instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances).

#### To create an EBS volume from a snapshot using the console

1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. From the navigation bar, select the Region that your snapshot is located in.

	To use the snapshot to create a volume in a different region, copy your snapshot to the new Region and then use it to create a volume in that Region. For more information, see [Copying an Amazon EBS snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html).

3. In the navigation pane, choose **ELASTIC BLOCK STORE, Volumes**.

4. Choose **Create Volume**.

5. For **Volume Type**, choose a volume type. For more information, see [Amazon EBS volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html).

6. For **Snapshot ID**, start typing the ID or description of the snapshot from which you are restoring the volume, and choose it from the list of suggested options.

7. (Optional) Select **Encrypt this volume** to change the encryption state of your volume. This is optional if [encryption by default](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#encryption-by-default) is enabled. Select a CMK from Master Key to specify a CMK other than the default CMK for EBS encryption.

8. For **Size (GiB)**, type the size of the volume, or verify that the default size of the snapshot is adequate.

	If you specify both a volume size and a snapshot, the size must be equal to or greater than the snapshot size. When you select a volume type and a snapshot, the minimum and maximum sizes for the volume are shown next to Size. For more information, see [Constraints on the size and configuration of an EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_constraints.html).

9. With a Provisioned IOPS SSD volume, for **IOPS**, type the maximum number of input/output operations per second (IOPS) that the volume should support.

10. For **Availability Zone**, choose the Availability Zone in which to create the volume. EBS volumes can only be attached to EC2 instances in the same Availability Zone.

11. (Optional) Choose **Create additional tags** to add tags to the volume. For each tag, provide a tag key and a tag value.

12. Choose **Create Volume**.

13. To use your new volume, attach it to an instance and mount it. For more information, see [Attaching an Amazon EBS volume to an instance](#attaching-an-amazon-ebs-volume-to-an-instance).

14. If you created a volume that is larger than the snapshot, you must extend the file system on the volume to take advantage of the extra space. For more information, see [Amazon EBS Elastic Volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modify-volume.html).




#### To create an EBS volume from a snapshot using the command line

You can use one of the following commands. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).

- [create-volume](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-volume.html) (AWS CLI)

- [New-EC2Volume](https://docs.aws.amazon.com/powershell/latest/reference/items/New-EC2Volume.html) (AWS Tools for Windows PowerShell)

## Attaching an Amazon EBS volume to an instance

You can attach an available EBS volume to one or more of your instances that is in the same Availability Zone as the volume. 

### Prerequisites

- Determine how many volumes you can attach to your instance. For more information, see [Instance volume limits](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/volume_limits.html).

- Determine whether you can attach your volume to multiple instances and enable Multi-Attach. For more information, see [Attaching a volume to multiple instances with Amazon EBS Multi-Attach](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes-multi.html).

- If a volume is encrypted, it can only be attached to an instance that supports Amazon EBS encryption. For more information, see [Supported instance types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html#EBSEncryption_supported_instances).

- If a volume has an AWS Marketplace product code:

	- The volume can only be attached to a stopped instance.

    - You must be subscribed to the AWS Marketplace code that is on the volume.

    - The configuration (instance type, operating system) of the instance must support that specific AWS Marketplace code. For example, you cannot take a volume from a Windows instance and attach it to a Linux instance.

    - AWS Marketplace product codes are copied from the volume to the instance.


### To attach an EBS volume to an instance using the console

1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. In the navigation pane, choose **Elastic Block Store, Volumes**.

3. Select an available volume and choose **Actions, Attach Volume**.

4. For **Instance**, start typing the name or ID of the instance. Select the instance from the list of options (only instances that are in the same Availability Zone as the volume are displayed).

5. For **Device**, you can keep the suggested device name, or type a different supported device name. For more information, see [Device naming on Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html).

6. Choose **Attach**.

7. Connect to your instance and mount the volume. For more information, see [Making an Amazon EBS volume available for use on Linux](#making-an-amazon-ebs-volume-available-for-use-on-linux).


### To attach an EBS volume to an instance using the command line


You can use one of the following commands. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).

- [attach-volume](https://docs.aws.amazon.com/cli/latest/reference/ec2/attach-volume.html) (AWS CLI)

- [Add-EC2Volume](https://docs.aws.amazon.com/powershell/latest/reference/items/Add-EC2Volume.html) (AWS Tools for Windows PowerShell)


### More advanced attachment

- [Attaching a volume to multiple instances with Amazon EBS Multi-Attach ](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes-multi.html)



## Making an Amazon EBS volume available for use on Linux


After you attach an Amazon EBS volume to your instance, it is exposed as a block device. You can format the volume with any file system and then mount it. After you make the EBS volume available for use, you can access it in the same ways that you access any other volume. Any data written to this file system is written to the EBS volume and is transparent to applications using the device. 


You can take snapshots of your EBS volume for backup purposes or to use as a baseline when you create another volume. For more information, see [Amazon EBS snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html). 


### Format and mount an attached volume

Suppose that you have an EC2 instance with an EBS volume for the root device, `/dev/xvda`, and that you have just attached an empty EBS volume to the instance using `/dev/sdf`. Use the following procedure to make the newly attached volume available for use. 

**To format and mount an EBS volume on Linux**

1. Connect to your instance using SSH. For more information, see [Connect to your Linux instance](#connecting-to-your-linux-ec2-instances).

2. The device could be attached to the instance with a different device name than you specified in the block device mapping. For more information, see [Device naming on Linux instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html). Use the **`lsblk`** command to view your available disk devices and their mount points (if applicable) to help you determine the correct device name to use. The output of **`lsblk`** removes the `/dev/` prefix from full device paths. 


	The following is example output for a T2 instance. The root device is `/dev/xvda`. The attached volume is not attached yet (it will be `/dev/xvdf`),
		
		ubuntu@ip-172-31-38-59:~$ lsblk
		NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
		xvda    202:0    0    8G  0 disk 
		└─xvda1 202:1    0    8G  0 part /
		loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
		loop2     7:2    0   97M  1 loop /snap/core/9665
		loop3     7:3    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
		loop4     7:4    0 96.6M  1 loop /snap/core/9804

	The following is example output for a T2 instance. The root device is `/dev/xvda`. The attached volume (**5G**) is `/dev/xvdf`, which is not yet mounted. 

		ubuntu@ip-172-31-38-59:~$ lsblk
		NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
		xvda    202:0    0    8G  0 disk 
		└─xvda1 202:1    0    8G  0 part /
		xvdf    202:80   0    5G  0 disk
		loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
		loop2     7:2    0   97M  1 loop /snap/core/9665
		loop3     7:3    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
		loop4     7:4    0 96.6M  1 loop /snap/core/9804	

3. Determine whether there is a file system on the volume. New volumes are raw block devices, and you must create a file system on them before you can mount and use them. Volumes that were created from snapshots likely have a file system on them already; if you create a new file system on top of an existing file system, the operation overwrites your data. 

	Use the **`file -s`** command to get information about a device, such as its file system type. If the output shows simply **`data`**, as in the following example output, there is no file system on the device and you must create one.

		ubuntu@ip-172-31-38-59:~$ sudo file -s /dev/xvdf
		/dev/xvdf: data

	If the device has a file system, the command shows information about the file system type. For example, the following output shows a root device with the XFS file system. 

		ubuntu@ip-172-31-38-59:~$ sudo file -s /dev/xvda1
		/dev/xvda1: Linux rev 1.0 ext4 filesystem data, UUID=aff0a17d-b917-4350-93b2-3a2eab2067bc, volume name "cloudimg-rootfs" (needs journal recovery) (extents) (large files) (huge files)


4. (Conditional) If you discovered that there is a file system on the device in the previous step, skip this step. If you have an empty volume, use the **`mkfs -t`** command to create a file system on the volume.
```
/!\ Important Warning
Do not use this command if you're mounting a volume that already has data on it (for example, a volume that was created from a snapshot). Otherwise, you'll format the volume and delete the existing data.
```

		ubuntu@ip-172-31-38-59:~$ sudo mkfs -t xfs /dev/xvdf
		meta-data=/dev/xvdf              isize=512    agcount=4, agsize=327680 blks
		         =                       sectsz=512   attr=2, projid32bit=1
		         =                       crc=1        finobt=1, sparse=0
		data     =                       bsize=4096   blocks=1310720, imaxpct=25
		         =                       sunit=0      swidth=0 blks
		naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
		log      =internal log           bsize=4096   blocks=2560, version=2
		         =                       sectsz=512   sunit=0 blks, lazy-count=1
		realtime =none                   extsz=4096   blocks=0, rtextents=0

	
If you get an error that `mkfs.xfs` is not found, use the following command to install the XFS tools and then repeat the previous command: 

		ubuntu@ip-172-31-38-59:~$ sudo yum install xfsprogs


5. Use the `mkdir` command to create a mount point directory for the volume. The mount point is where the volume is located in the file system tree and where you read and write files to after you mount the volume. The following example creates a directory named `/data`. 

		ubuntu@ip-172-31-38-59:~$ sudo mkdir /data

6. Use the following command to mount the volume at the directory you created in the previous step. 

		ubuntu@ip-172-31-38-59:~$  sudo mount /dev/xvdf /data

7. Review the file permissions of your new volume mount to make sure that your users and applications can write to the volume. For more information about file permissions, see [File security](http://tldp.org/LDP/intro-linux/html/sect_03_04.html) at The Linux Documentation Project.

8. The mount point is not automatically preserved after rebooting your instance. To automatically mount this EBS volume after reboot, see [Automatically mount an attached volume after reboot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html#ebs-mount-after-reboot). 


### Check your instance's volume size

- First of all, you can check again your volume, if it is mounted or not , by 

		ubuntu@ip-172-31-38-59:~$ lsblk
		NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
		xvda    202:0    0    8G  0 disk 
		└─xvda1 202:1    0    8G  0 part /
		xvdf    202:80   0    5G  0 disk /data
		loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
		loop2     7:2    0   97M  1 loop /snap/core/9665
		loop3     7:3    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
		loop4     7:4    0 96.6M  1 loop /snap/core/9804

	you can see, the `xvdf` volume is mounted to the `/data/`, that is meant that the mounting has been successed.

- Use `df` command to check the volumes sizes:

		ubuntu@ip-172-31-38-59:~$ df
		Filesystem     1K-blocks    Used Available Use% Mounted on
		udev              499320       0    499320   0% /dev
		tmpfs             101444   10956     90488  11% /run
		/dev/xvda1       8065444 2087224   5961836  26% /
		tmpfs             507208       0    507208   0% /dev/shm
		tmpfs               5120       0      5120   0% /run/lock
		tmpfs             507208       0    507208   0% /sys/fs/cgroup
		/dev/loop1         18432   18432         0 100% /snap/amazon-ssm-agent/1566
		/dev/loop2         99328   99328         0 100% /snap/core/9665
		/dev/loop3         28800   28800         0 100% /snap/amazon-ssm-agent/2012
		/dev/loop4         98944   98944         0 100% /snap/core/9804
		tmpfs             101444       0    101444   0% /run/user/1000
		/dev/xvdf        5232640   32960   5199680   1% /data

	you can see the last volume `/dev/xvdf` detailes and it is mounted to the `/data`, if you want to see specific volume by:

		ubuntu@ip-172-31-38-59:~$ df /data/
		Filesystem     1K-blocks  Used Available Use% Mounted on
		/dev/xvdf        5232640 32964   5199676   1% /data

- Use your new volume, by navigating to `/data` and start add files:

		ubuntu@ip-172-31-38-59:~$ cd /data/
		ubuntu@ip-172-31-38-59:/data$ ls
		hydrosat  test.py


## Making an Amazon EBS volume available for use on Windows

You can get directions for volumes on a Windows instance from [Making a Volume Available for Use on Windows](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-using-volumes.html) in the Amazon EC2 User Guide for Windows Instances. 

You can get directions for volumes on a Windows instance from [Detaching a volume from a Windows instance](https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ebs-detaching-volume.html) in the Amazon EC2 User Guide for Windows Instances. 


## Releasing an Amazon EBS volume

In order to releasing an EBS volume, you need to:

1. Detaching the EBS volume
2. Deleting the EBS Volume

### Detaching an Amazon EBS volume from a Linux instance 

You can detach an Amazon EBS volume from an instance explicitly or by terminating the instance. However, if the instance is running, you must first unmount the volume from the instance.

If an EBS volume is the root device of an instance, you must stop the instance before you can detach the volume.

When a volume with an AWS Marketplace product code is detached from an instance, the product code is no longer associated with the instance. 


**`/!\ Important`**

After you detach a volume, you are still charged for volume storage as long as the storage amount exceeds the limit of the AWS Free Tier. You must delete a volume to avoid incurring further charges. For more information, see [Deleting an Amazon EBS volume](#deleting-an-amazon-ebs-volume). 


This example unmounts the volume and then explicitly detaches it from the instance. This is useful when you want to terminate an instance or attach a volume to a different instance. To verify that the volume is no longer attached to the instance, see [Viewing information about an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-describing-volumes.html).

You can reattach a volume that you detached (without unmounting it), but it might not get the same mount point. If there were writes to the volume in progress when it was detached, the data on the volume might be out of sync. 


#### To detach an EBS volume using the console

1. From your Linux instance, use the following command to unmount the `/dev/sdh` device.

		ubuntu@ip-172-31-38-59:~$ umount -d /dev/sdh

2. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

3. In the navigation pane, choose **Volumes**.

4. Select a volume and choose **Actions, Detach Volume**.

5. In the confirmation dialog box, choose **Yes, Detach**.


##### Example:

- Before `umount`

		ubuntu@ip-172-31-38-59:~$ lsblk
		NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
		xvda    202:0    0    8G  0 disk 
		└─xvda1 202:1    0    8G  0 part /
		xvdf    202:80   0    5G  0 disk /data
		loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
		loop2     7:2    0   97M  1 loop /snap/core/9665
		loop3     7:3    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
		loop4     7:4    0 96.6M  1 loop /snap/core/9804

- After `umount`

		ubuntu@ip-172-31-38-59:~$ sudo umount -d /data 
		ubuntu@ip-172-31-38-59:~$ lsblk
		NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
		xvda    202:0    0    8G  0 disk 
		└─xvda1 202:1    0    8G  0 part /
		xvdf    202:80   0    5G  0 disk 
		loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
		loop2     7:2    0   97M  1 loop /snap/core/9665
		loop3     7:3    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
		loop4     7:4    0 96.6M  1 loop /snap/core/9804


- After Detached

		ubuntu@ip-172-31-38-59:~$ lsblk
		NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
		xvda    202:0    0    8G  0 disk 
		└─xvda1 202:1    0    8G  0 part /
		loop1     7:1    0   18M  1 loop /snap/amazon-ssm-agent/1566
		loop2     7:2    0   97M  1 loop /snap/core/9665
		loop3     7:3    0 28.1M  1 loop /snap/amazon-ssm-agent/2012
		loop4     7:4    0 96.6M  1 loop /snap/core/9804


#### To detach an EBS volume using the command line

After unmounting the volume, you can use one of the following commands to detach it. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).

   - [detach-volume](https://docs.aws.amazon.com/cli/latest/reference/ec2/detach-volume.html) (AWS CLI)

   - [Dismount-EC2Volume](https://docs.aws.amazon.com/powershell/latest/reference/items/Dismount-EC2Volume.html) (AWS Tools for Windows PowerShell)



### Deleting an Amazon EBS volume

After you no longer need an Amazon EBS volume, you can delete it. After deletion, its data is gone and the volume can't be attached to any instance. However, before deletion, you can store a snapshot of the volume, which you can use to re-create the volume later. 


**`/!\ Important`**

You can't delete a volume if it's attached to an instance. To delete a volume, you must first detach it. For more information, see [Detaching an Amazon EBS volume from a Linux instance](#detaching-an-amazon-ebs-volume-from-a-linux-instance).

You can check if a volume is attached to an instance. In the console, on the **Volumes page**, you can view the state of your volumes.

   - If a volume is attached to an instance, it’s in the `in-use` state.

   - If a volume is detached from an instance, it’s in the `available` state. You can delete this volume.



#### To delete an EBS volume using the console

1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. In the navigation pane, choose **Volumes**.

3. Select a volume and choose **Actions, Delete Volume**. If **Delete Volume** is greyed out, the volume is attached to the instance.

4. In the confirmation dialog box, choose **Yes, Delete**.




#### To delete an EBS volume using the command line

You can use one of the following commands. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).


- [delete-volume](https://docs.aws.amazon.com/cli/latest/reference/ec2/delete-volume.html) (AWS CLI)

- [Remove-EC2Volume](https://docs.aws.amazon.com/powershell/latest/reference/items/Remove-EC2Volume.html) (AWS Tools for Windows PowerShell)


## Watch it here


### Create, attach, and mount a new EBS volume


<figure class="video_container">
<iframe width="560" height="315" src="https://www.youtube.com/embed/0xc1XXuuoS4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</figure>



### Detach, unmount, and delet an existing EBS volume

<figure class="video_container">
<iframe width="560" height="315" src="https://www.youtube.com/embed/K_t4NCYnwbM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></figure>


## More to do

- [Viewing information about an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-describing-volumes.html)
- [Replacing an Amazon EBS volume using a previous snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-restoring-volume.html)
- [Monitoring the status of your volumes](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/monitoring-volume-status.html)
- [Detaching an Amazon EBS volume from a Linux instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-detaching-volume.html)
- [Deleting an Amazon EBS volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-deleting-volume.html)