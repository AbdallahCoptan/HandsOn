# Storage on Amazon Web Services


Storage is a large part of every enterprise architecture. Building and maintaining your own storage repository is complex, expensive, and time-consuming. Like computing, you don't want to underprovision or overprovision for your storage needs. And as your application grows, so does the amount of data that comes along with it. You want to ensure that you're prepared for this type of change in storage demands. 

AWS offers a complete range of cloud storage services to support both:

- application requirements, as well as 
- archival and compliance requirements. 



AWS storage options enable customers to store and access their data over the internet in:

1. a durable, 
2. reliable, and 
3. cost-effective manner. 

## Storage Scenario

When you have a corporate address book application which is hosted on a web page. This application has many types of data/information, such as static and dynamic content. There are images for each contact, as well as information about each contact, like their name and location.

The images, files, and  videos in such applications should be stored in a storage volume such as Amazon S3. And information for each contact, like their name and location, is coming from Amazon Relational Database Service, or Amazon RDS.  In addition to this, we also need to store the static content that is the actual HTML document for the site.   

**So why are we storing images in S3, but contact in RDS?**

To answer this question, we come up with a classification for the storage on AWS:

- object-level storage
- block-level storage

S3 is what we call object-level storage, whereas RDS runs on block-level storage.


## [Object vs. block]-level Storage

Object-level strorage works like this, If you have an image, like what we have in the previous scenario, and you want to update that image, **you have to update the entire file**. So the whole file's going to change. In contrast, databases like Amazon RDS run on top of block-level storage.  How this works is if we wanted to change the location for a contact, we could just change the corresponding blocks. We do not need to update the entire data file for every single change. For object storage, we use Amazon S3. This provides highly durable and scalable stores for items like images, videos, text files, and more. Storage for databases and EC2 instances use **block-level storage**,like Amazon Elastic Block Storage, or EBS. For **file storage and shared file systems**, Amazon offers Amazon Elastic File System, or Amazon EFS. 


![](oVb.png)

| Storage    	| Object-level               	| Block-level                       	|
|------------	|----------------------------	|-----------------------------------	|
| Formate    	| Images, files,  and videos 	| Distributed files,  and Databases 	|
| Service(s) 	| Amazon S3                  	| EC2 instance store, Amazon EBS,  and Amazon EFS       	|