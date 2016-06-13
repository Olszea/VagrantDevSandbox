# DevSandbox
DevSandbox contains:
- Ubuntu 14.04 as base box
- Apache2
- PHP 7.0
- MySQL
- Composer (installed globally)
- GIT
- Midnight Commander

## Requirements
- VirtualBox 5.0 - download from https://www.virtualbox.org/wiki/Downloads
- Vagrant 1.8.1 - download from https://www.vagrantup.com/downloads.html

## Installation
Simply clone repository and run Vagrant VM.
```bash
clone https://github.com/mhyndle/VagrantDevSandbox.git
cd VagrantDevSandbox
vagrant up
```
Default IP of VM is `192.168.1.50` so for each site running on DevSandbox you should put proper entry in hosts file.

### Verify installation
To verify whether installation finished properly you can check already provided test.loc site.
Just add following entry to your hosts file:
```
192.168.1.50 test.loc # DevSandbox
```
After that run http://test.loc in your browser - you should see `phpinfo()`.

## SSH
SSH connection settings:
- host: `192.168.1.50`
- username: `vagrant`
- password: `vagrant`

```bash
ssh vagrant@192.168.1.50
```

## MySQL
There is no web interface for MySQL installed within DevSandbox. For connecting with DevSandbox' MySQL database I suggest
using MySQL Workbench (you can download it from http://dev.mysql.com/downloads/workbench/) and use 
"Standard TCP/IP over SSH" connection method with following settings:
- SSH Hostname: `192.168.1.50`
- SSH Username: `vagrant`
- SSH Password: `vagrant`
- MySQL Hostname: `127.0.0.1`
- MySQL Port: `3306`
- Username: `root`
- Password: `root`

## Add new site
To add new site to DevSandbox you have to create folder inside `./www` and create Apache's vhost pointing to that folder inside DevSandbox.
So basically it would be something like that:
```bash
cd www
mkdir mysite.loc
touch mysite.loc/index.php

ssh vagrant@192.168.1.50
su
# password for root user is "vagrant"
cp /etc/apache2/sites-available/test.loc.conf /etc/apache2/sites-available/mysite.loc.conf
# edit /etc/apache2/sites-available/mysite.loc.conf
a2ensite mysite.loc.conf
service apache2 reload
```
