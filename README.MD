
Download the DB2 Express-C Linux x86-64 from:

```
https://www-01.ibm.com/marketing/iwm/iwm/web/pick.do?source=swg-db2expressc&S_TACT=M1610PPW&lang=en_US
```

Place the downloaded file into this folder.

and

Download IBM MQ Light Linux (64bit) v1.0.2 from:

https://developer.ibm.com/messaging/ibm-mq-light-downloads/

Place the downloaded file into this folder.


Then run:

```
vagrant up
```

Then you can connect to it via:

```
vagrant ssh
db2
CONNECT TO SAMPLE
select * from EMPLOYEE
```

or:

```
jdbc:db2://172.16.42.42:50000/SAMPLE
Username: db2inst1
Password: db2inst1
```
