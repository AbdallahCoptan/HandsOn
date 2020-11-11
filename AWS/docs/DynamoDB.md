#Popular key-value databases: Amazon DynamoDB


[Amazon DynamoDB](https://aws.amazon.com/dynamodb/) is a fast and flexible NoSQL database service for applications that need consistent, single-digit millisecond latency at any scale. Its a fully managed cloud database, and it supports both document and key-value store models. Its flexible data model, reliable performance, and automatic scaling of throughput capacity make it a great fit for mobile, web, gaming, advertising technology (ad tech), Internet of Things (IoT), and many other applications.

Check, [Amazon DynamoDB Pricing](https://aws.amazon.com/dynamodb/pricing/) before starte deply your NoSQL database on it.


## The key-value database defined

A key-value database is a type of nonrelational database that uses a simple key-value method to store data. A key-value database stores data as a collection of key-value pairs in which a key serves as a unique identifier. Both keys and values can be anything, ranging from simple objects to complex compound objects. Key-value databases are highly partitionable and allow horizontal scaling at scales that other types of databases cannot achieve. For example, Amazon DynamoDB allocates additional partitions to a table if an existing partition fills to capacity and more storage space is required.



The following diagram shows an example of data stored as key-value pairs in DynamoDB.

![](keyValueDB.png)

<br>

-----------------------------------------------------------

## DynamoDB




Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale. It's a fully managed, multiregion, multimaster, durable database with built-in security, backup and restore, and in-memory caching for internet-scale applications. DynamoDB can handle more than 10 trillion requests per day and can support peaks of more than 20 million requests per second.

Many of the world's fastest growing businesses such as Lyft, Airbnb, and Redfin as well as enterprises such as Samsung, Toyota, and Capital One depend on the scale and performance of DynamoDB to support their mission-critical workloads.

Hundreds of thousands of AWS customers have chosen DynamoDB as their key-value and document database for mobile, web, gaming, ad tech, IoT, and other applications that need low-latency data access at any scale. Create a new table for your application and let DynamoDB handle the rest.


<iframe width="560" height="315" src="https://www.youtube.com/embed/sI-zciHAh-4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<br>

-----------------------------------------------------------

### Benefits & Applications


**Benefits**

- Performance at scale
- No servers to manage
- Enterprise ready

**Applications**

- Serverless Web Apps
- Mobile Backends
- Microservices


### Use Cases

- Ad Tech
- Retail
- Gaming
- Banking and Finance
- Media and entertainment
- Software and internet
- Session store
- Shopping cart




## Creating a Table  from SQL to NoSQL

Tables are the fundamental data structures in relational databases and in Amazon DynamoDB. A relational database management system (RDBMS) requires you to define the table's schema when you create it. In contrast, DynamoDB tables are schemaless—other than the primary key, you do not need to define any extra attributes or data types when you create a table. 

### SQL

Use the CREATE TABLE statement to create a table, as shown in the following example. 

			CREATE TABLE Music (
    		Artist VARCHAR(20) NOT NULL,
    		SongTitle VARCHAR(30) NOT NULL,
    		AlbumTitle VARCHAR(25),
    		Year INT,
    		Price FLOAT,
    		Genre VARCHAR(10),
    		Tags TEXT,
    		PRIMARY KEY(Artist, SongTitle)
			);


The primary key for this table consists of Artist and SongTitle.

You must define all of the table's columns and data types, and the table's primary key. (You can use the ALTER TABLE statement to change these definitions later, if necessary.)

Many SQL implementations let you define storage specifications for your table, as part of the CREATE TABLE statement. Unless you indicate otherwise, the table is created with default storage settings. In a production environment, a database administrator can help determine the optimal storage parameters. 


### NoSQL: DynamoDB

Use the `CreateTable` action to create a provisioned mode table, specifying parameters as shown following: 


		{
    			TableName : "Music",
    			KeySchema: [
        		{
            		AttributeName: "Artist",
            		KeyType: "HASH", //Partition key
        		},
        		{
            		AttributeName: "SongTitle",
            		KeyType: "RANGE" //Sort key
       			}
    		],
    		AttributeDefinitions: [
        		{
            		AttributeName: "Artist",
            		AttributeType: "S"
        		},
        		{
            		AttributeName: "SongTitle",
            		AttributeType: "S"
        		}
    		],
    		ProvisionedThroughput: {       // Only specified if using provisioned mode
        		ReadCapacityUnits: 1,
        		WriteCapacityUnits: 1
    		}
		}


The primary key for this table consists of Artist (partition key) and SongTitle (sort key). 





## Setting Up DynamoDB on AWS

Before starting the development of your tables in DynamoDB, you have to:

1. Have an AWS account
2. AWS Access Key if you will use DynamoDB from CLI or SDK
3. Configuring Your Credentials 


### Getting an AWS Access Key 

Before you can access DynamoDB programmatically or through the AWS Command Line Interface (AWS CLI), you must have an AWS access key. You don't need an access key if you plan to use the DynamoDB console only.

Access keys consist of an access key ID and secret access key, which are used to sign programmatic requests that you make to AWS. If you don't have access keys, you can create them from the AWS Management Console. As a best practice, do not use the AWS account root user access keys for any task where it's not required. Instead, create a new administrator IAM user with access keys for yourself. 

Check how to [create the AWS Access Key](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/SettingUp.DynamoWebService.html#SettingUp.DynamoWebService.GetCredentials).


### Configuring Your Credentials 


Before you can access DynamoDB programmatically or through the AWS CLI, you must configure your credentials to enable authorization for your applications.

There are several ways to do this. For example, you can manually create the credentials file to store your access key ID and secret access key. You also can use the aws configure command of the AWS CLI to automatically create the file. Alternatively, you can use environment variables. For more information about configuring your credentials, see the programming-specific AWS SDK developer guide. 

To install and configure the AWS CLI, see [Using the AWS CLI](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Tools.CLI.html). 





## Getting Started with Amazon DynamoDB

Use the hands-on tutorials in this section to help you get started and learn more about Amazon DynamoDB. 


- Step 1: [Create a Table](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-1.html)
- Step 2: [Write Data to a Table Using the Console or AWS CLI](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-2.html)
- Step 3: [Read Data from a Table](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-3.html)
- Step 4: [Update Data in a Table](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-4.html)
- Step 5: [Query Data in a Table](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-5.html)
- Step 6: [Create a Global Secondary Index](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-6.html)
- Step 7: [Query the Global Secondary Index](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-7.html)
- Step 8: [(Optional) Clean Up Resources](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-step-8.html)
- [Getting Started with DynamoDB: Next Steps](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/getting-started-NextSteps.html)


<br>

##### [Demo: Create and Query a NoSQL Table](https://aws.amazon.com/getting-started/hands-on/create-nosql-table/)

##### [More advanced tutorials and demos](https://aws.amazon.com/dynamodb/getting-started/)