# grepblock


# Exmpale:

## grep
### grep sql blcok
```
$ cat test.sql 

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `ad_name` varchar(100) NOT NULL,
  `ad_type` tinyint(4) NOT NULL ,
  `ad_link_addr` varchar(200) NOT NULL ,
  `img_width` int(11) DEFAULT NULL,
  `img_height` int(11) DEFAULT NULL,
  `ad_text_content` varchar(250) DEFAULT NULL,
  `ad_img_content` varchar(250) DEFAULT NULL ,
  `yn` tinyint(4) NOT NULL,
  `client_type` varchar(20) DEFAULT NULL,
  `creator` varchar(100) NOT NULL,
  `modifier` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

# grep sql block

$ grepblock.sh -b '()' -s 'CREATE TABLE `ad`' -f test.sql 

CREATE TABLE `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT ,
  `ad_name` varchar(100) NOT NULL,
  `ad_type` tinyint(4) NOT NULL ,
  `ad_link_addr` varchar(200) NOT NULL ,
  `img_width` int(11) DEFAULT NULL,
  `img_height` int(11) DEFAULT NULL,
  `ad_text_content` varchar(250) DEFAULT NULL,
  `ad_img_content` varchar(250) DEFAULT NULL ,
  `yn` tinyint(4) NOT NULL,
  `client_type` varchar(20) DEFAULT NULL,
  `creator` varchar(100) NOT NULL,
  `modifier` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

```
### grep nginx blcok
```
$ cat server.conf 

upstream tomcat {
    server 127.0.0.1:1601  weight=10 max_fails=2 fail_timeout=30s;
}
server
{
    listen                   80;
    server_name              server.com
	location / {
	    proxy_next_upstream     http_500 http_502 http_503 http_504 error timeout invalid_header;
	    proxy_set_header        Host  $host;
	    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
	    proxy_pass              http://tomcat;
	    expires                 0;
	}
    location /logs/ {
	autoindex       off;
	deny all;
    }
}

# grep nginx location / block
$ grepblock.sh -b '{}' -s 'location \/ {' -f server.conf 

	location / {
	    proxy_next_upstream     http_500 http_502 http_503 http_504 error timeout invalid_header;
	    proxy_set_header        Host  $host;
	    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
	    proxy_pass              http://tomcat;
	    expires                 0;
	}

```

## add
```
# add string
$ grepblock.sh -a 'jingminglang' -b '()' -s 'CREATE TABLE `ad`' -f test.sql 

# add file text
$ grepblock.sh -a 'f.txt' -b '()' -s 'CREATE TABLE `ad`' -f test.sql 
```

## modify
