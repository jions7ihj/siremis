/*Table structure for table `acl_action` */

DROP TABLE IF EXISTS `acl_action`;

CREATE TABLE `acl_action` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `module` varchar(64) NOT NULL default '',
  `resource` varchar(64) NOT NULL default '',
  `action` varchar(64) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `acl_role_action` */

DROP TABLE IF EXISTS `acl_role_action`;

CREATE TABLE `acl_role_action` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL default '0',
  `action_id` int(10) unsigned NOT NULL default '0',
  `access_level` varchar(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `role_id` (`role_id`),
  KEY `action_id` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meta_do` */

DROP TABLE IF EXISTS `meta_do`;

CREATE TABLE `meta_do` (
  `name` varchar(100) NOT NULL,
  `module` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `dbname` varchar(100) default NULL,
  `table` varchar(100) default NULL,
  `data` text,
  `fields` text,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meta_form` */

DROP TABLE IF EXISTS `meta_form`;

CREATE TABLE `meta_form` (
  `name` varchar(100) NOT NULL,
  `module` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `dataobj` varchar(100) default NULL,
  `template` varchar(100) default NULL,
  `data` text,
  `elements` text,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `meta_view` */

DROP TABLE IF EXISTS `meta_view`;

CREATE TABLE `meta_view` (
  `name` varchar(100) NOT NULL,
  `module` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `template` varchar(100) default NULL,
  `data` text,
  `forms` text,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `module` */

DROP TABLE IF EXISTS `module`;

CREATE TABLE `module` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `description` varchar(255) default NULL,
  `status` int(2) default '1',
  `author` varchar(64) default NULL,
  `version` varchar(64) default NULL,
  `openbiz_version` varchar(64) default NULL,
  `depend_on` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `description` varchar(255) default NULL,
  `status` int(2) default '1',
  `default` int(2) default '0',
  `startpage` varchar( 255 ) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  INDEX (  `default` ),
  INDEX (  `status` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`description`,`status`,`startpage`) values (1,'Administrator','System administrator',1,'/system/general_default');
insert  into `role`(`id`,`name`,`description`,`status`,`startpage`) values (2,'Sipadmin','General SIP admins',1,'/sipadmin/sipadmin_default');
insert  into `role`(`id`,`name`,`description`,`status`,`startpage`) values (3,'Sipuser','General SIP users',1,'/sipuser/sipuser_default');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(64) NOT NULL default '',
  `password` varchar(64) NOT NULL default '',
  `enctype` varchar(64) NOT NULL default 'SHA1',
  `email` varchar(64) default '',
  `status` int(2) default '1',
  `lastlogin` datetime default NULL,
  `lastlogout` datetime default NULL,
  `create_by` int(10) default 1,
  `create_time` datetime default NULL,
  `update_by` int(10) default 1,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`enctype`,`email`,`status`,`lastlogin`,`lastlogout`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','SHA1','admin@yourcompany.com',1,'2010-05-16 18:20:40','2009-08-24 13:24:14',1,'2010-05-01 01:19:57',1,'2010-05-01 01:19:57');
insert  into `user`(`id`,`username`,`password`,`enctype`,`email`,`status`,`lastlogin`,`lastlogout`,`create_by`,`create_time`,`update_by`,`update_time`) values (2,'member','6467baa3b187373e3931422e2a8ef22f3e447d77','SHA1','member@yourcompany.com',0,'2010-05-01 01:19:57','2009-08-23 23:39:37',1,'2010-05-01 01:19:57',5,'2010-05-01 01:19:57');
insert  into `user`(`id`,`username`,`password`,`enctype`,`email`,`status`,`lastlogin`,`lastlogout`,`create_by`,`create_time`,`update_by`,`update_time`) values (3,'guest','35675e68f4b5af7b995d9205ad0fc43842f16450','SHA1','guest@yourcompany.com',0,NULL,NULL,NULL,'2010-01-12 02:20:10',NULL,'2010-01-12 02:20:10');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `role_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`user_id`,`role_id`) values (1,1,1);
insert  into `user_role`(`id`,`user_id`,`role_id`) values (2,2,2);
insert  into `user_role`(`id`,`user_id`,`role_id`) values (3,3,3);

/*Table structure for table `group` */

DROP TABLE IF EXISTS `group`;

CREATE TABLE `group` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `group_role` */

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(10) unsigned NOT NULL default '0',
  `group_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `pass_token`;
CREATE TABLE IF NOT EXISTS `pass_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (                                 
  `name` varchar(100) NOT NULL default '',      
  `module` varchar(100) default NULL,           
  `title` varchar(100) default NULL,                 
  `link` varchar(255) default NULL,      
  `url_match` varchar(255) default NULL,        
  `view` varchar(255) default NULL,             
  `type` varchar(50) NOT NULL default '',       
  `published` tinyint(1) NOT NULL default '1',  
  `parent` varchar(255) default '',             
  `ordering` int(4) default '10',               
  `access` varchar(100) default NULL,           
  `icon` varchar(100) default NULL,             
  `icon_css` varchar(100) default NULL,     
  `description` varchar(255) default NULL,
  `create_by` int(10) default 1,
  `create_time` datetime default NULL,
  `update_by` int(10) default 1,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`name`)                         
) ENGINE=InnoDB DEFAULT CHARSET=utf8   
  
/*Data for the table `menu` */

