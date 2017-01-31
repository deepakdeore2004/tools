#!/bin/bash
HOME=/home/vagrant
cp /vagrant/{id_rsa,id_rsa.pub} $HOME/.ssh/
chmod 600 $HOME/.ssh/{id_rsa,id_rsa.pub}
chown vagrant:vagrant $HOME/.ssh/{id_rsa,id_rsa.pub}
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
for i in {1..2}; do
  echo 192.168.33.2$i ubuntu$i;
done >> /etc/hosts
