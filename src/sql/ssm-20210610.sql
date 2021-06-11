/*
Navicat MySQL Data Transfer

Source Server         : 10.5.96.32
Source Server Version : 50723
Source Host           : 10.5.96.32:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2021-06-10 16:48:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(60) NOT NULL,
  `sex` int(2) NOT NULL COMMENT '1 - ��\r\n            0 -Ů',
  `birthday` date NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `POSITION` varchar(20) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES ('1', '史小军', '1', '1985-05-15', '15062602050', 'shixiaojun008@163.com', '项目经理', '帅哥一枚');

-- ----------------------------
-- Table structure for t_employee_task
-- ----------------------------
DROP TABLE IF EXISTS `t_employee_task`;
CREATE TABLE `t_employee_task` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `task_id` int(12) NOT NULL,
  `task_name` varchar(60) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_4` (`emp_id`),
  KEY `FK_Reference_8` (`task_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`task_id`) REFERENCES `t_task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_employee_task
-- ----------------------------
INSERT INTO `t_employee_task` VALUES ('1', '1', '1', '跑步任务', '跑步任务');

-- ----------------------------
-- Table structure for t_female_health_form
-- ----------------------------
DROP TABLE IF EXISTS `t_female_health_form`;
CREATE TABLE `t_female_health_form` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `heart` varchar(64) NOT NULL,
  `liver` varchar(64) NOT NULL,
  `spleen` varchar(64) NOT NULL,
  `lung` varchar(64) NOT NULL,
  `kidney` varchar(64) NOT NULL,
  `uterus` varchar(64) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`emp_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_female_health_form
-- ----------------------------

-- ----------------------------
-- Table structure for t_male_health_form
-- ----------------------------
DROP TABLE IF EXISTS `t_male_health_form`;
CREATE TABLE `t_male_health_form` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `heart` varchar(64) NOT NULL,
  `liver` varchar(64) NOT NULL,
  `spleen` varchar(64) NOT NULL,
  `lung` varchar(64) NOT NULL,
  `kidney` varchar(64) NOT NULL,
  `prostate` varchar(64) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`emp_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_male_health_form
-- ----------------------------
INSERT INTO `t_male_health_form` VALUES ('1', '1', '85', '8', '8', '8', '8', '8', '8');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'role_name_01', 'note_01');
INSERT INTO `t_role` VALUES ('2', 'role_name_02', 'note_02');
INSERT INTO `t_role` VALUES ('3', 'role_name_03', 'note_03');
INSERT INTO `t_role` VALUES ('4', 'role_name_04', 'note_04');
INSERT INTO `t_role` VALUES ('5', 'role_name_05', 'note_05');
INSERT INTO `t_role` VALUES ('6', 'role_name_06', 'note_06');
INSERT INTO `t_role` VALUES ('7', 'role_name_07', 'note_07');
INSERT INTO `t_role` VALUES ('8', 'role_name_08', 'note_08');
INSERT INTO `t_role` VALUES ('9', 'role_name_09', 'note_09');
INSERT INTO `t_role` VALUES ('10', 'role_name_10', 'note_10');
INSERT INTO `t_role` VALUES ('14', 'Role_insert_53', 'note_53');
INSERT INTO `t_role` VALUES ('15', 'Role_insert_52', 'note_52');
INSERT INTO `t_role` VALUES ('16', 'Role_insert_11', 'note_11');
INSERT INTO `t_role` VALUES ('17', 'Role_insert_03', 'note_03');

-- ----------------------------
-- Table structure for t_role2
-- ----------------------------
DROP TABLE IF EXISTS `t_role2`;
CREATE TABLE `t_role2` (
  `id` int(12) NOT NULL,
  `role_name` varchar(60) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_role2
-- ----------------------------

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `context` varchar(256) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '跑步', '3公里跑步', '坚持');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `sex` int(10) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `note` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'user_name_1', 'pwd1', '0', '13888888888', '010-88888888', 'y666@163.com', 'note_1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `role_id` int(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_work_card
-- ----------------------------
DROP TABLE IF EXISTS `t_work_card`;
CREATE TABLE `t_work_card` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `emp_id` int(12) NOT NULL,
  `real_name` varchar(60) NOT NULL,
  `department` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `POSITION` varchar(30) NOT NULL,
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_7` (`emp_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`emp_id`) REFERENCES `t_employee` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_work_card
-- ----------------------------
INSERT INTO `t_work_card` VALUES ('1', '1', '史小军', '研发部门', '15062602050', '项目经理', '帅哥');
SET FOREIGN_KEY_CHECKS=1;




-- DROP PROCEDURE IF EXISTS `sp_count_role`;
-- DELIMITER ;;
-- CREATE PROCEDURE `sp_count_role`(IN p_role_name VARCHAR(255), OUT count_total INT, OUT exec_date DATETIME)
-- BEGIN
--
-- SELECT COUNT(*) INTO count_total FROM t_role WHERE role_name like CONCAT('%',p_role_name,'%');
--
-- SELECT NOW() INTO exec_date;
--
-- END
-- ;;
-- DELIMITER ;
--
-- -- CALL sp_count_role('name',@count_total, @exec_date);
-- -- SELECT @count_total, @exec_date;
--
-- -- DROP PROCEDURE IF EXISTS `sp_count_role`;



