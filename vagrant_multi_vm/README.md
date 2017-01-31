# This config will:

* Create Ubuntu 14.04 VMs in Vagrant.
* Setup passwordless ssh in between all hosts.
* Use provided public and private key-pair or custom key-pair.
* Update /etc/hosts file, these changes should be manually defined in provisioning.sh.
* Create private_network (host_only) to communicate between host and guests.
* NAT adapter is created by default to connect to internet.

# Running instructions:
Default config will create 2 ubuntu 14.04 VMs, with ip addresses starting from 192.168.33.21 onwards, change loop "(1..2).each" in Vagrantfile to modify number of required VMs. Also change for loop in provisioning.sh script to match number of machines and ip addresses. Download/ checkout the confic locally and run:

    $ vagrant up

Use id_rsa.ppk to connect from putty or use id_rsa to connect from linux/ mac or other ssh clients which support openssh format keys. Conect as "vagrant" user and to the mentioned ip addresses in Vagrantfile.

SSH to private_network ips doesn't work when connected to vpn, vagrant setup 22 port forwarding, so we can connect to localhost to the forwarded port. Vagrant up command shows which port is used for forwarding, or after vm is up we can get same information as below:

    C:\vagrant\ubuntu_14.04-1>vagrant ssh-config
    Host default
    HostName 127.0.0.1
    User vagrant
    Port 2222
    UserKnownHostsFile /dev/null
    StrictHostKeyChecking no
    PasswordAuthentication no
    IdentityFile C:/vagrant/ubuntu_14.04-1/.vagrant/machines/default/virtualbox/private_key
    IdentitiesOnly yes
    LogLevel FATAL

# Destroy the machines:

    $ vagrant destroy
