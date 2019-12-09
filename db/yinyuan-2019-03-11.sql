/*
Navicat MySQL Data Transfer

Source Server         : KevinSQL
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : yinyuan

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-03-11 12:03:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `feel`
-- ----------------------------
DROP TABLE IF EXISTS `feel`;
CREATE TABLE `feel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `songId` int(11) DEFAULT NULL COMMENT '歌曲id',
  `commentId` int(11) DEFAULT NULL COMMENT '网易云音乐评论id',
  `content` varchar(255) DEFAULT NULL COMMENT '感受内容',
  `attitude` tinyint(4) DEFAULT '1' COMMENT '感受态度：0-消极；1-积极',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='供选感受表（关联每首歌曲的感受选项内容）';

-- ----------------------------
-- Records of feel
-- ----------------------------
INSERT INTO `feel` VALUES ('1', '1', null, '轻松', null);
INSERT INTO `feel` VALUES ('2', '1', null, '励志', null);
INSERT INTO `feel` VALUES ('3', '1', null, '难受', null);
INSERT INTO `feel` VALUES ('4', '2', null, '难受', null);
INSERT INTO `feel` VALUES ('5', '3', null, '激情', null);

-- ----------------------------
-- Table structure for `song`
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `neId` int(11) DEFAULT NULL COMMENT '网易云音乐id',
  `name` varchar(255) DEFAULT NULL COMMENT '歌曲名',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面url',
  `flag` int(11) DEFAULT NULL COMMENT '网易云音乐的flag：音乐标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='歌曲表';

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1', '139774', 'The Truth That You Leave', 'Pianoboy高至豪', 'https://p1.music.126.net/9idkdzbel_-lYBP7Dv_dVQ==/102254581395289.jpg', null);
INSERT INTO `song` VALUES ('2', '400162138', '海阔天空', 'Beyond', 'http://p1.music.126.net/a9oLdcFPhqQyuouJzG2mAQ==/3273246124149810.jpg', null);
INSERT INTO `song` VALUES ('3', '461347998', 'Something Just Like This', 'The Chainsmokers / Coldplay', 'http://p2.music.126.net/ggnyubDdMxrhpqYvpZbhEQ==/3302932937412681.jpg', null);
INSERT INTO `song` VALUES ('4', '255858', '词不达意', '林忆莲', 'http://p1.music.126.net/05Mc3MS9L-hQQhgQnWEttg==/19064432114268939.jpg', null);
INSERT INTO `song` VALUES ('5', '462375091', '我们', '逆时针向', 'http://p2.music.126.net/fT5GWPu2mN6M8ETW8H9BZg==/109951162867232146.jpg', '2');
INSERT INTO `song` VALUES ('6', '22802198', '记忆', 'Paniyolo', 'http://p1.music.126.net/hzBmEv7NSIaL0Y_7XVB84Q==/616826023203547.jpg', null);
INSERT INTO `song` VALUES ('7', '572719808', 'Settle', '千坂', 'http://p2.music.126.net/wBCIBSNsrLo_is4_2eWkFw==/109951163346327830.jpg', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一编号',
  `wxOpenId` varchar(50) DEFAULT NULL COMMENT '微信用户在此程序的唯一id',
  `wxNickName` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `wxAvatarUrl` varchar(255) DEFAULT NULL COMMENT '微信头像url',
  `wxGender` int(1) DEFAULT NULL COMMENT '微信获取的性别',
  `yingandu` int(11) DEFAULT '100' COMMENT '音感度（用于游戏消耗用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', 'oVO7V5QzcKSizRgjy1u-otjFwuAc', 'Kevin_涛', 'https://wx.qlogo.cn/mmopen/vi_32/s6efzSuZdwkEqP2yhVhas1CorTwxfONiayeDXuj90JmTHXwEh30UoT2ppRBI7mMtIicyftkjbhOxXicBDnx08ugAg/132', '1', '100');

-- ----------------------------
-- Table structure for `userfeel`
-- ----------------------------
DROP TABLE IF EXISTS `userfeel`;
CREATE TABLE `userfeel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yyNum` varchar(255) DEFAULT NULL COMMENT '音缘序号（用当前时间+用户id作为唯一序号）',
  `hostId` int(11) DEFAULT NULL COMMENT '分享创建者id',
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `songId` int(11) DEFAULT NULL COMMENT '歌曲id',
  `feelId` int(11) DEFAULT NULL COMMENT '感受id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户感受表（关联用户听歌时选择的感受）';

-- ----------------------------
-- Records of userfeel
-- ----------------------------
INSERT INTO `userfeel` VALUES ('1', '201902271929184', '4', '4', '461347998', '316122442');
INSERT INTO `userfeel` VALUES ('2', '201902271929184', '4', '4', '22802198', '316122442');

-- ----------------------------
-- Table structure for `userhistory`
-- ----------------------------
DROP TABLE IF EXISTS `userhistory`;
CREATE TABLE `userhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `songId` int(11) DEFAULT NULL,
  `currentTime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户听歌历史表（用于最近播放）';

-- ----------------------------
-- Records of userhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `userlike`
-- ----------------------------
DROP TABLE IF EXISTS `userlike`;
CREATE TABLE `userlike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `songId` int(11) DEFAULT NULL COMMENT '歌曲id',
  `currentTime` time DEFAULT NULL COMMENT '当前时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户喜欢表（用于我喜欢的音乐）';

-- ----------------------------
-- Records of userlike
-- ----------------------------

-- ----------------------------
-- Table structure for `yinyuan`
-- ----------------------------
DROP TABLE IF EXISTS `yinyuan`;
CREATE TABLE `yinyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `partnerId` int(11) DEFAULT NULL COMMENT '匹配的用户id',
  `yyNum` varchar(255) DEFAULT NULL COMMENT '音缘序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='音缘表（若用户匹配音缘满阶，则将记录保存在此。可通过groupBy分组 count计数 orderBy排序进行最终排名）';

-- ----------------------------
-- Records of yinyuan
-- ----------------------------
