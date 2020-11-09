# Amazon Aurora

MySQL and PostgreSQL-compatible relational database built for the cloud. Performance and availability of commercial-grade databases at 1/10th the cost.


## Overview

[Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html) is a MySQL and PostgreSQL-compatible relational database built for the cloud, that combines the performance and availability of traditional enterprise databases with the simplicity and cost-effectiveness of open source databases.

Amazon Aurora is up to five times faster than standard MySQL databases and three times faster than standard PostgreSQL databases. It provides the security, availability, and reliability of commercial databases at 1/10th the cost. Amazon Aurora is fully managed by Amazon Relational Database Service (RDS), which automates time-consuming administration tasks like hardware provisioning, database setup, patching, and backups.

Amazon Aurora features a distributed, fault-tolerant, self-healing storage system that auto-scales up to 128TB per database instance. It delivers high performance and availability with up to 15 low-latency read replicas, point-in-time recovery, continuous backup to Amazon S3, and replication across three Availability Zones (AZs).


### Benefits

- High Performance and Scalability
- High Availability and Durability
- Highly Secure
- MySQL and PostgreSQL Compatible
- Fully Managed
- Migration Support


###  Use cases


- Enterprise Applications
- Software as a Service (SaaS) Applications
- Web and Mobile Gaming



## Migrating Your Databases to Amazon Aurora


### If you're currently using Amazon RDS for MySQL or Amazon RDS for PostgreSQL...


If you're currently using Amazon RDS for MySQL or Amazon RDS for PostgreSQL, migrating to Aurora is as simple as creating a snapshot and launching an Aurora instance from that snapshot. You can follow the simple, step by step instructions in the [user guide](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html) to perform the migration. Since Amazon Aurora is fully MySQL- and PostgreSQL-compatible, your applications can easily be reconnected to the new instance without any changes.


MySQL and PostgreSQL databases running on Amazon EC2 or on-premises can also be easily migrated. Create a snapshot backup of your existing database, upload it to Amazon S3, and use it to directly create an Amazon Aurora cluster. You can also import data stored in an Amazon S3 bucket into a table in an Amazon Aurora database. Standard MySQL import and export tools or MySQL binlog replication are also supported. Migrating to Amazon Aurora from supported databases running on Amazon EC2 or on-premises can also be done using AWS Database Migration Service.


### If you're currently using Oracle or Microsoft SQL Server...


The AWS Schema Conversion Tool simplifies migration from Oracle and Microsoft SQL Server to Amazon Aurora by automatically converting the source database schema and a majority of the custom code - including views, stored procedures, and functions - to a format compatible with Amazon Aurora. Any code that cannot be automatically converted is clearly marked so that it can be manually converted. Learn more and download [AWS Schema Conversion Tool »](https://aws.amazon.com/dms/#sct)

Migrating data from Oracle and Microsoft SQL Server databases to Amazon Aurora can be easily done using AWS Database Migration Service. You can begin a data migration with just a few clicks, and your source database remains fully operational during the migration, minimizing downtime to applications using that database. Learn more about [AWS Database Migration Service »](https://aws.amazon.com/dms/#sct)



## Getting started with Amazon Aurora


This section shows you how to create and connect to an Aurora DB cluster using Amazon RDS.

These procedures are tutorials that demonstrate the basics of getting started with Aurora. Subsequent sections introduce more advanced Aurora concepts and procedures, such as the different kinds of endpoints and how to scale Aurora clusters up and down. 


- Start by [Setting up your environment for Amazon Aurora](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_SettingUp_Aurora.html) 


Then, check:

- [Creating a DB cluster and connecting to a database on an Aurora MySQL DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_GettingStartedAurora.CreatingConnecting.Aurora.html)
- [Creating a DB cluster and connecting to a database on an Aurora PostgreSQL DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_GettingStartedAurora.CreatingConnecting.AuroraPostgreSQL.html)
- [Tutorial: Create a web server and an Amazon Aurora DB cluster](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/TUT_WebAppWithRDS.html)