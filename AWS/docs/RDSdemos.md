# Getting started with Amazon RDS



## Setting up for Amazon RDS

General configurations you need to do before starting the RDS databases, you should have an AWS account and you already have access to the AWS console, then chack the following:

- [Create an IAM user](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SettingUp.html#CHAP_SettingUp.IAM)
- [Determine requirements](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SettingUp.html#CHAP_SettingUp.Requirements)
- [Provide access to your DB instance in your VPC by creating a security group ](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_SettingUp.html#CHAP_SettingUp.SecurityGroup)

<br>

--------------------------------------------

## Managing Databases in AWS

Before craeting a DB in AWS RDS, you need to decide on:

1. AWS Region
2. Availability Zone (Subnet), local Zone, or Multi AZ
3. DB instance class or type that will run the DB instance

Then you can start **creating, configuring, backing up, restoring, and managing** a database instance.



### Configuring an Amazon RDS DB instance

This section shows how to set up your Amazon RDS DB instance. Before creating a DB instance, decide on the DB instance class that will run the DB instance. Also, decide where the DB instance will run by choosing an AWS Region. Next, create the DB instance. 


- [Creating an Amazon RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreateDBInstance.html)
- [Connecting to an Amazon RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_CommonTasks.Connect.html)
- [Working with option groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithOptionGroups.html)
- [Working with DB parameter groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithParamGroups.html)



### Managing an Amazon RDS DB instance

Following, you can find instructions for managing and maintaining your Amazon RDS DB instance. 



- [Stopping an Amazon RDS DB instance temporarily](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StopInstance.html)
- [Starting an Amazon RDS DB instance that was previously stopped](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_StartInstance.html)
- [Modifying an Amazon RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html)
- [Maintaining a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Maintenance.html)
- [Upgrading a DB instance engine version](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Upgrading.html)
- [Renaming a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RenameInstance.html)
- [Rebooting a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RebootInstance.html)
- [Working with read replicas](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ReadRepl.html)
- [Tagging Amazon RDS resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html)
- [Working with Amazon Resource Names (ARNs) in Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.ARN.html)
- [Working with storage for Amazon RDS DB instances](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIOPS.StorageTypes.html)
- [Deleting a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteInstance.html)






### Backing up and restoring an Amazon RDS DB instance

This section shows how to back up and restore a DB instance. 


- [Working with backups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html)
- [Creating a DB snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CreateSnapshot.html)
- [Restoring from a DB snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_RestoreFromSnapshot.html)
- [Copying a snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_CopySnapshot.html)
- [Sharing a DB snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ShareSnapshot.html)
- [Exporting DB snapshot data to Amazon S3](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ExportSnapshot.html)
- [Restoring a DB instance to a specified time](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PIT.html)
- [Deleting a snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteSnapshot.html)
- [Tutorial: Restore a DB instance from a DB snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.RestoringFromSnapshot.html)




### Monitoring an Amazon RDS DB instance

This section shows you how to monitor Amazon RDS. 



- [Overview of monitoring Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/MonitoringOverview.html)
- [DB instance status](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Status.html)
- [Using Amazon RDS recommendations](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Recommendations.html)
- [Enhanced Monitoring](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html)
- [Using Amazon RDS Performance Insights](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_PerfInsights.html)
- [Using Amazon RDS event notification](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Events.html)
- [Viewing Amazon RDS events](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ListEvents.html)
- [Getting CloudWatch Events and Amazon EventBridge events for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/rds-cloud-watch-events.html)
- [Amazon RDS database log files](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_LogAccess.html)



<br>

--------------------------------------------



## Start Working with AWS RDS and DB engines

In this Section, you can strat trying the RDS in AWS with many DB engines, by trying the following:

1. Demos
2. Tutorials
3. Best Practices


### Demos

In the following examples, you can find how to create and connect to a DB instance using Amazon Relational Database Service (Amazon RDS). You can create a DB instance that uses MariaDB, MySQL, Microsoft SQL Server, Oracle, or PostgreSQL. 

Creating a DB instance and connecting to a database on a DB instance is slightly different for each of the DB engines. Choose one of the following DB engines that you want to use for detailed information on creating and connecting to the DB instance. After you have created and connected to your DB instance, there are instructions to help you delete the DB instance.


- [Creating a MariaDB DB instance and connecting to a database on a MariaDB DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.MariaDB.html)
- [Creating a Microsoft SQL Server DB instance and connecting to a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.SQLServer.html)
- [Creating a MySQL DB instance and connecting to a database on a MySQL DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.MySQL.html)
	- [Create and Connect to a MySQL Database](https://aws.amazon.com/getting-started/hands-on/create-mysql-db/)
	- [How to Install MySQL on Ubuntu 18.04](https://linuxize.com/post/how-to-install-mysql-on-ubuntu-18-04/)
	- [How to Manage & Create MySQL Users, Databases & Tables](https://www.a2hosting.com/kb/developer-corner/mysql/managing-mysql-databases-and-users-from-the-command-line)
- [Creating an Oracle DB instance and connecting to a database on an Oracle DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.Oracle.html)
- [Creating a PostgreSQL DB instance and connecting to a database on a PostgreSQL DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.PostgreSQL.html)
	- [Create and Connect to a PostgreSQL Database](https://aws.amazon.com/getting-started/tutorials/create-connect-postgresql-db/)
	- [How To Install and Use PostgreSQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
	- [The PostgreSQL Describe Table Statement](https://kb.objectrocket.com/postgresql/the-postgresql-describe-table-statement-853)
	- [How to fix “ERROR: column c.relhasoids does not exist” in Postgres?](https://stackoverflow.com/questions/58461178/how-to-fix-error-column-c-relhasoids-does-not-exist-in-postgres)
- [Tutorial: Create a web server and an Amazon RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/TUT_WebAppWithRDS.html)


#### Troubleshooting for Amazon RDS 

- [Troubleshooting for Amazon RDS](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Troubleshooting.html#CHAP_Troubleshooting.Connecting)

### Tutorials


The following tutorials show you how to perform common tasks that use Amazon RDS: 

- [Tutorial: Create an Amazon VPC for use with a DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html)

- [Tutorial: Create a web server and an Amazon RDS DB instance](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/TUT_WebAppWithRDS.html)

- [Tutorial: Restore a DB instance from a DB snapshot](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.RestoringFromSnapshot.html)








### Best practices for Amazon RDS


Learn best practices for working with Amazon RDS. As new best practices are identified, we will keep this section up to date. 



- [Amazon RDS basic operational guidelines](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.DiskPerformance)
- [DB instance RAM recommendations](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.Performance.RAM)
- [Using Enhanced Monitoring to identify operating system issues](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.EnhancedMonitoring)
- [Using metrics to identify performance issues](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.UsingMetrics)
- [Best practices for working with MySQL storage engines](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.MySQLStorage)
- [Best practices for working with MariaDB storage engines](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.MariaDB)
- [Best practices for working with Oracle](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.Oracle)
- [Best practices for working with PostgreSQL](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.PostgreSQL)
- [Best practices for working with SQL Server](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.SQLServer)
- [Working with DB parameter groups](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.DBParameterGroup)
- [Amazon RDS new features and best practices presentation video](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html#CHAP_BestPractices.Presentation)

<br>

------------------------------------------




