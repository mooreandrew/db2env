yum upgrade -y
setenforce 0
/vagrant/expc/db2prereqcheck

yum install -y libstdc++.i686 pam.i686

/vagrant/expc/db2_install -b /opt/ibm/db2/V10.5

useradd db2inst1

/opt/ibm/db2/V10.5/instance/db2icrt -p 50000 -u db2inst1 db2inst1

su - db2inst1
sudo runuser -l  db2inst1 -c 'db2start'
sudo runuser -l  db2inst1 -c 'db2sampl'
