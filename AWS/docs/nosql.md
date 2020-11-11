#NoSQL Databases in Amazon Web Services



## NoSQL Databases

**High-performance, nonrelational databases with flexible data models**

### What are NoSQL databases?

[NoSQL databases](https://aws.amazon.com/nosql/) are purpose built for specific data models and have flexible schemas for building modern applications. NoSQL databases are widely recognized for their ease of development, functionality, and performance at scale.



#### How Does a NoSQL (nonrelational) Database Work?

NoSQL databases use a variety of data models for accessing and managing data. These types of databases are:

- optimized specifically for applications that require large data volume, 
- low latency, and 
- flexible data models, 

which are achieved by relaxing some of the data consistency restrictions of other databases.


Consider the example of modeling the schema for a simple book database:

- In a relational database, a book record is often dissembled (or “normalized”) and stored in separate tables, and relationships are defined by primary and foreign key constraints. In this example, the **Books** table has columns for **ISBN, Book Title**, and **Edition Number**, the **Authors** table has columns for **AuthorID** and **Author Name**, and finally the **Author-ISBN** table has columns for **AuthorID** and **ISBN**. The relational model is designed to enable the database to enforce referential integrity between tables in the database, normalized to reduce the redundancy, and generally optimized for storage.

- In a NoSQL database, a book record is usually stored as a [JSON](https://www.json.org/json-en.html) document. For each book, the item, **ISBN, Book Title, Edition Number, Author Name,** and **AuthorID** are stored as attributes in a single document. In this model, data is optimized for intuitive development and horizontal scalability.



#### Why should you use a NoSQL database?

NoSQL databases are a great fit for many modern applications such as:

- mobile, 
- web, and
- gaming 

that require:

- flexible, 
- scalable, 
- high-performance, and 
- highly functional databases to provide great user experiences.


NoSQL databases have the following features:

- **Flexibility**: NoSQL databases generally provide flexible schemas that enable faster and more iterative development. The flexible data model makes NoSQL databases ideal for semi-structured and unstructured data.

- **Scalability**: NoSQL databases are generally designed to scale out by using distributed clusters of hardware instead of scaling up by adding expensive and robust servers. Some cloud providers handle these operations behind-the-scenes as a fully managed service.

- **High-performance**: NoSQL database are optimized for specific data models and access patterns that enable higher performance than trying to accomplish similar functionality with relational databases.

- **Highly functional**: NoSQL databases provide highly functional APIs and data types that are purpose built for each of their respective data models.




### Types of NoSQL Databases


- **Key-value**: Key-value databases are highly partitionable and allow horizontal scaling at scales that other types of databases cannot achieve. Use cases such as gaming, ad tech, and IoT lend themselves particularly well to the key-value data model. [Amazon DynamoDB](https://aws.amazon.com/dynamodb/) is designed to provide consistent single-digit millisecond latency for any scale of workloads. This consistent performance is a big part of why the [Snapchat Stories feature](https://www.youtube.com/watch?v=WUleQzu9l_8), which includes Snapchat's largest storage write workload, moved to DynamoDB.

<br>

- **Document**: In application code, data is represented often as an object or JSON-like document because it is an efficient and intuitive data model for developers. Document databases make it easier for developers to store and query data in a database by using the same document model format that they use in their application code. The flexible, semistructured, and hierarchical nature of documents and document databases allows them to evolve with applications’ needs. The document model works well with catalogs, user profiles, and content management systems where each document is unique and evolves over time. [Amazon DocumentDB (with MongoDB compatibility)](https://aws.amazon.com/documentdb/) and MongoDB are popular document databases that provide powerful and intuitive APIs for flexible and iterative development.

<br>

- **Graph**: A graph database’s purpose is to make it easy to build and run applications that work with highly connected datasets. Typical use cases for a graph database include social networking, recommendation engines, fraud detection, and knowledge graphs. Amazon Neptune is a fully-managed graph database service. [Neptune](https://aws.amazon.com/neptune/) supports both the Property Graph model and the Resource Description Framework (RDF), providing the choice of two graph APIs: TinkerPop and RDF/SPARQL. Popular graph databases include Neo4j and Giraph.

<br>

- **In-memory**: Gaming and ad-tech applications have use cases such as leaderboards, session stores, and real-time analytics that require microsecond response times and can have large spikes in traffic coming at any time. Amazon [ElastiCache](https://aws.amazon.com/elasticache/) offers Memcached and Redis, to serve low-latency, high-throughput workloads, such as [McDonald’s](https://aws.amazon.com/solutions/case-studies/mcdonalds/), that cannot be served with disk-based data stores. [Amazon DynamoDB Accelerator (DAX)](https://aws.amazon.com/dynamodb/dax/) is another example of a purpose-built data store. DAX makes DynamoDB reads an order of magnitude faster.

<br>

- **Search**: Many applications output logs to help developers troubleshoot issues. [Amazon Elasticsearch Service (Amazon ES)](https://aws.amazon.com/elasticsearch-service/) is purpose built for providing near-real-time visualizations and analytics of machine-generated data by indexing, aggregating, and searching semistructured logs and metrics. Amazon ES also is a powerful, high-performance search engine for full-text search use cases. [Expedia](https://www.youtube.com/watch?v=oJUpUQ_yNVw&ab_channel=AmazonWebServices) is using more than 150 Amazon ES domains, 30 TB of data, and 30 billion documents for a variety of mission-critical use cases, ranging from operational monitoring and troubleshooting to distributed application stack tracing and pricing optimization.


<br>

-----------------------------------------------------------

## SQL (relational) vs. NoSQL (nonrelational) databases


For decades, the predominant data model that was used for application development was the relational data model used by relational databases such as Oracle, DB2, SQL Server, MySQL, and PostgreSQL. It wasn’t until the mid to late 2000s that other data models began to gain significant adoption and usage. To differentiate and categorize these new classes of databases and data models, the term “NoSQL” was coined. Often the term “NoSQL” is used interchangeably with “nonrelational.”

Though there are many types of NoSQL databases with varying features, the following table shows some of the differences between SQL and NoSQL databases.


|                       	| Relational databases                                                                                                                                                                                                                                                                                                  	| NoSQL databases                                                                                                                                                                                                                                	|
|:---------------------:	|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| Optimal <br>workloads 	| Relational databases are designed for transactional and strongly <br>consistent online transaction processing (OLTP) applications and are <br>good for online analytical processing (OLAP).                                                                                                                           	| NoSQL databases are designed for a number of data access patterns that <br>include low-latency applications. NoSQL search databases are designed <br>for analytics over semi-structured data.                                                  	|
|       Data model      	| The relational model normalizes data into tables that are composed of <br>**rows and columns**. A schema strictly defines the tables, rows, columns, <br>indexes, relationships between tables, and other database elements. The database enforces the referential integrity in relationships between <br>tables. 	| NoSQL databases provide a variety of data models such as **key-value**, <br>**document**, and **graph**, which are optimized for performance and scale.                                                                                                    	|
|      Performance      	| Performance is generally dependent on the disk subsystem. The optimization of queries, indexes, and table structure is often required to achieve peak performance.                                                                                                                                            	| Performance is generally a function of the underlying hardware cluster size, <br>network latency, and the calling application.                                                                                                                 	|
|         Scale         	| Relational databases typically scale up by increasing the compute <br>capabilities of the hardware or scale-out by adding replicas for read-only workloads.                                                                                                                                                       	| NoSQL databases typically are partitionable because access patterns are able to scale out by using distributed architecture to increase throughput that <br>provides consistent performance at near boundless scale.                       	|
|          APIs         	| Requests to store and retrieve data are communicated using queries that <br>conform to a structured query language (SQL). These queries are parsed <br>and executed by the relational database.                                                                                                                       	| Object-based APIs allow app developers to easily store and retrieve data<br> structures. Partition keys let apps look up key-value pairs, column <br>sets, or semistructured documents that contain serialized app objects <br>and attributes. 	|




<br>

-----------------------------------------------------------


### SQL vs. NoSQL Terminology

The following table compares terminology used by select NoSQL databases with terminology used by SQL databases.


|           SQL          	|      MongoDB      	|        DynamoDB        	|     Cassandra     	|  Couchbase  	|
|:----------------------:	|:-----------------:	|:----------------------:	|:-----------------:	|:-----------:	|
|          Table         	|     Collection    	|          Table         	|       Table       	| Data bucket 	|
|           Row          	|      Document     	|          Item          	|        Row        	|   Document  	|
|         Column         	|       Field       	|        Attribute       	|       Column      	|    Field    	|
|       Primary key      	|      ObjectId     	|      Primary key         	|    Primary key    	| Document ID 	|
|          Index         	|       Index       	|     Secondary index    	|       Index       	|    Index    	|
|          View          	|        View       	| Global secondary index 	| Materialized view 	|     View    	|
| Nested table or object 	| Embedded document 	|           Map          	|        Map        	|     Map     	|
|          Array         	|       Array       	|          List          	|        List       	|     List    	|



<br>

-----------------------------------------------------------


### NoSQL Database Engines in AWS


|  NoSQL<br> BD 		|               AWS <br>DB Engine              	|
|---------			|----------------------------------------	|
| [Key-value](https://aws.amazon.com/nosql/key-value/) 		|[DynamoDB](https://aws.amazon.com/dynamodb/)                	|
|  [Document](https://aws.amazon.com/nosql/document/) 		|[DocumentDB](https://aws.amazon.com/documentdb/)<br>-- MongoDB         	|
|   [Graph](https://aws.amazon.com/nosql/graph/)   		|[Neptune](https://aws.amazon.com/neptune/)                 	|
| [In-memory](https://aws.amazon.com/nosql/in-memory/) 		|[ElastiCache](https://aws.amazon.com/elasticache/)<br>-- Redis DB <br>-- Memcached 	|
|   [Search](https://aws.amazon.com/nosql/search/)  		|[ElastiSearch](https://aws.amazon.com/elasticsearch-service/)               	|



<br>

-----------------------------------------------------------
<br>
