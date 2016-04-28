
if [ ! -f /vagrant/IBM-MQ-Light-Linux-x64-developer-1.0.2.0-L151130.2.tar.gz ]; then
    curl -o /vagrant/IBM-MQ-Light-Linux-x64-developer-1.0.2.0-L151130.2.tar.gz https://public.dhe.ibm.com/ibmdl/export/pub/software/websphere/messaging/mqkoa/1.0/IBM-MQ-Light-Linux-x64-developer-1.0.2.0-L151130.2.tar.gz
fi

if [ ! -f /vagrant/v10.5_linuxx64_expc.tar  ]; then
  echo "v10.5_linuxx64_expc.tar could not be found"
  exit 1
fi

if [ ! -d /vagrant/expc ]; then
  tar xf /vagrant/v10.5_linuxx64_expc.tar --overwrite -C /vagrant/
fi

if [ ! -d /vagrant/mqlight-developer-1.0.2.0-L151130.2 ]; then
  tar xf /vagrant/IBM-MQ-Light-Linux-x64-developer-1.0.2.0-L151130.2.tar.gz --overwrite -C /vagrant/
fi
setenforce 0

#/vagrant/expc/db2prereqcheck
yum update libstdc++-4.8.5-4.el7 pam -y
yum install -y pam.i686 libaio

/vagrant/expc/db2_install -b /opt/ibm/db2/V10.5

useradd db2inst1
echo "db2inst1:db2inst1"| sudo chpasswd

/opt/ibm/db2/V10.5/instance/db2icrt -p 50000 -u db2inst1 db2inst1

sudo runuser -l  db2inst1 -c 'db2start'
sudo runuser -l  db2inst1 -c 'db2sampl'

mkdir /opt/ibm/mqlight

cp -r /vagrant/mqlight-developer-1.0.2.0-L151130.2/* /opt/ibm/mqlight

/opt/ibm/mqlight/mqlight-config --no-ssl --accept-license --password devuser --user devuser
/opt/ibm/mqlight/mqlight-start
