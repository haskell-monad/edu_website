/*
Navicat MySQL Data Transfer

Source Server         : 218.245.5.10
Source Server Version : 50614
Source Host           : 218.245.5.10:4309
Source Database       : dty_cms

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2014-03-24 12:26:05
*/

-- ----------------------------
-- Procedure structure for `role_del`
-- ----------------------------
DROP PROCEDURE IF EXISTS `role_del`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `role_del`(IN roleId varchar(50))
BEGIN 
	
	DECLARE userId VARCHAR(50) DEFAULT '' ;
	
	declare my_cursor CURSOR FOR select users from freecms_role_user where roles =roleId ;
	
	 
        OPEN my_cursor;
         
        FETCH my_cursor INTO userId;
         
        WHILE ( userId is not null) DO
	
	update freecms_users 
	set roleNames=(
	select GROUP_CONCAT(NAME SEPARATOR  ';') 
	FROM freecms_roles u left join freecms_role_user uu on u.id=uu.roles
	where uu.users=userId and u.id!=roleId
	) 
	where id=userId;
           
          FETCH my_cursor INTO userId;
        END WHILE;
        CLOSE my_cursor;
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `role_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `role_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `role_update`(IN roleId varchar(50))
BEGIN 
	
	DECLARE userId VARCHAR(50) DEFAULT '' ;
	
	declare my_cursor CURSOR FOR select users from freecms_role_user where roles =roleId ;
	
	 
        OPEN my_cursor;
         
        FETCH my_cursor INTO userId;
         
        WHILE ( userId is not null) DO
	
	update freecms_users 
	set roleNames=(
	select GROUP_CONCAT(NAME SEPARATOR  ';') 
	FROM freecms_roles u left join freecms_role_user uu on u.id=uu.roles
	where uu.users=userId
	) 
	where id=userId;
           
          FETCH my_cursor INTO userId;
        END WHILE;
        CLOSE my_cursor;
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `unit_del`
-- ----------------------------
DROP PROCEDURE IF EXISTS `unit_del`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `unit_del`(IN unitId varchar(50))
BEGIN 
	
	DECLARE userId VARCHAR(50) DEFAULT '' ;
	
	declare my_cursor CURSOR FOR select users from freecms_unit_user where unit =unitId ;
	
	 
        OPEN my_cursor;
         
        FETCH my_cursor INTO userId;
         
        WHILE ( userId is not null) DO
	
	update freecms_users 
	set unitNames=(
	select GROUP_CONCAT(NAME SEPARATOR  ';') 
	FROM freecms_unit u left join freecms_unit_user uu on u.id=uu.unit
	where uu.users=userId and u.id!=unitId
	) 
	where id=userId;
           
          FETCH my_cursor INTO userId;
        END WHILE;
        CLOSE my_cursor;
    END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `unit_update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `unit_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `unit_update`(IN unitId varchar(50))
BEGIN 
	
	DECLARE userId VARCHAR(50) DEFAULT '' ;
	
	declare my_cursor CURSOR FOR select users from freecms_unit_user where unit =unitId ;
	
	 
        OPEN my_cursor;
         
        FETCH my_cursor INTO userId;
         
        WHILE ( userId is not null) DO
	
	update freecms_users 
	set unitNames=(
	select GROUP_CONCAT(NAME SEPARATOR  ';') 
	FROM freecms_unit u left join freecms_unit_user uu on u.id=uu.unit
	where uu.users=userId
	) 
	where id=userId;
           
          FETCH my_cursor INTO userId;
        END WHILE;
        CLOSE my_cursor;
    END
;;
DELIMITER ;