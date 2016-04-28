
Download the DB2 Express-C Linux x86-64 from:

```
https://www-01.ibm.com/marketing/iwm/iwm/web/pick.do?source=swg-db2expressc&S_TACT=M1610PPW&lang=en_US
```

Place the downloaded file into this folder.

Then run:

```
vagrant up
```

Then you can connect to DB2 via:

```
vagrant ssh
db2
CONNECT TO SAMPLE
select * from EMPLOYEE
```

or:

```
jdbc:db2://db2inst1:db2inst1@172.16.42.42:50000/SAMPLE
```

See https://developer.ibm.com/messaging/mq-light/ for connecting to mq light
