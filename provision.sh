tar xf /vagrant/v10.5_linuxx64_expc.tar --overwrite
tar xf /vagrant/IBM-MQ-Light-Linux-x64-developer-1.0.2.0-L151130.2-2.tar --overwrite

yum upgrade -y
setenforce 0

/vagrant/expc/db2prereqcheck

yum install -y libstdc++.i686 pam.i686

/vagrant/expc/db2_install -b /opt/ibm/db2/V10.5

useradd db2inst1
echo "db2inst1:db2inst1"| sudo chpasswd

/opt/ibm/db2/V10.5/instance/db2icrt -p 50000 -u db2inst1 db2inst1

su - db2inst1
sudo runuser -l  db2inst1 -c 'db2start'
sudo runuser -l  db2inst1 -c 'db2sampl'

mkdir /opt/ibm/mqlight

cp -r /vagrant/mqlight-developer-1.0.2.0-L151130.2/* /opt/ibm/mqlight

/opt/ibm/mqlight/mqlight-config --no-ssl --accept-license --password devuser --user devuser
/opt/ibm/mqlight/mqlight-start
