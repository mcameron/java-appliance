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
```
git clone git@github.com:mcameron/java-appliance.git
cd java-appliance
vagrant up
```

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

Test
----
I've used smolder to test the installation:
https://github.com/sky-shiny/smolder


Run tests against http://localhost/ as follows:

```
smolder-cli localhost tests/companyNews.json --force
```
