# README

## install

```bash
sudo apt-get update
sudo apt-get install squid3
sudo apt-get install apache2-utils
```

## setup

- id: admin
- password: !1Knou123~

touch ./etc/passwords
chmod 777 ./etc/passwords
sudo htpasswd -c ./etc/squid/passwords admin

## conf

```./etc/squird.conf
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm Squid proxy-caching web server
auth_param basic credentialsttl 24 hours
auth_param basic casesensitive off
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all
dns_v4_first on
forwarded_for delete
via off
http_port 3128

```
