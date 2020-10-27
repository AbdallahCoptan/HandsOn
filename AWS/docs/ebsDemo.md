# Amazon EBS Demo


Amazon Elastic Block Store (Amazon EBS) provides **persistent** __block storage__ volumes for use with Amazon EC2 instances in the AWS Cloud. Each Amazon EBS volume is _automatically replicated inside an Availability Zone_ to protect you from component failure, which offers high availability and durability. Amazon EBS volumes offer the **consistent and low-latency performance** that you need to run your workloads.

Amazon EBS provides a range of options that allow you to optimize storage performance and cost for your workload. These options are divided into two major categories:

- Solid State Drive (SSD)-backed storage for transactional workloads, such as 
	- databases and 
	- boot volumes (performance depends primarily on IOPS)

- Hard Disk Drive (HDD)-backed storage for throughput-intensive workloads, such as 
	- MapReduce and 
	- log processing (performance depends primarily on MB/s).

##### Note: EBS types and services quotas

1. Before using the Amazon EBS block storage, you need to check the types of the EBS volumes very carfuly, by checking Amazon [EBS volume types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html).
2. As your account is limited on the number of EBS volumes that you can use, For more information about these limits, see [Amazon EC2 Service Quotas](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html).
3. How to request an increase in your limits, see [Requesting a quota increase](https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html).



The Elastic Volume feature of Amazon EBS allows you to:

- dynamically increase capacity, 
- tune performance, and 
- change the type of live volumes with no downtime or performance impact. 

This allows you to easily right-size your deployment and adapt to performance changes.

Pricing for Amazon EBS is based on the amount (volume) and type of Amazon EBS volume that you provision. For pricing information, see: [https://aws.amazon.com/ebs/pricing/](https://aws.amazon.com/ebs/pricing/). Confirm that you are looking at cost in the correct Region.

Full details on Amazon EBS are available here: [https://aws.amazon.com/ebs](https://aws.amazon.com/ebs) 


## Important feature in Amazone EBS

EBS provides the most common block storage you will use at AWS. When you launch your EC2 instance, you're going to need some kind of block storage to go with it. It's part of the boot volume or maybe it's a separate data volume. AWS has racks of unused storage that you can provision to sizes as large as you need up to many terabytes in size.

When you launch the EC2 instance, the boot volume can attach directly to your EC2 instance, as well as the data volume. **These volumes live independent of the EC2 instance themselves**. In fact, they may already exist before your EC2 instance launches.
When it launches, it simply finds the volume and attaches it the same way you might have an old drive from a laptop.

As in the following image, The EC2 instance, when it connects to the EBS volumes, now has a direct communication to these volumes.
Nobody else can talk directly to them. It's how AWS maintains secure communications at all times.

![](EBS(2).png) 



The EBS volumes have a lifecycle independent of EC2. What does this mean? Let's say that this EC2 instance is part of a developer machine that over the weekend, nobody is using because your developers go home over the weekend. So, during those 48 hours, 72 hours,
there's no reason to be paying for EC2 because nobody is using it. All you have to do is simply stop the instance. When you stop EC2,
the EBS volumes survive. They just simply are no longer connected to the EC2 instance. See the following image.


![](EBS(1).png)

Then, Monday morning comes around, your developer starts up an EC2 instance, and a brand new instance is created. It reattaches those same EBS volumes the same way you would simply shut down your laptop over the weekend and start it again on Monday. But over the weekend, you didn't have to pay for EC2. But there's more we can take advantage of the idea that EBS lives outside of EC2 because what if I want a more powerful machine? Just like I could take your hard drives out of your existing laptop and put it in a stronger laptop, at AWS, you can simply provision a newer, bigger EC2 instance, stop the old EC2 instance, and then just attach the volumes to your brand new EC2. So, now, I've got the same boot volume, the same applications, the same data only running newer, bigger, stronger. It's one of the many advantages EBS brings to you as part of AWS


![](EBS.png)


## Difference between EBS and Instance Store

EC2 instances support two types for block level storage: 
- EC2 Instances can be launched using either Elastic Block Store (EBS) or 
- Instance Store volume as root volumes and additional volumes.


**EBS volume** is network attached drive which results in slow performance but data is persistent meaning even if you reboot the instance data will be there.

**Instance store** provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer.


#### Note
EC2 instances can be launched by choosing between **AMIs** backed by EC2 instance store and AMIs backed by EBS. However, AWS recommends use of EBS backed AMIs, because they launch faster and use persistent storage, please see the [AMIs Categories](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html).




![](instanceStor_VS_EBS.png)


For more information, please check [AWS — Difference between EBS and Instance Store](https://medium.com/awesome-cloud/aws-difference-between-ebs-and-instance-store-f030c4407387).



## Demonestrations: Creating an Amazon EBS volume  

You can create an Amazon EBS volumes, by the following three ways:

1. The root storage through launching instance wizard
2. Create a new EBS volume and attached it to a new/old instance
3. Create from a saved snapshot.



### Demo: EBS as a root storage for EC2 instances

This this demo shows how to use the EBS storage as a root storage while launching your EC2 instance.

Please follow the following steps:

1. Start launching your EC2 instance, by following the [Launch Instance Wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html)
2. In [Step 4: Add Storage](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html#step-4-add-storage), you can change your volume size, encrypte its data, and uncheck the deletion after instance termination.
3. If you terminate the instance, you will find this voulume exists and avialble for attachment.
4. To attach this old volume, see [Attaching an Amazon EBS volume to an instance](EBS.md#attaching-an-amazon-ebs-volume-to-an-instance).
5. To mount this old volume, see [Mount an attached volume](EBS.md#format-and-mount-an-attached-volume).
		
		/!\ Note
		Mounting an attached volume, is not the same for different types of AMIs, so Windows, not the same like Linux.

6. To demount and de-attaching, and deleting the volume, see [Releasing an Amazon EBS volume](EBS.md#releasing-an-amazon-ebs-volume).





### Demo: Create an empty EBS volume and attach it to a running instance

This this demo shows how to craete an empty volume and attach it to an EC2 instance.

Please follow the following steps:

1. Start launching your EC2 instance, by following the [Launch Instance Wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html)
2. In [Step 2: Choose an Instance Type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html#choose-an-instance-type-page), choose zour favorite **availability zone**, it is not agood idea to keep it randome choise at this moment. 
3. Start creating an empty EBS volume, see [create empty EBS volume through the console](EBS.md#to-create-a-empty-ebs-volume-using-the-console).
		
		/!\ Note
		The New empty volume and the EC2 instance have to be in the same availability zone 

4. Attaching this new volume, see [Attaching an Amazon EBS volume to an instance](EBS.md#attaching-an-amazon-ebs-volume-to-an-instance).
5. Mounting this new volume, see [Mount an attached volume](EBS.md#format-and-mount-an-attached-volume).
		
		/!\ Note
		Mounting an attached volume, is not the same for different types of AMIs, so Windows, not the same like Linux. 

6. To demount and de-attaching, and deleting the volume, see [Releasing an Amazon EBS volume](EBS.md#releasing-an-amazon-ebs-volume).


### Demo: Create an EBS volume from a previously created snapshot and attach it to a running instance

This this demo shows how to create an EBS volume from a **snapshot** and attach it to an EC2 instance, see [Creating Amazon EBS snapshots](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-snapshot.html).


#### Creating a snapshot for an EBS volume

To create a snapshot for an EBS volume, you should have already an EC2 instance running with a an EBS root volume or an exist volume, to do so see this [demo](ebsDemo.md#demo-ebs-as-a-root-storage-for-ec2-instances), then follow the folllowing steps:


1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. Choose **Snapshots** under **Elastic Block Store** in the navigation pane.

3. Choose Create Snapshot.

4. For Select **resource type**, choose **Volume**.

5. For **Volume**, select the **volume**.

6. (Optional) Enter a description for the snapshot.

7. (Optional) Choose **Add Tag** to add tags to your snapshot. For each tag, provide a tag key and a tag value.

8. Choose **Create Snapshot**.


**To create a snapshot using the command line**

You can use one of the following commands. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).

- [create-snapshot](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-snapshot.html)(AWS CLI)

- [New-EC2Snapshot](https://docs.aws.amazon.com/powershell/latest/reference/items/New-EC2Snapshot.html) (AWS Tools for Windows PowerShell)


#### Creating a multi-volume snapshot

Use the following procedure to create a snapshot from the volumes of an instance.

To create a snapshot for multi-EBS volumes, you should have already an EC2 instance running with multiple EBS volumes, to do so see this [demo](ebsDemo.md#demo-ebs-as-a-root-storage-for-ec2-instances), To create multi-volume snapshots using the console:


1. Open the Amazon EC2 console at [https://console.aws.amazon.com/ec2/](https://console.aws.amazon.com/ec2/).

2. Choose **Snapshots** under **Elastic Block Store** in the navigation pane.

3. Choose Create Snapshot.

4. For Select **resource type**, choose **Instance**.

5. Select the instance ID for which you want to create simultaneous backups for all of the attached EBS volumes. Multi-volume snapshots support up to 40 EBS volumes per instance. 

6. (Optional) Set **Exclude root volume**. 

7. (Optional) Set **Copy tags** from volume flag to automatically copy tags from the source volume to the corresponding snapshots. This sets snapshot metadata—such as access policies, attachment information, and cost allocation—to match the source volume. 

8. (Optional) Choose **Add Tag** to add tags to your snapshot. For each tag, provide a tag key and a tag value.

9. Choose **Create Snapshot**.

    During snapshot creation, the snapshots are managed together. If one of the snapshots in the volume set fails, the other snapshots are moved to error status for the volume set. You can monitor the progress of your snapshots using CloudWatch Events. After the snapshot creation process completes, CloudWatch generates an event that contains the status and all of the relevant snapshots details for the affected instance.



**To create multi-volume snapshots using the command line**

You can use one of the following commands. For more information about these command line interfaces, see [Accessing Amazon EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html#access-ec2).

- [create-snapshot](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-snapshot.html)(AWS CLI)

- [New-EC2SnapshotBatch](https://docs.aws.amazon.com/powershell/latest/reference/items/New-EC2SnapshotBatch.html) (AWS Tools for Windows PowerShell)


#### Other operations for the volumes Snapshots

You can copy snapshots, share snapshots, and create volumes from snapshots. For more information, see the following:

- [Copying an Amazon EBS snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-copy-snapshot.html)

- [Sharing an Amazon EBS snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-modifying-snapshot-permissions.html)

- [Creating a volume from a snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-creating-volume.html#ebs-create-volume-from-snapshot)




#### Creating a volume from a snapshot

Please follow the following steps:

1. Start launching your EC2 instance, by following the [Launch Instance Wizard](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html)
2. In [Step 2: Choose an Instance Type](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/launching-instance.html#choose-an-instance-type-page), choose zour favorite **availability zone**, it is not agood idea to keep it randome choise at this moment. 
3. Start creating an EBS volume from a snapshot, see [Create an EBS Volume from a Snapshot](EBS.md#to-create-an-ebs-volume-from-a-snapshot-using-the-console). 
4. Attaching this new volume, see [Attaching an Amazon EBS volume to an instance](EBS.md#attaching-an-amazon-ebs-volume-to-an-instance).
5. Mounting this new volume, see [Mount an attached volume](EBS.md#format-and-mount-an-attached-volume).
		
		/!\ Note
		Mounting an attached volume, is not the same for different types of AMIs, so Windows, not the same like Linux. 

6. To demount and de-attaching, and deleting the volume, see [Releasing an Amazon EBS volume](EBS.md#releasing-an-amazon-ebs-volume).




### Demo: Attach an EBS volume to a Windows AMI instance