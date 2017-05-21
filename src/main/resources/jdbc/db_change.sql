--创建于2014-11-11 该文件用于存储所有的数据库变更
--注意：请务必写明注释，按规范添加sql变更语句
/**
 * 数据库执行语句概要说明
 * add by XXX
 * 日期
 */
--变更的可执行sql语句

--参考示例如下
/**
 * 添加字段XXX
 * add by zhouan
 * 2014-11-21
 */
--ALTER TABLE `table_name` ADD COLUMN field varchar(32) default null; 

/**
 * 添加App用户性别字段
 * add by czb
 * 2014-11-21
 */
ALTER TABLE `zyl_app_user`
ADD COLUMN `sex`  int(11) NULL AFTER `flg_delete`;
/**
 * 删除原设计表 重新设计账户表
 * add by czb
 * 2014-11-25
 */
drop table if exists zyl_user_account;

/*==============================================================*/
/* Table: zyl_user_account                                      */
/*==============================================================*/
create table zyl_user_account
(
   ID                   varchar(32) not null,
   user_id              varchar(32),
   account_sum          double,
   account_int          int,
   account_status       int,
   last_transaction_sum double,
   last_transaction_time   datetime,
   last_transaction_int int,
   last_transaction_int_time    datetime,
   creator              varchar(32),
   creator_name         varchar(50),
   create_time          datetime,
   updator              varchar(32),
   updator_name         varchar(50),
   update_time          datetime,
   flg_deleted          int,
   primary key (ID)
);

/**
 * 把App用户的财富值改为double类型
 * add by czb
 * 2014-11-25
 */
ALTER TABLE `zyl_app_user`
MODIFY COLUMN `wealth`  double(11,2) NULL DEFAULT NULL AFTER `integral`;


/**
 * 新建积分交易明细表
 * add by czb
 * 2014-11-27
 */
drop table if exists zyl_integral_record;
CREATE TABLE `zyl_integral_record` (
  `id` varchar(32) NOT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `integral_number` varchar(20) DEFAULT NULL,
  `integral_sum` int(11) DEFAULT NULL,
  `integral_type` varchar(20) DEFAULT NULL,
  `integral_time` datetime DEFAULT NULL,
  `integral_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/**
 * 修改问题部分字段以及创建问题评分的字段
 * add by czb
 * 2014-11-27
 */
ALTER TABLE `zyl_question`
MODIFY COLUMN `grade`  int(20) NULL DEFAULT NULL AFTER `question_description`,
MODIFY COLUMN `subject`  int(20) NULL DEFAULT NULL AFTER `grade`,
ADD COLUMN `score`  int(10) NULL AFTER `FLG_DELETED`;

/**
 * 添加用户图像字段
 * add by czb
 * 2014-12-13
 */
ALTER TABLE `zyl_app_user`
ADD COLUMN `attach_id`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `sex`;
/**
 * 添加对应框架用户Id
 * add by czb
 * 2014-12-15
 */
ALTER TABLE `zyl_teacher`
ADD COLUMN `sys_user_id`  varchar(32) NULL AFTER `online_status`;
/**
 * 问题表添加解决时间
 * add by czb
 * 2014-12-17
 */
ALTER TABLE `zyl_question`
ADD COLUMN `solved_time`  datetime NULL AFTER `score`;

/**
 * 关注教师字段
 * add by dmx
 * 2014-12-23
 */
ALTER TABLE `zyl_follow_teacher`
ADD COLUMN `followed`  varchar(11) NULL AFTER `FLG_DELETED`;


/**
 * 反馈表字段
 * add by dmx
 * 2014-12-25
 */
CREATE TABLE `zyl_feedback` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(50) default NULL,
  `feedback_content` varchar(10000) default NULL,
  `creator` varchar(32) default NULL,
  `creator_name` varchar(50) default NULL,
  `create_time` datetime default NULL,
  `updator` varchar(32) default NULL,
  `updator_name` varchar(50) default NULL,
  `update_time` datetime default NULL,
  `FLG_DELETED` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/**
 * 学生扣费问题查询表
 * add by czb
 * 2014-12-26
 */
CREATE TABLE `zyl_student_deduction` (
  `id` varchar(32) NOT NULL,
  `student_id` varchar(32) DEFAULT NULL,
  `question_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/**
 * 记录学生消费话题时，非单次消耗的记录
 * add by dmx
 * 2014-12-27
 */
CREATE TABLE `zyl_not_single` (
`ID`  varchar(32) NULL ,
`student_id`  varchar(32) NULL ,
`topic_id`  varchar(32) NULL ,
PRIMARY KEY (`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/**
 *	修改教师评分字段类型
 * add by czb
 * 2014-12-29
 */
ALTER TABLE `zyl_teacher`
MODIFY COLUMN `score`  float(2,1) NULL DEFAULT NULL AFTER `subjects`;
/**
 *话题表增加来源
 *by dmx
 */
ALTER TABLE `zyl_topic`
ADD COLUMN `source`  varchar(50) NULL AFTER `attach_id`;
/**
 * 修改问题列表。添加一个字段存储缩放处理后的图片ID
 * add by zyf
 * 2014-1-19
 */
ALTER TABLE `zyl_question`
ADD COLUMN `scaled_attach_id`  varchar(32) NULL AFTER `attach_id`;
/**
 * 提问的图片缩略图生成配置信息
 * add by zyf
 * 2015-1-23
 */
-- ----------------------------
-- Table structure for `zyl_question_attach_config`
-- ----------------------------
-- DROP TABLE IF EXISTS `zyl_question_attach_config`;
CREATE TABLE `zyl_question_attach_config` (
  `ID` varchar(32) NOT NULL,
  `switchStatu` varchar(32) NOT NULL,
  `scaleRate` double NOT NULL,
  `maxSize` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zyl_question_attach_config
-- 默认的配置信息
-- ----------------------------
INSERT INTO `zyl_question_attach_config` VALUES ('1', '1', '0.5', '102400');
