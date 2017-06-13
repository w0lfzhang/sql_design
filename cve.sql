create database cve_db;
use cve_db;

create table cve
	(cid int not null auto_increment,
	 cve_name varchar(20) not null default '',
	 author varchar(20) not null default '',
	 published_time date not null default '0000-00-00',
	 description varchar(100) not null default '',
	 type int not null default 0,
	 app_name varchar(50) not null default '',
	 company varchar(50) not null default '',
	 platform varchar(10) not null default '',
	 primary key(cid)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table vuln_type
	(tid int not null auto_increment,
	 type_name varchar(40) not null default '',
	 proportion float not null default 0,
	 primary key(tid)
	)ENGINE=InnoDB DEFAULT CHARSET=utf8;