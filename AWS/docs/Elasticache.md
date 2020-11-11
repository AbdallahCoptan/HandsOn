# In-memory databases on AWS: Amazon ElastiCache

[Amazon ElastiCache](https://aws.amazon.com/elasticache/) is fully managed in-memory data store, compatible with Redis or Memcached. Power real-time applications with sub-millisecond latency. 


## The in-memory database defined

An in-memory database is a type of purpose-built database that relies primarily on memory for data storage, in contrast to databases that store data on disk or SSDs. In-memory databases are designed to attain minimal response time by eliminating the need to access disks. Because all data is stored and managed exclusively in main memory, it is at risk of being lost upon a process or server failure. In-memory databases can persist data on disks by storing each operation in a log or by taking snapshots.

In-memory databases are ideal for applications that require microsecond response times and can have large spikes in traffic coming at any time such as gaming leaderboards, session stores, and real-time analytics. 


## In-memory databases on AWS

###  Amazon Elasticache for Redis

[Amazon ElastiCache for Redis](https://aws.amazon.com/elasticache/redis/) is a blazing fast in-memory data store that provides submillisecond latency to power internet-scale, real-time applications. Developers can use ElastiCache for Redis as an in-memory nonrelational database. The ElastiCache for Redis cluster configuration supports up to 15 shards and enables customers to run Redis workloads with up to 6.1 TB of in-memory capacity in a single cluster. ElastiCache for Redis also provides the ability to add and remove shards from a running cluster. You can dynamically scale out and even scale in your Redis cluster workloads to adapt to changes in demand. 

#####[Get started](https://aws.amazon.com/elasticache/getting-started/) with Amazon ElastiCache for Redis.


###  Amazon ElastiCache for Memcached

[Amazon ElastiCache for Memcached](https://aws.amazon.com/elasticache/memcached/) is a Memcached-compatible in-memory key-value store service that can be used as a cache or a data store. It delivers the performance, ease-of-use, and simplicity of Memcached. ElastiCache for Memcached is fully managed, scalable, and secure - making it an ideal candidate for use cases where frequently accessed data must be in-memory. It is a popular choice for use cases such as Web, Mobile Apps, Gaming, Ad-Tech, and E-Commerce.

#####[Get started](https://aws.amazon.com/elasticache/getting-started/) with Amazon ElastiCache for Memcached.


###  Use cases


- Real-time bidding
- Gaming leaderboards 
- Caching