Java Appliance
==============

Requirements
------------

```
vagrant
ansible
virtualbox
apache
```

Install
-------

Add the following to /etc/apache2/httpd.conf on your local machine:

```
<Location />
    ProxyPass http://localhost:8882/
</Location>
```

Start apache:

```
sudo apachectl start
```

This will forward port 80 on your local machine to port 8882 where the site is running.

```
pip install git+git://github.com/sky-shiny/smolder.git
vagrant plugin install vagrant-triggers
git clone https://github.com/mcameron/java-appliance.git
cd java-appliance
./build.sh
```
