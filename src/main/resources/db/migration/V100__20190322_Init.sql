
CREATE TABLE `card_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '证件类型id',
  `card_role_name` varchar(16) NOT NULL COMMENT '证件类型',
  `fine_price` decimal(10,2) NOT NULL COMMENT '罚款价格，按小时计算',
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_role_name` (`card_role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `card_type` */

insert  into `card_type`(`id`,`card_role_name`,`fine_price`) values (1,'身份证',10.00),(2,'学生证',7.00),(3,'其他证件',5.00);

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `real_name` varchar(32) NOT NULL COMMENT '客户名',
  `sex` char(10) NOT NULL COMMENT '客户性别',
  `phone` varchar(20) NOT NULL COMMENT '客户手机号',
  `card_type_id` int(11) NOT NULL COMMENT '证件类型id',
  `card_number` varchar(20) NOT NULL COMMENT '证件号',
  `status` int(3) NOT NULL DEFAULT '0' COMMENT '客户状态,0表示离开,1表示预定,2表示在住',
  `advance_pay` double(10,2) DEFAULT '0.00' COMMENT '预付金额，客户离开后,预付款改为0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_number` (`card_number`),
  UNIQUE KEY `phone` (`phone`),
  KEY `fk_card_type_user` (`card_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`real_name`,`sex`,`phone`,`card_type_id`,`card_number`,`status`,`advance_pay`) values (1,'飞飞','男','133666',1,'4508819840515',2,192.00),(2,'露露','女','1235453',1,'4508819871010',2,672.00),(3,'熊猫','男','111222333',2,'45088194534',1,576.00),(4,'ABC','男','21421455',3,'450823515',0,0.00),(5,'小Q','女','24254642',1,'2154325345464',2,480.00),(6,'路人','男','67856454',2,'4354367456',0,0.00),(7,'小希','女','12312356',2,'123456789',0,0.00);

/*Table structure for table `open_room` */

CREATE TABLE `open_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '开房id',
  `type` int(3) NOT NULL DEFAULT '0' COMMENT '开房类型，1为现住，0为预定',
  `status` int(3) NOT NULL DEFAULT '0' COMMENT '开房状态,2为历史记录,1为在住记录,0为预定记录',
  `create_at` datetime NOT NULL COMMENT '开房日期',
  `user_id` int(11) DEFAULT NULL COMMENT '客户id',
  `room_id` int(11) DEFAULT NULL COMMENT '客房id',
  `expe_arrivetime` datetime NOT NULL COMMENT '预期到达时间',
  `expe_leavetime` datetime NOT NULL COMMENT '预期离开时间',
  `deposit` double(10,2) NOT NULL COMMENT '押金,如果超期,应该按规定扣除',
  `extend_days` int(3) DEFAULT '0' COMMENT '续期天数,续期后预计离开时间要更新',
  `overdue_status` int(3) DEFAULT '0' COMMENT '超期状态,1表示超期,0不超期',
  PRIMARY KEY (`id`),
  KEY `fk_user_open_room` (`user_id`),
  KEY `fk_room_open_room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `open_room` */

insert  into `open_room`(`id`,`type`,`status`,`create_at`,`user_id`,`room_id`,`expe_arrivetime`,`expe_leavetime`,`deposit`,`extend_days`,`overdue_status`) values (1,0,2,'2016-12-16 00:31:02',1,1,'2016-01-01 00:00:00','2016-01-03 00:00:00',0.00,0,1),(2,0,2,'2016-12-16 00:39:32',3,5,'2016-09-12 00:00:00','2016-09-15 00:00:00',0.00,0,0),(3,0,2,'2016-12-16 21:59:59',3,4,'2016-01-01 00:00:00','2016-03-11 00:00:00',0.00,0,0),(4,0,2,'2016-12-16 22:03:39',5,6,'2016-01-01 00:00:00','2016-01-04 00:00:00',0.00,0,0),(5,0,2,'2016-12-16 22:03:50',5,6,'2016-01-01 00:00:00','2016-01-04 00:00:00',0.00,0,0),(6,0,2,'2016-12-16 22:09:36',2,4,'2016-01-01 00:00:00','2016-01-04 00:00:00',0.00,0,0),(7,0,2,'2016-12-16 22:16:59',2,4,'2016-01-01 00:00:00','2016-01-04 00:00:00',0.00,0,0),(8,0,2,'2016-12-16 22:17:14',3,6,'2016-01-01 00:00:00','2016-01-06 00:00:00',0.00,0,0),(9,0,2,'2016-12-16 22:21:57',6,4,'2016-01-01 00:00:00','2016-01-04 00:00:00',0.00,0,0),(10,0,2,'2016-12-16 22:48:50',5,7,'2016-10-03 00:00:00','2016-11-01 00:00:00',0.00,0,0),(11,0,2,'2016-12-16 22:49:12',6,5,'2016-01-01 00:00:00','2016-01-06 00:00:00',0.00,0,0),(12,1,2,'2016-12-16 23:01:47',2,7,'2016-12-17 00:00:00','2016-12-24 00:00:00',0.00,1,0),(13,1,2,'2016-12-17 00:10:05',5,5,'2016-12-17 00:00:00','2016-12-18 00:00:00',0.00,0,0),(14,1,2,'2016-12-17 02:30:44',6,6,'2016-12-17 02:30:44','2016-12-18 00:00:00',0.00,0,0),(15,0,2,'2016-12-17 23:30:42',2,6,'2016-12-17 23:31:08','2016-12-19 14:00:00',0.00,0,0),(16,1,1,'2016-12-18 21:11:29',2,6,'2016-12-18 21:11:29','2016-12-27 22:00:00',336.00,7,0),(17,0,1,'2016-12-20 23:29:26',1,1,'2016-12-21 02:12:44','2016-12-22 15:00:00',96.00,0,1),(18,0,1,'2016-12-20 23:30:12',5,4,'2016-12-21 02:12:46','2016-12-26 15:00:00',240.00,3,0),(19,1,2,'2016-12-21 02:34:48',3,5,'2016-12-21 02:34:48','2016-12-24 10:00:00',0.00,0,0),(20,0,0,'2016-12-22 22:03:48',3,9,'2016-12-23 09:00:00','2016-12-25 09:00:00',0.00,0,0);

/*Table structure for table `out_room` */

CREATE TABLE `out_room` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '退房id',
  `open_id` int(10) NOT NULL COMMENT '开房id',
  `create_at` datetime NOT NULL COMMENT '退房日期',
  `room_amount` decimal(10,2) NOT NULL COMMENT '住房金额',
  `fine_amount` decimal(10,2) NOT NULL COMMENT '超期金额',
  `pay_method` varchar(16) NOT NULL COMMENT '支付方式',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_open_room_out_room` (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `out_room` */

insert  into `out_room`(`id`,`open_id`,`create_at`,`room_amount`,`fine_amount`,`pay_method`) values (1,12,'2016-12-17 22:04:50',176.00,0.00,'现金'),(7,14,'2016-12-17 23:09:58',280.00,0.00,'现金'),(8,13,'2016-12-17 23:13:58',276.00,0.00,'支付宝'),(10,15,'2016-12-17 23:33:47',0.00,0.00,'银行卡'),(11,1,'2016-12-17 23:34:55',67576.00,83990.00,'银行卡'),(12,19,'2016-12-22 21:28:47',504.00,0.00,'现金');

/*Table structure for table `room` */

CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客房id',
  `room_type_id` int(10) NOT NULL COMMENT '客房类型id',
  `room_name`   varchar(32) NOT NULL COMMENT '客房名',
  `room_status` int(1) NOT NULL DEFAULT '0' COMMENT '客房状态,0为空闲中，1为预定中，2为使用中',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_name` (`room_name`),
  KEY `fk_room_type_room` (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`id`,`room_type_id`,`room_name`,`room_status`) values (1,1,'2#201',2),(4,2,'4#305',2),(5,3,'5#505',0),(6,5,'4#241',2),(7,1,'5#502',0),(8,2,'3#305',0),(9,3,'2#203',1),(10,5,'3#301',0);

/*Table structure for table `room_type` */

CREATE TABLE `room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客房类型id',
  `name` varchar(32) NOT NULL COMMENT '客房类型',
  `price` double(10,2) NOT NULL COMMENT '客房价格，按小时计算',
  `description` varchar(128) DEFAULT NULL COMMENT '客房描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `room_type` */

insert  into `room_type`(`id`,`name`,`price`,`description`) values (1,'标准单人房',8.00,'一个好房'),(2,'标准双人房',10.00,''),(3,'豪华单人房',12.00,'还是一个好房'),(5,'豪华双人房',14.00,'enjoyable');

/*Table structure for table `admin_user` */

CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `phone` varchar(15) NOT NULL COMMENT '手机号',
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(6) DEFAULT NULL COMMENT '性别',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `regis_date` datetime DEFAULT NULL COMMENT '注册时间',
  `admin_user_role_id` int(11) NOT NULL COMMENT '用户类型id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_admin_user_role_user` (`admin_user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`email`,`real_name`,`sex`,`remark`,`regis_date`,`admin_user_role_id`)
  values (1,'haha','haha','123456','haha@qq.com','hao','male','','2016-12-08 00:00:00',2),
          (2,'hoho','hoho','222333','hoho@163.com','hou','female','测测','2016-12-08 00:00:00',2),
          (4,'tom','123','1337788','64233@qq.com','L','男','LLL','2016-12-12 00:11:42',1),
          (5,'qq','qq','333555','tencen@126.com','','男','测试测试','2016-12-12 00:14:39',2),
          (6,'admin','123','1337780','adm@qq.com','','男','','2016-12-22 22:18:24',1);

/*Table structure for table `admin_user_role` */

CREATE TABLE `admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户类型id',
  `role_name` varchar(32) NOT NULL COMMENT '用户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user_role` */

insert  into `admin_user_role`(`id`,`role_name`) values (1,'管理员'),(2,'普通用户');