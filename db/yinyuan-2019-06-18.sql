/*
Navicat MySQL Data Transfer

Source Server         : KevinSQL
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : yinyuan

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-06-18 16:27:30
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=797 DEFAULT CHARSET=utf8 COMMENT='歌曲表';

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES ('1', '386538', '温柔', '五月天', 'http://p1.music.126.net/AmUoDfx17bcXoZF0uxU0-A==/109951163188724394.jpg', '128');
INSERT INTO `song` VALUES ('2', '277822', '电台情歌', '莫文蔚', 'http://p1.music.126.net/ImOQNmJZTzogPdt0-AsyDA==/19045740416582430.jpg', '0');
INSERT INTO `song` VALUES ('3', '63650', '独家记忆', '陈小春', 'http://p1.music.126.net/D_e8zPgwkKCk1uSF-HSgbw==/18806046883327256.jpg', '132');
INSERT INTO `song` VALUES ('4', '108914', '江南', '林俊杰', 'http://p1.music.126.net/3jBJ00NEgPuhRFAYwErgag==/109951163533012556.jpg', '128');
INSERT INTO `song` VALUES ('5', '65528', '淘汰', '陈奕迅', 'http://p1.music.126.net/o_OjL_NZNoeog9fIjBXAyw==/18782957139233959.jpg', '4');
INSERT INTO `song` VALUES ('6', '210049', '布拉格广场', '蔡依林-周杰伦', 'http://p1.music.126.net/lsMlFshdJ96aTGFFgayh4Q==/109951163611523278.jpg', '4');
INSERT INTO `song` VALUES ('7', '25641873', '爱错', '王力宏', 'http://p1.music.126.net/n6gM4zQ9v82FjRMAk-FX2Q==/109951163095167784.jpg', '128');
INSERT INTO `song` VALUES ('8', '376971', '樱花草', 'Sweety', 'http://p1.music.126.net/DtXaOWquQHyB9edIuOADgg==/109951163061823739.jpg', '128');
INSERT INTO `song` VALUES ('9', '394670', '给自己的歌', '李宗盛', 'http://p1.music.126.net/CZQlP4Qgy2jbk22BKyDkUA==/120946279068589.jpg', '128');
INSERT INTO `song` VALUES ('10', '254574', '后来', '刘若英', 'http://p1.music.126.net/eBF7bHnJYBUfOFrJ_7SUfw==/109951163351825356.jpg', '128');
INSERT INTO `song` VALUES ('11', '26620756', '当爱已成往事', '张国荣', 'http://p1.music.126.net/AtMpiqgluHefLF6nD_Pcug==/4417837720418086.jpg', '132');
INSERT INTO `song` VALUES ('12', '139893', 'Tell Me', '潘玮柏-徐洁儿', 'http://p1.music.126.net/ynooUQV9Gogq7XLUnu3A5A==/18899505370117257.jpg', '132');
INSERT INTO `song` VALUES ('13', '375917', '恋人未满', 'S.H.E', 'http://p1.music.126.net/gQSPQKrqDdN5Igg9IYG0Zg==/109951163304306565.jpg', '4');
INSERT INTO `song` VALUES ('14', '287719', '开始懂了', '孙燕姿', 'http://p1.music.126.net/K4v_uhPOtikMGAs__QG5eg==/109951163200245079.jpg', '132');
INSERT INTO `song` VALUES ('15', '146664', '如果爱能早些说出来', '山野', 'http://p1.music.126.net/TJzqtc1hBX_NmmTrqFTpgg==/130841883718513.jpg', '128');
INSERT INTO `song` VALUES ('16', '307684', '最熟悉的陌生人', '萧亚轩', 'http://p1.music.126.net/R0b5i1F0gmb49D-5P-rYWQ==/6665239487632442.jpg', '128');
INSERT INTO `song` VALUES ('17', '5256956', '放生', '范逸臣', 'http://p2.music.126.net/mavNqboRJusLe8liMbwfZw==/64871186055850.jpg', '128');
INSERT INTO `song` VALUES ('18', '307780', '七月七日晴', '许慧欣', 'http://p2.music.126.net/oAIdonRUGMSewYu4lYVwHQ==/109951163240609542.jpg', '132');
INSERT INTO `song` VALUES ('19', '108390', '说谎', '林宥嘉', 'http://p2.music.126.net/mMZNB-jhYsw29K61QtopJA==/109951163187404137.jpg', '4');
INSERT INTO `song` VALUES ('20', '255858', '词不达意', '林忆莲', 'http://p2.music.126.net/05Mc3MS9L-hQQhgQnWEttg==/19064432114268939.jpg', '4');
INSERT INTO `song` VALUES ('21', '385965', '知足', '五月天', 'http://p2.music.126.net/_B1Fn_Z1WxHzqGLzLZDf-w==/109951163263882447.jpg', '128');
INSERT INTO `song` VALUES ('22', '299757', '红豆', '王菲', 'http://p2.music.126.net/62SmuCNsZRdyY_GEZWk_Ag==/109951163416516218.jpg', '128');
INSERT INTO `song` VALUES ('23', '169185', '认真的雪', '薛之谦', 'http://p2.music.126.net/174rUbKzjQlBp8wN5q-l6Q==/897201488265660.jpg', '4');
INSERT INTO `song` VALUES ('24', '167876', '有何不可', '许嵩', 'http://p2.music.126.net/Md3RLH0fe2a_3dMDnfqoQg==/18590542604286213.jpg', '0');
INSERT INTO `song` VALUES ('25', '189986', '记事本', '陈慧琳', 'http://p2.music.126.net/aGMEzsJAfqZSvgNsXEDlUw==/109951163076155907.jpg', '4');
INSERT INTO `song` VALUES ('26', '135394', '该死的温柔', '马天宇', 'http://p2.music.126.net/QZLwBjoTdh6BLICqmXMhHA==/18796151278696634.jpg', '128');
INSERT INTO `song` VALUES ('27', '85491', '童话', '光良', 'http://p2.music.126.net/nx857VcLP_5g94UlyFlRzA==/109951163400213405.jpg', '128');
INSERT INTO `song` VALUES ('28', '185919', '爱我别走', '张震岳', 'http://p2.music.126.net/y-7BwF3KQVJDwjXypcmYWA==/19035844811868044.jpg', '128');
INSERT INTO `song` VALUES ('29', '375892', '热带雨林', 'S.H.E', 'http://p2.music.126.net/OmTmzNgcqANuJxi70DS81A==/109951163200170076.jpg', '4');
INSERT INTO `song` VALUES ('30', '224000', '怎样', '戴佩妮', 'http://p2.music.126.net/U-0qobZAtfxplzArDlXQiQ==/6655343883007883.jpg', '132');
INSERT INTO `song` VALUES ('31', '65533', '红玫瑰', '陈奕迅', 'http://p2.music.126.net/o_OjL_NZNoeog9fIjBXAyw==/18782957139233959.jpg', '132');
INSERT INTO `song` VALUES ('32', '167975', '曾经的你', '许巍', 'http://p2.music.126.net/GoiTB6oG3vQWntnCjKRw0g==/109951163092691594.jpg', '132');
INSERT INTO `song` VALUES ('33', '26508186', '天空之城', '李志', 'http://p2.music.126.net/qDiDdR6wbQCsGsn34dmCVg==/2378243650941255.jpg', '130');
INSERT INTO `song` VALUES ('34', '254485', '勇气', '梁静茹', 'http://p2.music.126.net/PavIMxZq16K7-0fSF5n-yg==/109951163240604120.jpg', '128');
INSERT INTO `song` VALUES ('35', '188429', '我真的受伤了', '张学友', 'http://p2.music.126.net/blZlhdVmYSUwgqSUxFs88Q==/19047939439853431.jpg', '4');
INSERT INTO `song` VALUES ('36', '470573565', '同桌的你', '老狼', 'http://p2.music.126.net/pSFRx0k3dK4zu2BxdqsUHQ==/18700493767075026.jpg', '128');
INSERT INTO `song` VALUES ('37', '156193', '为你写诗', '吴克群', 'http://p2.music.126.net/PAj4Lw81_M2DZ-Sw0ncsQA==/109951163200251206.jpg', '128');
INSERT INTO `song` VALUES ('38', '209758', '倒带', '蔡依林', 'http://p2.music.126.net/SauiF-zACp_cLXF6Gjffbw==/18768663488035234.jpg', '0');
INSERT INTO `song` VALUES ('39', '326880', '掉了', '张惠妹', 'http://p2.music.126.net/QIF6JtLCGWS8aR5ZnIqbyA==/109951163265782274.jpg', '128');
INSERT INTO `song` VALUES ('40', '354593', '我们的爱', 'F.I.R.', 'http://p2.music.126.net/2OBBj4BVn3ruTCr3AEtHKA==/19230458370103370.jpg', '132');
INSERT INTO `song` VALUES ('41', '256468', '至少还有你', '林忆莲', 'http://p2.music.126.net/xEyRt-hCsxf0qGahe4x_cQ==/6667438510890773.jpg', '128');
INSERT INTO `song` VALUES ('42', '108886', '一千年以后', '林俊杰', 'http://p2.music.126.net/JCiDNNqSibHavohERAVO7A==/109951163187405670.jpg', '128');
INSERT INTO `song` VALUES ('43', '110452', '爱转角', '罗志祥', 'http://p2.music.126.net/rpKM3-oZ2MbMDqanDmwBoQ==/98956046511949.jpg', '128');
INSERT INTO `song` VALUES ('44', '191252', '我们都一样', '张杰', 'http://p2.music.126.net/ixIs5kkukgNYMmeDsc35_g==/29686813955450.jpg', '4');
INSERT INTO `song` VALUES ('45', '286980', '雨天', '孙燕姿', 'http://p2.music.126.net/ZpcOx5dbNTRK94vSIM20PQ==/768558627827568.jpg', '4');
INSERT INTO `song` VALUES ('46', '4875084', '恶作剧', '王蓝茵', 'http://p2.music.126.net/3n01o8lnrbQfopy5PkpppA==/18877515137439308.jpg', '128');
INSERT INTO `song` VALUES ('47', '299264', '旋木', '王菲', 'http://p2.music.126.net/vSeTOn78VpWUpG0WEXEJzw==/36283883728675.jpg', '128');
INSERT INTO `song` VALUES ('48', '26090160', '单身情歌', '林志炫', 'http://p2.music.126.net/vdrh_W-Q6rZUT1XWaqHV_Q==/2268292488121204.jpg', '0');
INSERT INTO `song` VALUES ('49', '375356', '一眼万年', 'S.H.E', 'http://p2.music.126.net/VuA_MdezFmwORAMt9VoWOg==/109951163568415649.jpg', '4');
INSERT INTO `song` VALUES ('50', '133998', '老街', '李荣浩', 'http://p2.music.126.net/fZFrplIVrHMx4lvgdqiIHQ==/42880953496261.jpg', '0');
INSERT INTO `song` VALUES ('51', '4875075', '遇到', '方雅贤', 'http://p2.music.126.net/3n01o8lnrbQfopy5PkpppA==/18877515137439308.jpg', '256');
INSERT INTO `song` VALUES ('52', '210042', '说爱你', '蔡依林', 'http://p2.music.126.net/lsMlFshdJ96aTGFFgayh4Q==/109951163611523278.jpg', '4');
INSERT INTO `song` VALUES ('53', '209121', '陌生人', '蔡健雅', 'http://p2.music.126.net/esEA4212Po6XG2beTzC_sA==/109951163447766714.jpg', '128');
INSERT INTO `song` VALUES ('54', '254191', '可惜不是你', '梁静茹', 'http://p2.music.126.net/JwUTCEySzPijv-qtzeScPQ==/109951163240621579.jpg', '0');
INSERT INTO `song` VALUES ('55', '4877892', '花香', '许绍洋', 'http://p2.music.126.net/rOCl8jAaGzD-Nyy8T83dTA==/109951163240618629.jpg', '0');
INSERT INTO `song` VALUES ('56', '287035', '遇见', '孙燕姿', 'http://p2.music.126.net/ZpcOx5dbNTRK94vSIM20PQ==/768558627827568.jpg', '132');
INSERT INTO `song` VALUES ('57', '41656275', '那年', '任然', 'http://p2.music.126.net/CqLps3U9GvGQm8xpbLg3iw==/18301371044542173.jpg', '2');
INSERT INTO `song` VALUES ('58', '347355', '情人', 'Beyond', 'http://p2.music.126.net/suco52xu0lv3dhykrrL_vg==/65970697667610.jpg', '4');
INSERT INTO `song` VALUES ('59', '400161345', '当你', '王心凌', 'http://p2.music.126.net/hpUff0xWzMlZUKL1cRClAA==/109951163438595294.jpg', '132');
INSERT INTO `song` VALUES ('60', '188432', '如果这都不算爱', '张学友', 'http://p1.music.126.net/blZlhdVmYSUwgqSUxFs88Q==/19047939439853431.jpg', '132');
INSERT INTO `song` VALUES ('61', '375624', '候鸟', 'S.H.E', 'http://p1.music.126.net/iJa-mOMal2Bz0BRmY4U0Dw==/109951163251479454.jpg', '4');
INSERT INTO `song` VALUES ('62', '110447', '小丑鱼', '罗志祥', 'http://p1.music.126.net/rpKM3-oZ2MbMDqanDmwBoQ==/98956046511949.jpg', '128');
INSERT INTO `song` VALUES ('63', '307525', '独角戏', '许茹芸', 'http://p1.music.126.net/u-rthLIMDrXMNHIY2jgHUQ==/19183179370087479.jpg', '132');
INSERT INTO `song` VALUES ('64', '247536', '亲爱的你怎么不在我身边', '江美琪', 'http://p1.music.126.net/yJ1jJ2Vivuwr7rtUe4Y6oQ==/109951163239136680.jpg', '4');
INSERT INTO `song` VALUES ('65', '150623', '普通朋友', '陶喆', 'http://p1.music.126.net/vp2j84DbGiUQ4-yYJ_N4yQ==/6649846324860304.jpg', '132');
INSERT INTO `song` VALUES ('66', '60263', '他一定很爱你', '阿杜', 'http://p1.music.126.net/3lrUXI96dmlEi2UgeIhOHg==/109951163076301483.jpg', '128');
INSERT INTO `song` VALUES ('67', '108179', '浪费', '林宥嘉', 'http://p2.music.126.net/os7qbSSng_yni2ZFouUryw==/109951163167636205.jpg', '4');
INSERT INTO `song` VALUES ('68', '185700', '思念是一种病', '张震岳-蔡健雅', 'http://p2.music.126.net/N61oLy0iLfEkZTHD2j87iA==/18693896697392706.jpg', '128');
INSERT INTO `song` VALUES ('69', '92311', '西厢', '后弦', 'http://p2.music.126.net/g1JALP78PBYOl1I4wxHDwA==/844424930132293.jpg', '128');
INSERT INTO `song` VALUES ('70', '209108', '无底洞', '蔡健雅', 'http://p2.music.126.net/esEA4212Po6XG2beTzC_sA==/109951163447766714.jpg', '128');
INSERT INTO `song` VALUES ('71', '354620', '只对你有感觉', '飞轮海-田馥甄', 'http://p2.music.126.net/stuv775A-VqfiIX6WaiEJA==/109951163188525496.jpg', '4');
INSERT INTO `song` VALUES ('72', '25643328', '信仰', '张信哲', 'http://p2.music.126.net/0ITETv8OI3x2XOnsLlx_Jw==/109951163067344307.jpg', '0');
INSERT INTO `song` VALUES ('73', '254639', '秘密', '蓝又时', 'http://p2.music.126.net/bkbFqEmf4gXgi_feszB9lQ==/109951163240610882.jpg', '132');
INSERT INTO `song` VALUES ('74', '189315', '慢慢', '张学友', 'http://p2.music.126.net/KkEfoix3ZrxIvJlEcLziow==/84662395339598.jpg', '132');
INSERT INTO `song` VALUES ('75', '139357', '生如夏花', '朴树', 'http://p2.music.126.net/xuW0eAX30At9yn8vp0Z3AA==/83562883723684.jpg', '132');
INSERT INTO `song` VALUES ('76', '190072', '黄昏', '周传雄', 'http://p2.music.126.net/Y91B_GXc5d9t-0X0Uu_7xw==/109951163063096750.jpg', '0');
INSERT INTO `song` VALUES ('77', '209609', '听说爱情回来过', '蔡依林', 'http://p2.music.126.net/eWEUNXodz-PChcITtblXZQ==/18675205000257798.jpg', '0');
INSERT INTO `song` VALUES ('78', '185726', '再见', '张震岳', 'http://p2.music.126.net/ovYzwC_wSPz9EZ18xBDSZA==/100055558139763.jpg', '128');
INSERT INTO `song` VALUES ('79', '223994', '你要的爱', '戴佩妮', 'http://p2.music.126.net/U-0qobZAtfxplzArDlXQiQ==/6655343883007883.jpg', '132');
INSERT INTO `song` VALUES ('80', '375020', '安静了', 'S.H.E', 'http://p2.music.126.net/oZ5SakgYfbQ7n_dbsK_prw==/109951163167502251.jpg', '4');
INSERT INTO `song` VALUES ('81', '139764', '不得不爱', '潘玮柏-弦子', 'http://p2.music.126.net/ueWEomHZUpSOPwJ8jL4I4Q==/19196373509643887.jpg', '132');
INSERT INTO `song` VALUES ('82', '205342', '给我一个理由忘记', 'A-Lin', 'http://p2.music.126.net/YCSTxlHAvrZ-rEs1_dwQUw==/46179488379897.jpg', '128');
INSERT INTO `song` VALUES ('83', '150432', '爱我还是他', '陶喆', 'http://p2.music.126.net/W3aZ9yJpQtdkzhxZpYSBrA==/109951163250123646.jpg', '132');
INSERT INTO `song` VALUES ('84', '150337', '如果我变成回忆', 'Tank', 'http://p2.music.126.net/fvh-rwbwVGyjO4E6cHTpOA==/109951163167512803.jpg', '4');
INSERT INTO `song` VALUES ('85', '189688', '寂寞沙洲冷', '周传雄', 'http://p2.music.126.net/lzxE9m7tJ5aHgqyuoaey9Q==/109951163434363994.jpg', '4');
INSERT INTO `song` VALUES ('86', '186436', '玻璃之情', '张国荣', 'http://p2.music.126.net/2YIpNoCzXfYgz4zIw3s0Vg==/73667279073787.jpg', '132');
INSERT INTO `song` VALUES ('87', '254589', '很爱很爱你', '刘若英', 'http://p2.music.126.net/9hMNsSmjGiXa1AYrwoSapQ==/109951163200283565.jpg', '128');
INSERT INTO `song` VALUES ('88', '186560', '过火', '张信哲', 'http://p2.music.126.net/BbtqIF_OYpDk21lqTKROCQ==/638816255750141.jpg', '0');
INSERT INTO `song` VALUES ('89', '27646687', '玫瑰花的葬礼', '许嵩', 'http://p2.music.126.net/2iwn7NnfNwtdyu1enlJw_w==/83562883723773.jpg', '128');
INSERT INTO `song` VALUES ('90', '5250048', '吻得太逼真', '张敬轩', 'http://p2.music.126.net/Q2ZdCgehfRnj0xUESojrCw==/120946279073350.jpg', '132');
INSERT INTO `song` VALUES ('91', '4875310', '六月的雨', '胡歌', 'http://p2.music.126.net/4tTN8CnR7wG4E1cauIPCvQ==/109951163240682406.jpg', '4');
INSERT INTO `song` VALUES ('92', '189323', '断点', '张敬轩', 'http://p1.music.126.net/UwB8YHn4BWODYj_CuGt37w==/109951163520357845.jpg', '4');
INSERT INTO `song` VALUES ('93', '150520', 'Melody', '陶喆', 'http://p1.music.126.net/HMhU9tbNP_Qyel369htWzw==/18516875325082773.jpg', '128');
INSERT INTO `song` VALUES ('94', '187374', '我', '张国荣', 'http://p1.music.126.net/Sbhanu6TSPEOq655lj34Gg==/98956046505532.jpg', '4');
INSERT INTO `song` VALUES ('95', '63892', '献世', '陈小春', 'http://p1.music.126.net/M7QI8c_Rz3WutSXsX8iWNQ==/827932255758625.jpg', '0');
INSERT INTO `song` VALUES ('96', '120255', '彩虹天堂', '刘畊宏', 'http://p1.music.126.net/MgyEq4aq7PMS_7efp90ofA==/18682901580996694.jpg', '132');
INSERT INTO `song` VALUES ('97', '167873', '多余的解释', '许嵩', 'http://p1.music.126.net/Md3RLH0fe2a_3dMDnfqoQg==/18590542604286213.jpg', '128');
INSERT INTO `song` VALUES ('98', '167916', '梦一场', '萧敬腾', 'http://p1.music.126.net/n4rCFiFFxb81OrJ8Bl9PXA==/109951163076302415.jpg', '132');
INSERT INTO `song` VALUES ('99', '233880', '该忘了', '郭采洁', 'http://p1.music.126.net/JFS8SpUfd3Ov_c49DElN1w==/37383395361203.jpg', '132');
INSERT INTO `song` VALUES ('100', '239188', '没那么简单', '黄小琥', 'http://p1.music.126.net/U0dHDI2p0qE6pj_G5sNA2Q==/109951163188719906.jpg', '132');
INSERT INTO `song` VALUES ('101', '298317', '屋顶', '温岚-周杰伦', 'http://p1.music.126.net/vu3Cdo_dPq8HKOPI6_YXfA==/74766790689775.jpg', '0');
INSERT INTO `song` VALUES ('102', '209804', '天空', '蔡依林', 'http://p1.music.126.net/pJrG5YLSnp3tuaprJUaD4g==/18544363115960190.jpg', '128');
INSERT INTO `song` VALUES ('103', '25641640', '谁动了我的琴弦', '周笔畅', 'http://p1.music.126.net/UUEdpBG-aHP0sH1Ph3Paxg==/748767418557524.jpg', '0');
INSERT INTO `song` VALUES ('104', '5249197', '叶子', '阿桑', 'http://p1.music.126.net/hCkKHm7J1hDNlmC9vmAV4Q==/109951163368468453.jpg', '132');
INSERT INTO `song` VALUES ('105', '296885', '寂寞寂寞就好', '田馥甄', 'http://p1.music.126.net/_o12jScXd17VO79VCsitbA==/109951163167534993.jpg', '4');
INSERT INTO `song` VALUES ('106', '27591608', '暧昧', '杨丞琳', 'http://p1.music.126.net/9uaPa9adNz9qhrE7dUL_Dg==/109951163200239535.jpg', '4');
INSERT INTO `song` VALUES ('107', '255907', '胆小鬼', '梁咏琪', 'http://p1.music.126.net/OLroXJamq8uM44u1Jawpyw==/51677046522535.jpg', '128');
INSERT INTO `song` VALUES ('108', '210089', '依恋', '蔡淳佳', 'http://p1.music.126.net/8rjOcwrVW91hfXGAJJUgjw==/61572651167766.jpg', '0');
INSERT INTO `song` VALUES ('109', '209914', '柠檬草的味道', '蔡依林', 'http://p1.music.126.net/X_VJoV9ZJ8vqM49C1WIm-w==/109951163188534786.jpg', '4');
INSERT INTO `song` VALUES ('110', '297845', '第一次爱的人', '王心凌', 'http://p1.music.126.net/fWPeZM19RQyorQaHvOkJRA==/109951163797863344.jpg', '0');
INSERT INTO `song` VALUES ('111', '22740077', '左边', '杨丞琳', 'http://p1.music.126.net/Bs1QSZie0p1yM6hH_eqw-w==/758663023207500.jpg', '132');
INSERT INTO `song` VALUES ('112', '306927', '一个人失忆', '薛凯琪', 'http://p1.music.126.net/NvHbvXWmXljkuoX1Up2eYA==/109951163061823860.jpg', '132');
INSERT INTO `song` VALUES ('113', '27483167', '唯一', '王力宏', 'http://p1.music.126.net/Lg4KxGm6uI54FRbyVctT6w==/4460718673904110.jpg', '132');
INSERT INTO `song` VALUES ('114', '354455', '流星雨', 'F4', 'http://p1.music.126.net/YoRS_jpQMuBRi6Lm8erqfQ==/109951163300146997.jpg', '132');
INSERT INTO `song` VALUES ('115', '307057', '类似爱情', '萧亚轩', 'http://p1.music.126.net/2WOyWiS4STWB8f-2hse00Q==/6674035580676721.jpg', '4');
INSERT INTO `song` VALUES ('116', '327225', '如果爱下去', '张靓颖', 'http://p2.music.126.net/iWH_tdWz4nHPUPxRepNiQQ==/109951163239131472.jpg', '132');
INSERT INTO `song` VALUES ('117', '327096', '人质', '张惠妹', 'http://p2.music.126.net/tyk7m0lkzAyEblOLR6VtGg==/109951163271830284.jpg', '132');
INSERT INTO `song` VALUES ('118', '108918', '害怕', '林俊杰', 'http://p2.music.126.net/3jBJ00NEgPuhRFAYwErgag==/109951163533012556.jpg', '128');
INSERT INTO `song` VALUES ('119', '254180', '丝路', '梁静茹', 'http://p2.music.126.net/JwUTCEySzPijv-qtzeScPQ==/109951163240621579.jpg', '128');
INSERT INTO `song` VALUES ('120', '257098', '为你我受冷风吹', '林忆莲', 'http://p2.music.126.net/5qWWTetRGYBc-ktiJLZsCw==/109951163076136658.jpg', '128');
INSERT INTO `song` VALUES ('121', '277302', '爱', '莫文蔚', 'http://p2.music.126.net/hcY73QYZt36DeGf91euboQ==/18921495602636668.jpg', '0');
INSERT INTO `song` VALUES ('122', '326719', '喜欢', '张悬', 'http://p2.music.126.net/cqjqHciJnB2KrII4UKHmYg==/18729081069316362.jpg', '132');
INSERT INTO `song` VALUES ('123', '254422', '分手快乐', '梁静茹', 'http://p2.music.126.net/b9U8qwgCo7u-ILuXIhjweQ==/109951163076163223.jpg', '0');
INSERT INTO `song` VALUES ('124', '326997', '趁早', '张惠妹', 'http://p2.music.126.net/WoybHfawR7c1gmXJQDHviw==/32985348845360.jpg', '128');
INSERT INTO `song` VALUES ('125', '209326', '旅行的意义', '陈绮贞', 'http://p2.music.126.net/BZNpKSKkPTTv5ZnxdYAdUQ==/5850501371402948.jpg', '128');
INSERT INTO `song` VALUES ('126', '205449', '失恋无罪', 'A-Lin', 'http://p2.music.126.net/mOyWKb751UIr8YeemHQqYg==/80264348833691.jpg', '128');
INSERT INTO `song` VALUES ('127', '326904', '如果你也听说', '张惠妹', 'http://p2.music.126.net/-ZRQT0sqWRu2y-cMT8mmvA==/109951163265779897.jpg', '0');
INSERT INTO `song` VALUES ('128', '276936', '阴天', '莫文蔚', 'http://p2.music.126.net/ZssgfaO-g7uvnI-7EEal9A==/109951163447793114.jpg', '128');
INSERT INTO `song` VALUES ('129', '108806', '原来', '林俊杰', 'http://p2.music.126.net/1zejHFYnv-7I3txr0EvdoA==/96757023249573.jpg', '128');
INSERT INTO `song` VALUES ('130', '27955653', '你还要我怎样', '薛之谦', 'http://p2.music.126.net/WPHmBisDxnoF4DrBLKwl3Q==/109951163169021112.jpg', '128');
INSERT INTO `song` VALUES ('131', '109729', '离人', '林志炫', 'http://p2.music.126.net/0iKLtwsIwOMksbNkZUJLzg==/16671894812505379.jpg', '132');
INSERT INTO `song` VALUES ('132', '287063', '我怀念的', '孙燕姿', 'http://p2.music.126.net/PehnaQ-BaAXeQg1d5s7leA==/6635552673699715.jpg', '132');
INSERT INTO `song` VALUES ('133', '276904', '外面的世界', '莫文蔚', 'http://p2.music.126.net/4nOKJJO8FnES0V5RUABkDQ==/19193074974607829.jpg', '132');
INSERT INTO `song` VALUES ('134', '360908', '你是此生最美的风景', 'JS', 'http://p2.music.126.net/g7Hjz6Z-aaN_ngbXjNpOTg==/46179488372404.jpg', '128');
INSERT INTO `song` VALUES ('135', '28566071', 'Life goes on', '浅岡雄也', 'http://p2.music.126.net/WP0CSWy_zX-Fz7RpHFqOqw==/6045114929910899.jpg', '0');
INSERT INTO `song` VALUES ('136', '473964322', 'メインタイトル', '高梨康治', 'http://p2.music.126.net/GTJklYu8ookO_01Uul08XA==/18821440046173430.jpg', '0');
INSERT INTO `song` VALUES ('137', '493042866', 'ガオレンジャー吼えろ!!', '山形ユキオ-高尾直樹-佐々木久美-斉藤妙子', 'http://p2.music.126.net/5p57gxIJO9L2bU7Vxz5TJw==/19212866184018102.jpg', '132');
INSERT INTO `song` VALUES ('138', '4990422', '君が好きだと叫びたい', 'BAAD', 'http://p2.music.126.net/UtHgWKjp6mANCa6C2IR7nw==/19045740416543667.jpg', '0');
INSERT INTO `song` VALUES ('139', '28285777', '清く正しくカブタック', '草尾毅', 'http://p2.music.126.net/q4lWarUS-yGnzJDTa_SIUA==/6009930557523167.jpg', '0');
INSERT INTO `song` VALUES ('140', '29822196', '海绵宝宝片尾曲', 'Various Artists', 'http://p2.music.126.net/Bnd2VwFCu8nWWZ8DY5BWcg==/3294136838291285.jpg', '0');
INSERT INTO `song` VALUES ('141', '19207074', 'SpongeBob SquarePants Theme Song', 'SpongeBob Squarepants', 'http://p2.music.126.net/nscEj2HmZQsG_WDuZh1BcA==/18444307556205933.jpg', '128');
INSERT INTO `song` VALUES ('142', '27907902', '和平号角', '王强', 'http://p2.music.126.net/58p_w90DDfD1mRVs1rGFmg==/3429376768564697.jpg', '0');
INSERT INTO `song` VALUES ('143', '29544002', '勇闯天下', '青鸟飞鱼', 'http://p2.music.126.net/0IfSoI2hhLXsctPV6-aBWQ==/3276544652384842.jpg', '128');
INSERT INTO `song` VALUES ('144', '30830982', '快乐小神仙', '天唱组合', 'http://p2.music.126.net/J3VtOLW7ilNc0byWk37n3g==/3387595325986974.jpg', '0');
INSERT INTO `song` VALUES ('145', '31273716', '月亮船', '王英姿', 'http://p2.music.126.net/4Pu7M0q88fVVoo1ZFS_nmw==/3408486047237011.jpg', '0');
INSERT INTO `song` VALUES ('146', '27927195', '天大地大我没家', '刘巍巍', 'http://p2.music.126.net/MqhWbOm7G3kuzk1m4eYIsw==/528865097731107.jpg', '0');
INSERT INTO `song` VALUES ('147', '29850050', '三毛', '田毅', 'http://p2.music.126.net/OXmGmFI7keckpS0IhZ0VeA==/3254554419407433.jpg', '0');
INSERT INTO `song` VALUES ('148', '31838335', '尘曦', '陈洁丽-李培斌', 'http://p2.music.126.net/X-_qf_rADUkIO1iyyzzDoQ==/18941286811905314.jpg', '0');
INSERT INTO `song` VALUES ('149', '4968420', 'TAKE ME HIGHER', '矢野立美', 'http://p2.music.126.net/ovp01WdK31MShAHgi9i7OQ==/19231557881557586.jpg', '0');
INSERT INTO `song` VALUES ('150', '391617', '恩佐之歌', '洛克王国', 'http://p2.music.126.net/sI4rFJy0y0RxDHVn7_R9EQ==/556352883691322.jpg', '0');
INSERT INTO `song` VALUES ('151', '391606', '魔法时刻', '洛克王国', 'http://p1.music.126.net/sI4rFJy0y0RxDHVn7_R9EQ==/556352883691322.jpg', '0');
INSERT INTO `song` VALUES ('152', '391613', '神宠传说', '洛克王国', 'http://p1.music.126.net/sI4rFJy0y0RxDHVn7_R9EQ==/556352883691322.jpg', '0');
INSERT INTO `song` VALUES ('153', '297791', '梦的光点', '王心凌', 'http://p1.music.126.net/2Zjz4kZUe10vBtjRBkJ3RQ==/109951163526099358.jpg', '0');
INSERT INTO `song` VALUES ('154', '28953457', '生命的云彩', '沸点乐队', 'http://p1.music.126.net/Jq3oZYisFNar2eSG4XhRjg==/3409585558713986.jpg', '0');
INSERT INTO `song` VALUES ('155', '557581463', '超智能足球', '果味VC', 'http://p1.music.126.net/6e7zGXqNASP8sInt7hnhyQ==/109951163293095989.jpg', '0');
INSERT INTO `song` VALUES ('156', '22657742', 'Now or Never', 'CHEMISTRY', 'http://p1.music.126.net/GZLJ_OgrMQgn_S-NSQPiUw==/945579999912394.jpg', '0');
INSERT INTO `song` VALUES ('157', '25893916', 'ムーンライト伝説', 'Dali', 'http://p1.music.126.net/sJdPWZQ-_6H9gJdPr9NO0A==/2490393836967714.jpg', '132');
INSERT INTO `song` VALUES ('158', '28188452', '小英雄哪吒', '孙楠', 'http://p1.music.126.net/-7gL1G_kVsgIb7eAFyQdNA==/3262251001467551.jpg', '0');
INSERT INTO `song` VALUES ('159', '27901933', '少年英雄小哪吒', '杨采钰', 'http://p1.music.126.net/Atrk294Vn5hwoUi3quky8w==/3385396303317257.jpg', '0');
INSERT INTO `song` VALUES ('160', '40157267', 'おどるポンポコリン', '大原櫻子', 'http://p1.music.126.net/4ABG5yptXTyw5GBg0RMfyA==/3238061748157652.jpg', '0');
INSERT INTO `song` VALUES ('161', '28267530', '再飞行', '逃跑计划', 'http://p1.music.126.net/Vt5GqdTxuxGhH6acTbrFQw==/3308430489032743.jpg', '0');
INSERT INTO `song` VALUES ('162', '33085510', 'Mojospy', '泰然', 'http://p1.music.126.net/lFj9dsCs9ucmrZlUQ_NcKQ==/3273246117440964.jpg', '0');
INSERT INTO `song` VALUES ('163', '28819380', 'Evil Eyes', '鲁士郎', 'http://p1.music.126.net/OjJ00xGoVuEnRhW_ciQ8uQ==/5848302348375304.jpg', '130');
INSERT INTO `song` VALUES ('164', '28819379', '梦想之地', '鲁士郎', 'http://p1.music.126.net/OjJ00xGoVuEnRhW_ciQ8uQ==/5848302348375304.jpg', '130');
INSERT INTO `song` VALUES ('165', '26619167', '开心英雄', '邵夷贝', 'http://p1.music.126.net/72QrkEBai1d0qNz60vp3bw==/4442026976227733.jpg', '0');
INSERT INTO `song` VALUES ('166', '27896751', '心灵就是战场', '群星', 'http://p1.music.126.net/94Vr8aIcGruCLJNRd9M2kA==/3287539768680651.jpg', '0');
INSERT INTO `song` VALUES ('167', '28315002', '赛尔号', '曾轶可', 'http://p1.music.126.net/ehxk_yLu2VddDCcUB1Q1rw==/3275445140711465.jpg', '0');
INSERT INTO `song` VALUES ('168', '191037', '这里是神奇的赛尔号', '张杰', 'http://p1.music.126.net/_SBFLcnz1UmTPVgRN7cX1g==/19177681811869896.jpg', '0');
INSERT INTO `song` VALUES ('169', '27901416', '哆啦a梦', '山野さと子', 'http://p1.music.126.net/zjbty-UmbJoaD2IpJcqB6w==/3286440256998930.jpg', '0');
INSERT INTO `song` VALUES ('170', '214389', '多啦A梦(国)', '陈慧琳', 'http://p1.music.126.net/QYbvNqM76nby_7hIucKYOA==/109951162789731.jpg', '132');
INSERT INTO `song` VALUES ('171', '29844877', '诺言', '陈洁丽', 'http://p1.music.126.net/OXmGmFI7keckpS0IhZ0VeA==/3254554419407433.jpg', '0');
INSERT INTO `song` VALUES ('172', '33525665', '超级棒棒糖', '彭雨菲', 'http://p1.music.126.net/9VIOwab-rAcTB9fUzvG2_g==/3424978722057092.jpg', '0');
INSERT INTO `song` VALUES ('173', '27946216', '小英雄大肚腩', '周游格', 'http://p1.music.126.net/Rd8SW2PeNw-yk5asIXS4og==/3254554419407434.jpg', '0');
INSERT INTO `song` VALUES ('174', '34324641', '猪猪侠', '陈洁丽', 'http://p1.music.126.net/pMvI3xx9S3I_rn2MyZiOhQ==/3422779698792591.jpg', '0');
INSERT INTO `song` VALUES ('175', '5242612', '别看我只是一只羊', '古倩敏', 'http://p1.music.126.net/UUKq0RHZubiCooyL8P9-hg==/71468255823122.jpg', '0');
INSERT INTO `song` VALUES ('176', '27906420', '疯狂果宝', '群星', 'http://p1.music.126.net/0rZ4UnP91VwlDeCwYmFBBA==/3415083117097277.jpg', '0');
INSERT INTO `song` VALUES ('177', '27904124', '果宝特攻', '陈洁丽', 'http://p1.music.126.net/Xg6MVe60lGy8nIaP-ikVww==/3408486047337159.jpg', '0');
INSERT INTO `song` VALUES ('178', '394634', '快乐的旅行', '自然卷', 'http://p1.music.126.net/53WLjAdlQI0i7YLZjURTew==/816937139437721.jpg', '128');
INSERT INTO `song` VALUES ('179', '5251825', '快乐星猫', '牛奶咖啡', 'http://p1.music.126.net/NT-MDO5w1h5km9sKPUJfHA==/127543348839982.jpg', '128');
INSERT INTO `song` VALUES ('180', '27890956', '不败的英雄', '唐俊迪-张志林', 'http://p1.music.126.net/zOWqU0f7AB4N955OVbr-EQ==/3273246117440965.jpg', '0');
INSERT INTO `song` VALUES ('181', '405987118', '帝皇再临', '陈致逸', 'http://p1.music.126.net/Q7V5DSGYOqfXjyDw75D5eA==/16623516300875194.jpg', '2');
INSERT INTO `song` VALUES ('182', '5263408', '葫芦金刚', '王迟', 'http://p1.music.126.net/NS1dtePZp2BqQxHIspPq7g==/105553116283734.jpg', '0');
INSERT INTO `song` VALUES ('183', '27946143', '不怕', '赵蓓-赵蕾', 'http://p2.music.126.net/DatodgXnDATj3OghxAKIgQ==/3297435373125153.jpg', '0');
INSERT INTO `song` VALUES ('184', '1435705', 'Friends to the End', 'Henry Mancini', 'http://p2.music.126.net/mtyQElAXI0S0ueo1zlWoqg==/921390744125941.jpg', '0');
INSERT INTO `song` VALUES ('185', '1435700', 'All in How Much We Give', 'Stephanie Mills', 'http://p2.music.126.net/mtyQElAXI0S0ueo1zlWoqg==/921390744125941.jpg', '0');
INSERT INTO `song` VALUES ('186', '35726221', '茶之花', '陈洁丽', 'http://p2.music.126.net/EnQ0J1f_-p8S2OunnRiGhA==/3298534885062503.jpg', '0');
INSERT INTO `song` VALUES ('187', '27901942', '铁甲威虫骑刃王', '群星', 'http://p2.music.126.net/Atrk294Vn5hwoUi3quky8w==/3385396303317257.jpg', '0');
INSERT INTO `song` VALUES ('188', '29822085', '天上掉下个猪八戒主题曲', '群星', 'http://p2.music.126.net/8XBMgGHAJf_9Q-AR7bqrfg==/3415083117097276.jpg', '0');
INSERT INTO `song` VALUES ('189', '28593261', '抬头望望天', '顾海滨', 'http://p2.music.126.net/SaEhGs7wKDYqCPz1ap2SLw==/3286440257121621.jpg', '0');
INSERT INTO `song` VALUES ('190', '4983102', 'ウィニング・ラン!~風になりたい', '山形ユキオ', 'http://p2.music.126.net/jNLppmEgPtUcEIf05GMLsA==/4458519650648571.jpg', '128');
INSERT INTO `song` VALUES ('191', '31835410', '超兽武装', '陈洁丽-刘罡', 'http://p2.music.126.net/X-_qf_rADUkIO1iyyzzDoQ==/18941286811905314.jpg', '0');
INSERT INTO `song` VALUES ('192', '34766647', 'Dash forward - TV Verison', '群星', 'http://p2.music.126.net/WLngCFABwRWbhGKBNOlmYw==/3384296791681732.jpg', '0');
INSERT INTO `song` VALUES ('193', '29562241', '心中想的还是他', '禹丁洁', 'http://p1.music.126.net/B7doFEwibg8UgHDahCW_lg==/6650945837405281.jpg', '0');
INSERT INTO `song` VALUES ('194', '29562240', '人生不过一百年', '袁接伟', 'http://p1.music.126.net/B7doFEwibg8UgHDahCW_lg==/6650945837405281.jpg', '0');
INSERT INTO `song` VALUES ('195', '254322', 'AOAEO出发', '李宇春', 'http://p1.music.126.net/-mFpM4i80yWjKgiLGFwa3Q==/45079976754715.jpg', '0');
INSERT INTO `song` VALUES ('196', '620282', 'めざせポケモンマスター', '松本梨香', 'http://p1.music.126.net/o6dDC5_qd5WwkMWFKp7zTg==/774056185966067.jpg', '132');
INSERT INTO `song` VALUES ('197', '29816860', 'brave heart', '宮崎歩', 'http://p1.music.126.net/OX7OzqN8IFfvUBNIYQkokg==/109951163460407776.jpg', '0');
INSERT INTO `song` VALUES ('198', '4940920', 'Butter-Fly', '和田光司', 'http://p1.music.126.net/o8ZfncjFF5frq8Q8iJJ9QQ==/2321069046256264.jpg', '0');
INSERT INTO `song` VALUES ('199', '847035', '胸がドキドキ', '↑THE HIGH-LOWS↓', 'http://p1.music.126.net/8DkEO4_zr7iyKOZ9O0WRyw==/818036651065627.jpg', '0');
INSERT INTO `song` VALUES ('200', '30051201', '母上樣 、お元気ですか', '藤田淑子', 'http://p1.music.126.net/-NlC7wQu6VuemlilvM1JmQ==/3408486047337160.jpg', '0');
INSERT INTO `song` VALUES ('201', '25845516', '運命のルーレット廻して', 'ZARD', 'http://p1.music.126.net/6zcXX8DH1h95UTxDTd31Vw==/3236962232297359.jpg', '0');
INSERT INTO `song` VALUES ('202', '33187450', '别看我小', '群星', 'http://p1.music.126.net/lFj9dsCs9ucmrZlUQ_NcKQ==/3273246117440964.jpg', '0');
INSERT INTO `song` VALUES ('203', '27901669', '小鲤鱼历险记', '群星', 'http://p1.music.126.net/hnYZET8Eu4WqFYOBFw3tAA==/3385396303343455.jpg', '0');
INSERT INTO `song` VALUES ('204', '32737976', '命运战士', '陈致逸', 'http://p1.music.126.net/WXVEpumSg1_pOMuFz5GoaA==/7932976395024662.jpg', '2');
INSERT INTO `song` VALUES ('205', '27907904', '战国时代', '王强', 'http://p1.music.126.net/58p_w90DDfD1mRVs1rGFmg==/3429376768564697.jpg', '0');
INSERT INTO `song` VALUES ('206', '27901832', '奇迹再现', '毛毛', 'http://p1.music.126.net/-IpUEMFAegATRCavYRyUlA==/3409585558713989.jpg', '0');
INSERT INTO `song` VALUES ('207', '28838247', '你的笑脸', '唐妞', 'http://p1.music.126.net/0Ji5ZEOMOw2rrqYO9dOl-Q==/5916472069498931.jpg', '0');
INSERT INTO `song` VALUES ('208', '27896701', '龙骑伙伴', '群星', 'http://p1.music.126.net/mlvYe2IdowcAkK3oknK0xA==/3429376768554147.jpg', '0');
INSERT INTO `song` VALUES ('209', '4878331', '通天大道宽又阔', '崔京浩-三叶草演唱组', 'http://p1.music.126.net/vmiw_qldWKuPXeKxEyxk2Q==/49478023264173.jpg', '128');
INSERT INTO `song` VALUES ('210', '327152', 'Dream Party', '张靓颖', 'http://p1.music.126.net/XeBcDUI3CkUmfOUzB_RxJA==/109951163239132924.jpg', '132');
INSERT INTO `song` VALUES ('211', '32102400', '夜之童话', '尚雯婕', 'http://p1.music.126.net/nnkt7Br9uDAdBs9crzJ-Dg==/2892815094125042.jpg', '132');
INSERT INTO `song` VALUES ('212', '32102399', '心中的另一个自己', '精灵梦叶罗丽', 'http://p1.music.126.net/nnkt7Br9uDAdBs9crzJ-Dg==/2892815094125042.jpg', '0');
INSERT INTO `song` VALUES ('213', '455762260', '并肩（斗龙战士5片头曲）', '丁钰', 'http://p1.music.126.net/qSV8FioOCt8DxX2RBLJKww==/109951162849220436.jpg', '0');
INSERT INTO `song` VALUES ('214', '443291038', '勇往直前-(动画片《斗龙战士4双龙核》主题曲)（Cover 吴皓卿）', 'CFU_Star龙灵', 'http://p1.music.126.net/CaLniDJoaKMGIuneeYpOWw==/109951163055931713.jpg', '0');
INSERT INTO `song` VALUES ('215', '455960604', '和斗龙一起飞（斗龙战士5片尾曲）', '庄月', 'http://p1.music.126.net/JRr5Y0dGY0iAIOoMQczEiQ==/109951162849757624.jpg', '0');
INSERT INTO `song` VALUES ('216', '432511765', '彩虹天空', '葛上铭、姜为峰、涂圣杰、成奕铭、张智涵', 'http://p1.music.126.net/RZnzfsruOFY9wAf8RILMEw==/17675748928480409.jpg', '0');
INSERT INTO `song` VALUES ('217', '432511763', '勇往直前', '吴皓卿', 'http://p1.music.126.net/_JR2XWHZg8nZGLFnRjsp_w==/17830780067996745.jpg', '0');
INSERT INTO `song` VALUES ('218', '29819850', '巴啦啦小魔仙', '大小ann', 'http://p1.music.126.net/8XBMgGHAJf_9Q-AR7bqrfg==/3415083117097276.jpg', '0');
INSERT INTO `song` VALUES ('219', '27896711', '青春年华', '群星', 'http://p1.music.126.net/mlvYe2IdowcAkK3oknK0xA==/3429376768554147.jpg', '0');
INSERT INTO `song` VALUES ('220', '29583246', 'Catch You Catch Me', '日向めぐみ', 'http://p1.music.126.net/lt5YIxydPPfnIkxoIsh7ZA==/2543170396428208.jpg', '132');
INSERT INTO `song` VALUES ('221', '4991723', '動物園は大変だ', 'TUNE’S', 'http://p1.music.126.net/lR7oyBnF6hvjsDMq-Caukw==/6002233976397436.jpg', '132');
INSERT INTO `song` VALUES ('222', '456063', 'ウィーアー!', 'きただにひろし', 'http://p1.music.126.net/OJa43Xcks97Jr_EUv9giYQ==/2334263185825411.jpg', '128');
INSERT INTO `song` VALUES ('223', '108428', '爱不会绝迹', '林俊杰', 'http://p1.music.126.net/oALpJH1SwQE9eLaYQHLQHw==/109951163071285497.jpg', '128');
INSERT INTO `song` VALUES ('224', '27928321', '心', '郭妮', 'http://p1.music.126.net/XoXBGOrl2gUSOTQoy1qMjQ==/3387595326047016.jpg', '0');
INSERT INTO `song` VALUES ('225', '27927965', '飞翔吧!神圣战机', '马卓', 'http://p2.music.126.net/2rick8-5ZHMTDdrUbHZdaw==/3283141722262588.jpg', '0');
INSERT INTO `song` VALUES ('226', '33737425', '追寻', '群星', 'http://p2.music.126.net/T1hieWGtIXaZYiFO22Z50Q==/3405187512278984.jpg', '0');
INSERT INTO `song` VALUES ('227', '29848624', '神厨小福贵片头曲', '周逸群-周星灿-晏婷', 'http://p2.music.126.net/OXmGmFI7keckpS0IhZ0VeA==/3254554419407433.jpg', '0');
INSERT INTO `song` VALUES ('228', '27946215', '我为厨艺狂', '群星', 'http://p2.music.126.net/Rd8SW2PeNw-yk5asIXS4og==/3254554419407434.jpg', '0');
INSERT INTO `song` VALUES ('229', '27928256', '勇往直前', '侯健', 'http://p2.music.126.net/NELUZvG14CkxWhwyP5PK9w==/3382097768429231.jpg', '0');
INSERT INTO `song` VALUES ('230', '28959135', '飞龙 ', '潘松和', 'http://p2.music.126.net/Jq3oZYisFNar2eSG4XhRjg==/3409585558713986.jpg', '0');
INSERT INTO `song` VALUES ('231', '29378963', '龙凤双娃', '孙昱敏', 'http://p2.music.126.net/XR3Q3bTCYGcApg6hZTk_Sw==/3396391419440566.jpg', '0');
INSERT INTO `song` VALUES ('232', '31645206', '人生如棋', '钟茵波', 'http://p2.music.126.net/r19p9te0c9tDKUwObWoidw==/3398590442421534.jpg', '0');
INSERT INTO `song` VALUES ('233', '28953442', '围棋少年', '姜必群', 'http://p2.music.126.net/Jq3oZYisFNar2eSG4XhRjg==/3409585558713986.jpg', '0');
INSERT INTO `song` VALUES ('234', '543366', 'スキップらんらん', '吉松隆', 'http://p2.music.126.net/hLb6speU31BAx72KR77UIA==/891703930170706.jpg', '0');
INSERT INTO `song` VALUES ('235', '543342', 'アストロボーイ', '吉松隆', 'http://p2.music.126.net/hLb6speU31BAx72KR77UIA==/891703930170706.jpg', '0');
INSERT INTO `song` VALUES ('236', '784532', 'R★O★C★K★S', 'HOUND DOG', 'http://p2.music.126.net/b-4kVRfknm4TPS0t4phVnw==/2337561720713190.jpg', '0');
INSERT INTO `song` VALUES ('237', '363028', '黑', '卡木堂', 'http://p2.music.126.net/dS-VuWf1qtD5JgUTYvEXCA==/52776558145590.jpg', '0');
INSERT INTO `song` VALUES ('238', '285100', '霞光', '曲锦楠', 'http://p2.music.126.net/WZ7EK5_XdPP0bcVjwY3TPg==/49478023250943.jpg', '0');
INSERT INTO `song` VALUES ('239', '562594267', '成全', '林宥嘉', 'http://p1.music.126.net/jI1EcP0FrAVpPlZdGXd5Cw==/109951163304640811.jpg', '4');
INSERT INTO `song` VALUES ('240', '67572', '婚礼的祝福', '陈奕迅', 'http://p1.music.126.net/seq56PUYq_e0IlGIk0VnGQ==/109951163426154573.jpg', '128');
INSERT INTO `song` VALUES ('241', '569213220', '像我这样的人', '毛不易', 'http://p1.music.126.net/vmCcDvD1H04e9gm97xsCqg==/109951163350929740.jpg', '4');
INSERT INTO `song` VALUES ('242', '188451', '当年情(Live)', '张国荣', 'http://p1.music.126.net/FEgl2i8gDkOdppr5Ko3kEA==/69269232562640.jpg', '132');
INSERT INTO `song` VALUES ('243', '156128', '爱太痛', '吴克群', 'http://p1.music.126.net/JDBrrfHYWwGNqfVcmmhcQg==/112150186046503.jpg', '128');
INSERT INTO `song` VALUES ('244', '174122', '面具', '许廷铿', 'http://p1.music.126.net/pHN5xLsBlKIwLRsWrhBiYQ==/96757023256825.jpg', '128');
INSERT INTO `song` VALUES ('245', '400162138', '海阔天空', 'Beyond', 'http://p1.music.126.net/a9oLdcFPhqQyuouJzG2mAQ==/3273246124149810.jpg', '4');
INSERT INTO `song` VALUES ('246', '191232', '遥远的她', '张学友', 'http://p1.music.126.net/rxyLRMZdqzHdxyP5cl8qQA==/43980465112095.jpg', '132');
INSERT INTO `song` VALUES ('247', '25714352', '空白格', '杨宗纬', 'http://p1.music.126.net/s2rrkEZ6S7UVAJI-D1M4lA==/2258396883454110.jpg', '128');
INSERT INTO `song` VALUES ('248', '65538', '好久不见', '陈奕迅', 'http://p1.music.126.net/o_OjL_NZNoeog9fIjBXAyw==/18782957139233959.jpg', '132');
INSERT INTO `song` VALUES ('249', '308518', '领悟', '辛晓琪', 'http://p2.music.126.net/PVwBiURdT1NpPLKnzmNeyQ==/109951163240618616.jpg', '128');
INSERT INTO `song` VALUES ('250', '346576', '光辉岁月', 'Beyond', 'http://p2.music.126.net/JOJvZc_7SqQjKf8TktQ_bw==/29686813951246.jpg', '4');
INSERT INTO `song` VALUES ('251', '5255637', '你怎么舍得我难过', '黄品源', 'http://p2.music.126.net/QoYAmdyE7FL_vc9rwNeS9w==/64871186055842.jpg', '132');
INSERT INTO `song` VALUES ('252', '27867372', '挪威的森林', '伍佰', 'http://p2.music.126.net/6Lod8Ys5E6fiKZ9xrqCXug==/109951163100347037.jpg', '132');
INSERT INTO `song` VALUES ('253', '5274955', '伤心太平洋', '任贤齐', 'http://p2.music.126.net/uq1Pp-gzsNjAx_r_YnQQwA==/109951163364993203.jpg', '128');
INSERT INTO `song` VALUES ('254', '537854958', '小幸运', '田馥甄', 'http://p2.music.126.net/RWIn_QVvCl4GMa8qwCHySA==/109951163424252100.jpg', '4');
INSERT INTO `song` VALUES ('255', '30903117', '漂洋过海来看你', '周深', 'http://p2.music.126.net/nghrV1_ZW6lht9Ue7r4Ffg==/7697680906845029.jpg', '0');
INSERT INTO `song` VALUES ('256', '65800', '最佳损友', '陈奕迅', 'http://p2.music.126.net/7skxWYp7lF70y347YAjaBQ==/109951163256304204.jpg', '132');
INSERT INTO `song` VALUES ('257', '167959', '会痛的石头', '萧敬腾', 'http://p2.music.126.net/M-DJcwtbaym0LMjW8gOwLA==/109951163270250607.jpg', '132');
INSERT INTO `song` VALUES ('258', '118261', '七友', '梁汉文', 'http://p2.music.126.net/Bl_xdJtNTcp4RDdI5huaZA==/6632254138820634.jpg', '128');
INSERT INTO `song` VALUES ('259', '188674', '情书', '张学友', 'http://p2.music.126.net/4EKzVVjcVOwq_QamSKLR5w==/65970697682613.jpg', '132');
INSERT INTO `song` VALUES ('260', '1293886117', '年少有为', '李荣浩', 'http://p2.music.126.net/tt8xwK-ASC2iqXNUXYKoDQ==/109951163606377163.jpg', '132');
INSERT INTO `song` VALUES ('261', '316654', '可惜我是水瓶座', '杨千嬅', 'http://p2.music.126.net/8w4C39C2OY2fRANvkSXo9Q==/109951163270254519.jpg', '132');
INSERT INTO `song` VALUES ('262', '28341142', '洋葱', '茜拉', 'http://p2.music.126.net/uq8Y-O1mSUSqv3zOW4sNCg==/5989039836716828.jpg', '128');
INSERT INTO `song` VALUES ('263', '308353', '钟无艳', '谢安琪', 'http://p2.music.126.net/jKdhcbQIjNTVRVVpc6INQA==/109951163610130313.jpg', '132');
INSERT INTO `song` VALUES ('264', '306575', '舍不得', '弦子', 'http://p2.music.126.net/4flf86o06fShdIiy1siM2Q==/18764265441360767.jpg', '4');
INSERT INTO `song` VALUES ('265', '190241', '曲终人散', '张宇', 'http://p2.music.126.net/QO3SZ8Lp5HQ3RZXslUQ7jA==/6632254138801848.jpg', '128');
INSERT INTO `song` VALUES ('266', '32785700', '一生所爱', '卢冠廷', 'http://p2.music.126.net/_48Jq9ttf6Hf9VwDBxG6TQ==/7934075906675270.jpg', '132');
INSERT INTO `song` VALUES ('267', '376417', '一生有你', '水木年华', 'http://p2.music.126.net/4Tz-EfqUy0mbz6rJFRtrnA==/120946279073830.jpg', '128');
INSERT INTO `song` VALUES ('268', '31877127', '父亲 (Live)', '古巨基', 'http://p2.music.126.net/8v4v7GNnac8ZC4z1BwH3qw==/2901611186844774.jpg', '128');
INSERT INTO `song` VALUES ('269', '437859518', '老男孩', '莫文蔚', 'http://p2.music.126.net/ihr12CUIx7guaZ6L-UMGCA==/18686200114896236.jpg', '128');
INSERT INTO `song` VALUES ('270', '27747328', '十万毫升泪水', '蔡健雅', 'http://p2.music.126.net/1lM0bn_vblFlxw1wB7KvjA==/109951163165832626.jpg', '128');
INSERT INTO `song` VALUES ('271', '191528', '够钟', '周柏豪', 'http://p2.music.126.net/8pHTPZixRTD0lB57OKieIQ==/772956684553748.jpg', '4');
INSERT INTO `song` VALUES ('272', '254309', '分手快乐', '梁静茹', 'http://p2.music.126.net/u544zkCrn-cHlIyoLHLCBg==/109951163240601196.jpg', '0');
INSERT INTO `song` VALUES ('273', '110366', '我不会唱歌', '罗志祥', 'http://p2.music.126.net/AFEhWYNpBTlJT4ZQhwqqZg==/6647647301588559.jpg', '4');
INSERT INTO `song` VALUES ('274', '5252288', '夜夜夜夜', '梁静茹', 'http://p2.music.126.net/nf3Vm1TADSzhD4AJyzZBhA==/109951163376713931.jpg', '0');
INSERT INTO `song` VALUES ('275', '25643291', '需要人陪', '王力宏', 'http://p2.music.126.net/Eoql80OnsZAvZ0UASHo6zQ==/109951163421419702.jpg', '132');
INSERT INTO `song` VALUES ('276', '64328', '男人KTV', '侧田', 'http://p2.music.126.net/vKvaxn4WkVhKfqBXKtPh_Q==/96757023245062.jpg', '128');
INSERT INTO `song` VALUES ('277', '25727803', '修炼爱情', '林俊杰', 'http://p1.music.126.net/D_hiKMwrdQlqD36LoKLO2w==/109951163187408030.jpg', '4');
INSERT INTO `song` VALUES ('278', '224086', '电灯胆', '邓丽欣', 'http://p1.music.126.net/e9Dfbqy_44821CiqdypFww==/6643249255078255.jpg', '132');
INSERT INTO `song` VALUES ('279', '276995', '他不爱我', '莫文蔚', 'http://p1.music.126.net/ZssgfaO-g7uvnI-7EEal9A==/109951163447793114.jpg', '128');
INSERT INTO `song` VALUES ('280', '86279', '情歌王', '古巨基', 'http://p1.music.126.net/pKGF1VAaqAW5ICLlrO5pVw==/6657542906242861.jpg', '4');
INSERT INTO `song` VALUES ('281', '174120', '厌弃', '许廷铿', 'http://p1.music.126.net/pHN5xLsBlKIwLRsWrhBiYQ==/96757023256825.jpg', '128');
INSERT INTO `song` VALUES ('282', '25718007', '你瞒我瞒', '陈柏宇', 'http://p1.music.126.net/LGSZ3rGT8Ux1pYxcwxnR-g==/2225411534621328.jpg', '132');
INSERT INTO `song` VALUES ('283', '191508', '走狗', '周柏豪', 'http://p1.music.126.net/EUBn-L9nHJbiZQd2BbcL6w==/1774611767250165.jpg', '132');
INSERT INTO `song` VALUES ('284', '451473846', '验伤', '卫兰', 'http://p1.music.126.net/6NgaX6VBH1LhHK2e-8BXbA==/17845073719197565.jpg', '4');
INSERT INTO `song` VALUES ('285', '26402069', '上心', '郑欣宜', 'http://p1.music.126.net/0zxZF-V_3To1Z-dZFaj95w==/2464005557900576.jpg', '128');
INSERT INTO `song` VALUES ('286', '298258', '吴哥窟', '吴雨霏', 'http://p1.music.126.net/-U2K8GKlASCSXK0cRre1gA==/109951163188718762.jpg', '132');
INSERT INTO `song` VALUES ('287', '28285910', '岁月神偷', '金玟岐', 'http://p1.music.126.net/54wdQi_3rpjreY2oo2jb7w==/5998935441219557.jpg', '2');
INSERT INTO `song` VALUES ('288', '254645', '全世界分手', '蓝又时', 'http://p1.music.126.net/bkbFqEmf4gXgi_feszB9lQ==/109951163240610882.jpg', '132');
INSERT INTO `song` VALUES ('289', '437290277', '走不出的回忆', '任然', 'http://p2.music.126.net/5CFRzMOQzZ-CTdi9a3BLWA==/18906102439629974.jpg', '130');
INSERT INTO `song` VALUES ('290', '191171', '无赖', '郑中基', 'http://p2.music.126.net/2vFBKWUmF_jiWGaBgO6RaA==/17648261137761966.jpg', '128');
INSERT INTO `song` VALUES ('291', '108393', '心酸', '林宥嘉', 'http://p1.music.126.net/mMZNB-jhYsw29K61QtopJA==/109951163187404137.jpg', '4');
INSERT INTO `song` VALUES ('292', '25650033', '遗憾', '李代沫', 'http://p1.music.126.net/jEoJh6uUBsZCC_zncoPp2w==/938982930173076.jpg', '128');
INSERT INTO `song` VALUES ('293', '424264505', '你，好不好？', '周兴哲', 'http://p1.music.126.net/LQcahhupk87rR6ObxQP90A==/3252355408653836.jpg', '132');
INSERT INTO `song` VALUES ('294', '416892296', '安和桥（Cover 宋冬野）', '宇西', 'http://p1.music.126.net/Nze7lE61wH1bhTSXpVBvGQ==/109951163445284035.jpg', '0');
INSERT INTO `song` VALUES ('295', '569200213', '消愁', '毛不易', 'http://p1.music.126.net/vmCcDvD1H04e9gm97xsCqg==/109951163350929740.jpg', '4');
INSERT INTO `song` VALUES ('296', '28018075', '你就不要想起我', '田馥甄', 'http://p1.music.126.net/aPnwHIJECLpQCoSV-qm_qA==/109951163571315498.jpg', '4');
INSERT INTO `song` VALUES ('297', '29759733', '可乐', '赵紫骅', 'http://p2.music.126.net/qOfVT6izV4mBe4IyQn489Q==/18190320370401891.jpg', '2');
INSERT INTO `song` VALUES ('298', '523251118', '说散就散', '袁娅维', 'http://p2.music.126.net/Yj2g6u9X6UCZPaRLCoJ5mQ==/109951163169027515.jpg', '132');
INSERT INTO `song` VALUES ('299', '4441484', 'Concrete Jungle', 'X-Ray Dog', 'http://p2.music.126.net/Gtj-bkvLJdypVdcVYHluJQ==/1698745464924423.jpg', '128');
INSERT INTO `song` VALUES ('300', '29534958', 'Crime', 'X-Ray Dog', 'http://p2.music.126.net/YvG6IZYkPzGrm_ftJuFoJg==/2529976256618731.jpg', '128');
INSERT INTO `song` VALUES ('301', '857896', 'A Little Story', 'Valentin', 'http://p2.music.126.net/w0Xz0wMOhko2IU0_b-vJ8A==/18561955301992385.jpg', '0');
INSERT INTO `song` VALUES ('302', '458412905', 'Dream Party (伴奏)', '张靓颖', 'http://p1.music.126.net/XeBcDUI3CkUmfOUzB_RxJA==/109951163239132924.jpg', '132');
INSERT INTO `song` VALUES ('303', '26635203', 'Le Banquet', 'Yann Tiersen', 'http://p1.music.126.net/iEbah2l5A8vXnW3sfvaNqA==/5511851790125542.jpg', '128');
INSERT INTO `song` VALUES ('304', '4876066', '五湖烟景·客来', '周志华-江建谊', 'http://p1.music.126.net/8CN0ZeQjlsCLJDWn_RZGUA==/89060441864804.jpg', '128');
INSERT INTO `song` VALUES ('305', '545544485', 'Music with Subliminal Suggestions for Happiness, Wealth and Success-Track 1', 'Rick McFall', 'http://p1.music.126.net/HR6phwKIZK2G2X8jSAExaw==/109951163189954731.jpg', '128');
INSERT INTO `song` VALUES ('306', '4436584', 'Wellspring', 'X-Ray Dog', 'http://p1.music.126.net/L0PY2mH1L-VkMO4JVVWTHw==/602532372067542.jpg', '128');
INSERT INTO `song` VALUES ('307', '4437814', 'Panorama', 'X-Ray Dog', 'http://p1.music.126.net/WUYiek_LWmVgtUN9K5xwvw==/700388906936458.jpg', '128');
INSERT INTO `song` VALUES ('308', '37248655', 'Divine Crusade', 'X-Ray Dog', 'http://p1.music.126.net/_yxvnxzKzO-bB_6cMxUrDw==/3274345632711937.jpg', '128');
INSERT INTO `song` VALUES ('309', '4436812', 'Triumphant (no vox)', 'X-Ray Dog', 'http://p1.music.126.net/9Ck1luGzDt0gL8byomrq-w==/693791837169757.jpg', '128');
INSERT INTO `song` VALUES ('310', '4440529', 'Ultimatum', 'X-Ray Dog', 'http://p1.music.126.net/UtxJ-demygSwrCV_bIvLXg==/615726511600715.jpg', '128');
INSERT INTO `song` VALUES ('311', '4437577', 'Damnation', 'X-Ray Dog', 'http://p1.music.126.net/qc5Tn2F1BEPtJpK84umElw==/1717437162596622.jpg', '128');
INSERT INTO `song` VALUES ('312', '4437811', 'Just Breathe', 'X-Ray Dog', 'http://p1.music.126.net/WUYiek_LWmVgtUN9K5xwvw==/700388906936458.jpg', '128');
INSERT INTO `song` VALUES ('313', '29538314', 'Young Punks', 'X-Ray Dog', 'http://p1.music.126.net/vRM6FaSaJn1Pi7MU1SufBA==/2536573326327767.jpg', '128');
INSERT INTO `song` VALUES ('314', '17625646', 'Requiem For A Tower', 'Escala', 'http://p1.music.126.net/q1uQLDuXD972JAsjVQ1sqw==/18853325881506897.jpg', '132');
INSERT INTO `song` VALUES ('315', '66476', '偏偏喜欢你', '陈百强', 'http://p2.music.126.net/gbeP6upLG0PFp8ecmy0-7w==/109951163240606902.jpg', '132');
INSERT INTO `song` VALUES ('316', '190352', '星星点灯', '郑智化', 'http://p2.music.126.net/5HgfyC4-6rfZZyN7Z8RMqQ==/109951163449879350.jpg', '132');
INSERT INTO `song` VALUES ('317', '186453', '春夏秋冬', '张国荣', 'http://p2.music.126.net/2YIpNoCzXfYgz4zIw3s0Vg==/73667279073787.jpg', '132');
INSERT INTO `song` VALUES ('318', '212233', '千千阙歌', '陈慧娴', 'http://p2.music.126.net/tzmGFZ0-DPOulXS97H5rmA==/18712588395102549.jpg', '4');
INSERT INTO `song` VALUES ('319', '257984', '梦醒时分', '李翊君', 'http://p2.music.126.net/FjI0z1T3es8SAt0MbvZRbA==/64871186054435.jpg', '0');
INSERT INTO `song` VALUES ('320', '253265', '最浪漫的事', '邝美云', 'http://p2.music.126.net/nXpvwNHYGH1sWYiDRMp55w==/40681930239755.jpg', '132');
INSERT INTO `song` VALUES ('321', '110184', '谢谢你的爱', '刘德华', 'http://p2.music.126.net/4smbvcWyk16SfSouao2UAA==/109951163031587156.jpg', '132');
INSERT INTO `song` VALUES ('322', '27867397', '世界第一等', '伍佰', 'http://p1.music.126.net/6Lod8Ys5E6fiKZ9xrqCXug==/109951163100347037.jpg', '4');
INSERT INTO `song` VALUES ('323', '187134', '朋友', '周华健', 'http://p1.music.126.net/tppfAdLe7tTit1V7Tt30dQ==/109951163076136512.jpg', '128');
INSERT INTO `song` VALUES ('324', '188057', '大海', '张雨生', 'http://p1.music.126.net/rTmIXtO0oWpu4RBT2wYTNg==/106652627906340.jpg', '132');
INSERT INTO `song` VALUES ('325', '190381', '水手', '郑智化', 'http://p1.music.126.net/xv-3emr0E933jxuarRCSIg==/109951163449493273.jpg', '132');
INSERT INTO `song` VALUES ('326', '190449', '吻别', '张学友', 'http://p1.music.126.net/636SSPpKW0avAqkK1QgzgQ==/43980465112096.jpg', '4');
INSERT INTO `song` VALUES ('327', '301947', '祈祷', '王韵婵-王杰', 'http://p1.music.126.net/Cxe8i6l2TePK9Fb4rrsC_A==/109951163611525216.jpg', '128');
INSERT INTO `song` VALUES ('328', '186345', '爱如潮水', '张信哲', 'http://p1.music.126.net/D0e4NZrx_0ArL5FhIXpJww==/109951163511560406.jpg', '128');
INSERT INTO `song` VALUES ('329', '194769', '让一切随风', '钟镇涛', 'http://p1.music.126.net/jQtWf7uwMVVUGNnm8T2rjw==/109951163569817262.jpg', '4');
INSERT INTO `song` VALUES ('330', '284245', '走过咖啡屋', '千百惠', 'http://p1.music.126.net/o7O_gp1rdiXriAV46LSJoQ==/19000660439853453.jpg', '128');
INSERT INTO `song` VALUES ('331', '306983', '放你在心里', '许美静', 'http://p1.music.126.net/hodIeqZXs75nuCfBHVhDjw==/129742372091713.jpg', '4');
INSERT INTO `song` VALUES ('332', '152392', '讲不出再见', '谭咏麟', 'http://p1.music.126.net/ow3GKMyAg8hdWDRmhKl4iw==/109951163066633801.jpg', '132');
INSERT INTO `song` VALUES ('333', '5264842', '渡口', '蔡琴', 'http://p1.music.126.net/uAT4CcsZdcAYs-CS0hr-0w==/93458488378219.jpg', '128');
INSERT INTO `song` VALUES ('334', '5272940', '飘摇', '周迅', 'http://p1.music.126.net/P1cBl4Y0holXyd-6HETcmQ==/46179488383709.jpg', '0');
INSERT INTO `song` VALUES ('335', '158939', '安妮', '王杰', 'http://p1.music.126.net/rE9zmPhDR8Kxk_eJMexVug==/18690598162553431.jpg', '128');
INSERT INTO `song` VALUES ('336', '347758', '大地', 'Beyond', 'http://p1.music.126.net/9VII0vWl5hnIq0ZNpL6Rgw==/107752139525259.jpg', '4');
INSERT INTO `song` VALUES ('337', '189907', '花香', '周传雄', 'http://p1.music.126.net/7qj5TKx51l02wgiuXAspFA==/109951163432572665.jpg', '0');
INSERT INTO `song` VALUES ('338', '35621029', '倾诉', '陈百强', 'http://p1.music.126.net/OPZ4X-2ViWphIaONYgGlyg==/3416182647155688.jpg', '132');
INSERT INTO `song` VALUES ('339', '318648', '祝福', '叶蒨文', 'http://p1.music.126.net/2PIxwgheTjkt6BVJa2Uv_A==/109951163067345289.jpg', '128');
INSERT INTO `song` VALUES ('340', '186707', '想你', '张国荣', 'http://p1.music.126.net/UI_5fJZa9AHRfJ1AywjSog==/78065325577772.jpg', '132');
INSERT INTO `song` VALUES ('341', '299116', '约定', '王菲', 'http://p1.music.126.net/gzEPG3dvqn63letU0RTypA==/109951163139329900.jpg', '132');
INSERT INTO `song` VALUES ('342', '29343372', '有心人', '张国荣', 'http://p1.music.126.net/1odRfg3HXWmYw02EMXKRKQ==/116548232557498.jpg', '132');
INSERT INTO `song` VALUES ('343', '346073', '喜欢你', 'Beyond', 'http://p1.music.126.net/ghmbmEQS-IJfZPjdA3KGxg==/82463372084291.jpg', '132');
INSERT INTO `song` VALUES ('344', '82932', '一剪梅', '费玉清', 'http://p1.music.126.net/2xsMmdgsDVZ-s6qKjRC1IQ==/71468255818238.jpg', '128');
INSERT INTO `song` VALUES ('345', '213746', '信天游', '程琳', 'http://p1.music.126.net/uNgUjXKELhu_8voTuw7ZQg==/765260092944930.jpg', '0');
INSERT INTO `song` VALUES ('346', '190778', '用心良苦', '张宇', 'http://p1.music.126.net/4DC3FrDLhoa1BBz7c-_Vug==/109951163076156405.jpg', '128');
INSERT INTO `song` VALUES ('347', '187738', '口是心非', '张雨生', 'http://p1.music.126.net/-2I67AJdS4uGMxipXi7EtQ==/83562883711809.jpg', '128');
INSERT INTO `song` VALUES ('348', '189841', '离开以后', '张学友', 'http://p1.music.126.net/6IC5vQfkor_oPDiAwQQrhQ==/63771674423213.jpg', '4');
INSERT INTO `song` VALUES ('349', '114067', '我不后悔', '林志颖', 'http://p1.music.126.net/DqpsyqBpIjlZmAveZDfPog==/36283883732371.jpg', '128');
INSERT INTO `song` VALUES ('350', '188657', '你最珍贵', '张学友-高慧君', 'http://p2.music.126.net/4EKzVVjcVOwq_QamSKLR5w==/65970697682613.jpg', '4');
INSERT INTO `song` VALUES ('351', '188204', '沉默是金', '张国荣', 'http://p2.music.126.net/cmvsHFnVKXO409hZdrbacA==/102254581395221.jpg', '132');
INSERT INTO `song` VALUES ('352', '135848', '涛声依旧', '毛宁', 'http://p2.music.126.net/LH5ZrinpdjwO2n_bDmp8Zg==/109951163025052159.jpg', '128');
INSERT INTO `song` VALUES ('353', '346075', '真的爱你', 'Beyond', 'http://p2.music.126.net/ghmbmEQS-IJfZPjdA3KGxg==/82463372084291.jpg', '4');
INSERT INTO `song` VALUES ('354', '190270', '饿狼传说', '张学友', 'http://p2.music.126.net/CDrwZuKT_D_m8nwnfBGx8Q==/19146895486205137.jpg', '4');
INSERT INTO `song` VALUES ('355', '115569', '护花使者', '李克勤', 'http://p2.music.126.net/dUF2QZtXNkjdtyHPD_cn5Q==/109951163157531184.jpg', '132');
INSERT INTO `song` VALUES ('356', '212876', '快乐老家', '陈明', 'http://p2.music.126.net/EH0qIsBtYx3jrg-jRSf40g==/59373627917003.jpg', '128');
INSERT INTO `song` VALUES ('357', '237468', '潮湿的心', '甘萍', 'http://p2.music.126.net/crpcty49lknmA096N6hmKQ==/109951163298644092.jpg', '128');
INSERT INTO `song` VALUES ('358', '235971', '昨夜星辰', '高胜美', 'http://p2.music.126.net/QZy6W8BeCcb8vNJCmyZpQQ==/115448720932714.jpg', '0');
INSERT INTO `song` VALUES ('359', '20931480', '情归于尽', '黎明', 'http://p2.music.126.net/95-8sMtOsguZ6LRxAmy7Jw==/14301347742496440.jpg', '4');
INSERT INTO `song` VALUES ('360', '25986095', '大城小爱', '王力宏', 'http://p2.music.126.net/ZD-Mnvr5tBWAJGmhjXv2Fg==/7936274930369278.jpg', '128');
INSERT INTO `song` VALUES ('361', '94639', '相依为命', '陈小春', 'http://p2.music.126.net/T9nGuH3jv0Rq0iWYeOhvAQ==/30786325589804.jpg', '128');
INSERT INTO `song` VALUES ('362', '390345', '你的样子', '林志炫', 'http://p1.music.126.net/EHtTAPbMTLnkHk-3HpEGfQ==/37383395359884.jpg', '128');
INSERT INTO `song` VALUES ('363', '110146', '我恨我痴心', '刘德华', 'http://p1.music.126.net/4smbvcWyk16SfSouao2UAA==/109951163031587156.jpg', '132');
INSERT INTO `song` VALUES ('364', '200436', '我的心太乱', '周传雄', 'http://p1.music.126.net/8SvAKD4lklUgLjTnTD4R9A==/68169720922974.jpg', '0');
INSERT INTO `song` VALUES ('365', '153784', '一生中最爱', '谭咏麟', 'http://p1.music.126.net/EDe8WuEF_RbxugBQJcofXQ==/41781441856503.jpg', '4');
INSERT INTO `song` VALUES ('366', '188071', '一路上有你', '张学友', 'http://p1.music.126.net/gZ9DY4FX0ON0ayACb0jfSg==/18929192184051580.jpg', '132');
INSERT INTO `song` VALUES ('367', '156374', '突然的自我', '伍佰', 'http://p1.music.126.net/SppwwRJuQ2f3Gi6DYTxCAg==/923589767332100.jpg', '128');
INSERT INTO `song` VALUES ('368', '229285', '漫步人生路', '邓丽君', 'http://p1.music.126.net/DU9Jf1twfTW4delkbEP97Q==/18437710486428540.jpg', '132');
INSERT INTO `song` VALUES ('369', '158454', '台北的机场', '温兆伦', 'http://p1.music.126.net/lxTD7qcBA0UNAfvUMbQOoA==/127543348835157.jpg', '0');
INSERT INTO `song` VALUES ('370', '299090', '爱与痛的边缘', '王菲', 'http://p1.music.126.net/gzEPG3dvqn63letU0RTypA==/109951163139329900.jpg', '132');
INSERT INTO `song` VALUES ('371', '242535', '往事只能回味', '韩宝仪', 'http://p1.music.126.net/msrVHFxp8wiHwNnCWKfPMA==/819136162693411.jpg', '0');
INSERT INTO `song` VALUES ('372', '26608741', '甜蜜蜜', '邓丽君', 'http://p1.music.126.net/r4OXsQQn_JIvEKklzQBV_w==/2271591023036753.jpg', '132');
INSERT INTO `song` VALUES ('373', '163635', '爱我就跟我走', '王鹤铮', 'http://p1.music.126.net/BovC3vWRmIg79bo6N-lgvA==/131941395351050.jpg', '128');
INSERT INTO `song` VALUES ('374', '28314062', '我可以抱你吗', '张惠妹', 'http://p1.music.126.net/s2aSwVkdJz7xF7v0qm8kzg==/109951163240608775.jpg', '0');
INSERT INTO `song` VALUES ('375', '186490', '心跳呼吸正常', '张国荣', 'http://p1.music.126.net/2YIpNoCzXfYgz4zIw3s0Vg==/73667279073787.jpg', '132');
INSERT INTO `song` VALUES ('376', '316637', '假如让我说下去', '杨千嬅', 'http://p1.music.126.net/8w4C39C2OY2fRANvkSXo9Q==/109951163270254519.jpg', '4');
INSERT INTO `song` VALUES ('377', '298880', '容易受伤的女人', '王菲', 'http://p1.music.126.net/CMzwlmGKUtCUSmaU0_4cYQ==/19135900370066648.jpg', '132');
INSERT INTO `song` VALUES ('378', '5279696', '我的未来不是梦', '张雨生', 'http://p1.music.126.net/qVUJ9aDeRop5pj3QDixIsQ==/109951163353510177.jpg', '128');
INSERT INTO `song` VALUES ('379', '110207', '蒙娜丽莎的眼泪', '林志炫', 'http://p1.music.126.net/GPUYugR9NPacAxlZGA9krA==/109951163118159711.jpg', '132');
INSERT INTO `song` VALUES ('380', '109734', '凤凰花开的路口', '林志炫', 'http://p1.music.126.net/0iKLtwsIwOMksbNkZUJLzg==/16671894812505379.jpg', '132');
INSERT INTO `song` VALUES ('381', '5253894', '别哭,我最爱的人', '郑智化', 'http://p1.music.126.net/_AI9r84Dx79hnwL7tGiHlA==/124244813956670.jpg', '128');
INSERT INTO `song` VALUES ('382', '90318', '牵挂你的人是我', '高林生', 'http://p1.music.126.net/XN47imWoqFmKD09D_C-E2Q==/115448720929582.jpg', '2');
INSERT INTO `song` VALUES ('383', '85792', '心会跟爱一起走', '郭峰-陈洁仪', 'http://p1.music.126.net/zmNOqw4HET3ogTiVMhifcg==/40681930243414.jpg', '128');
INSERT INTO `song` VALUES ('384', '276129', '一生爱你千百回', '梅艳芳', 'http://p1.music.126.net/277Ag7Ksu94nhJgXaj2A7Q==/109951163066639996.jpg', '0');
INSERT INTO `song` VALUES ('385', '281951', '我曾用心爱着你', '潘美辰', 'http://p1.music.126.net/eceGOpc0kdFWRS25FJdTcA==/109951163076161101.jpg', '0');
INSERT INTO `song` VALUES ('386', '210887', '把悲伤留给自己', '蔡琴', 'http://p1.music.126.net/fhtAyyUeTiZx2FiOPWvq0g==/3324923162479383.jpg', '128');
INSERT INTO `song` VALUES ('387', '307003', '阳光总在风雨后', '许美静', 'http://p1.music.126.net/hodIeqZXs75nuCfBHVhDjw==/129742372091713.jpg', '4');
INSERT INTO `song` VALUES ('388', '228755', '月亮代表我的心', '邓丽君', 'http://p1.music.126.net/MQkTf2GgivL4qUkmZ08O0Q==/67070209310503.jpg', '4');
INSERT INTO `song` VALUES ('389', '284125', '爱你十分泪七分', '裘海正', 'http://p1.music.126.net/lr0A-4btgy3ucX8kZU2_NA==/48378511623169.jpg', '132');
INSERT INTO `song` VALUES ('390', '189987', '只想一生跟你走', '张学友', 'http://p1.music.126.net/DjxxlvRWV_or_pDjoGuf2w==/109951163402041945.jpg', '4');
INSERT INTO `song` VALUES ('391', '150992', '其实你不懂我的心', '童安格', 'http://p1.music.126.net/GC8E5zTQ1fRiYsGqIrSsig==/103354093023030.jpg', '4');
INSERT INTO `song` VALUES ('392', '189396', '一千个伤心的理由', '张学友', 'http://p1.music.126.net/Usn6HdzsooN9USXzVSfXpw==/41781441856579.jpg', '4');
INSERT INTO `song` VALUES ('393', '276734', '没有情人的情人节', '孟庭苇', 'http://p1.music.126.net/e5VuKb-lZhayYqZI31I3ZQ==/109951163449560304.jpg', '4');
INSERT INTO `song` VALUES ('394', '77131', '有多少爱可以重来', '迪克牛仔', 'http://p1.music.126.net/TIQMdKKvWY0dDr-yKBaBeQ==/19000660439853455.jpg', '132');
INSERT INTO `song` VALUES ('395', '276711', '风中有朵雨做的云', '孟庭苇', 'http://p2.music.126.net/T2nfeY6OZRuLbC-DMd7bqw==/97856534884127.jpg', '4');
INSERT INTO `song` VALUES ('396', '176496', '爱我的人和我爱的人', '游鸿明', 'http://p2.music.126.net/0GN5mg4qzxmqGES0H3AdhQ==/98956046505536.jpg', '0');
INSERT INTO `song` VALUES ('397', '276724', '你究竟有几个好妹妹', '孟庭苇', 'http://p2.music.126.net/-HtQ1zetVsFrFYAvszKfeA==/57174604650130.jpg', '132');
INSERT INTO `song` VALUES ('398', '191819', '当你孤单你会想起谁', '张栋梁', 'http://p2.music.126.net/I2bCBoPUkRUf6jf3J8CHlg==/19106213556155071.jpg', '128');
INSERT INTO `song` VALUES ('399', '106368', '想你的三百六十五天', '李玟', 'http://p2.music.126.net/nYHJM8SS3XwNanhQd64png==/45079976755848.jpg', '0');
INSERT INTO `song` VALUES ('400', '156524', '特别的爱给特别的你', '伍思凯', 'http://p2.music.126.net/hWAzPQ9oyr2kWvPOUeBl1w==/109951163201973355.jpg', '128');
INSERT INTO `song` VALUES ('401', '89770', '我是不是该安静的走开', '郭富城', 'http://p2.music.126.net/rDdfolLBxi2j3YXWwAY79g==/124244813951829.jpg', '132');
INSERT INTO `song` VALUES ('402', '330706', '星语心愿', '张柏芝', 'http://p2.music.126.net/zRd1sSA2YIQfQUHR9aLFRQ==/30786325592352.jpg', '4');
INSERT INTO `song` VALUES ('403', '64927', '等', '陈百强', 'http://p2.music.126.net/luoiKIagB63n7Y3bxfsZYQ==/109951163633483361.jpg', '128');
INSERT INTO `song` VALUES ('404', '116869', '敢爱敢做', '林子祥', 'http://p2.music.126.net/6hWtQD6etnGZrmae7fw8tg==/41781441856457.jpg', '4');
INSERT INTO `song` VALUES ('405', '152390', '爱多一次痛多一次', '谭咏麟', 'http://p2.music.126.net/ow3GKMyAg8hdWDRmhKl4iw==/109951163066633801.jpg', '132');
INSERT INTO `song` VALUES ('406', '28892111', '以后别做朋友', '周兴哲', 'http://p2.music.126.net/7Yk7qCLitLNWvdaD4_TXjA==/8950024650123246.jpg', '0');
INSERT INTO `song` VALUES ('407', '157121', '几分伤心几分痴', '王杰', 'http://p2.music.126.net/NzVwlPN_Q8uVbc9S1jlIDA==/118747255812917.jpg', '128');
INSERT INTO `song` VALUES ('408', '114741', '痴心绝对', '李圣杰', 'http://p2.music.126.net/ytX85T9ry_P8FQ2WMExJaw==/109951163106175865.jpg', '128');
INSERT INTO `song` VALUES ('409', '284189', '爱我的人和我爱的人', '裘海正', 'http://p2.music.126.net/3Jw-lBIYeWr7eTqRIAUkxA==/34084860473091.jpg', '132');
INSERT INTO `song` VALUES ('410', '229779', '小城故事', '邓丽君', 'http://p2.music.126.net/QsJSevb6ypAKHeQdJgT8QA==/56075093017500.jpg', '132');
INSERT INTO `song` VALUES ('411', '201485', '千年等一回', '高胜美', 'http://p2.music.126.net/GcT2ymTViHJDXhIL1eWyDw==/90159953494925.jpg', '132');
INSERT INTO `song` VALUES ('412', '65642', '一生何求', '陈百强', 'http://p2.music.126.net/8yBhI4hOfpqrNRdSWlUsVw==/97856534884140.jpg', '132');
INSERT INTO `song` VALUES ('413', '5232855', '祝你一路顺风', '吴奇隆', 'http://p2.music.126.net/aVffotAe1HBVksNkQ7i6AQ==/102254581396471.jpg', '0');
INSERT INTO `song` VALUES ('414', '190495', '雨一直下', '张宇', 'http://p2.music.126.net/otCQ-2wUgLaEN2_W8Nf_DA==/57174604656249.jpg', '132');
INSERT INTO `song` VALUES ('415', '158924', '一场游戏一场梦', '王杰', 'http://p2.music.126.net/rE9zmPhDR8Kxk_eJMexVug==/18690598162553431.jpg', '128');
INSERT INTO `song` VALUES ('416', '25642125', '你不知道的事', '王力宏', 'http://p2.music.126.net/kzdfn8XZnw99wmj_vl4dfg==/109951163200239897.jpg', '0');
INSERT INTO `song` VALUES ('417', '115502', '红日', '李克勤', 'http://p2.music.126.net/ZJvsIcd51VAZx3-YuEAcFQ==/18612532836965764.jpg', '132');
INSERT INTO `song` VALUES ('418', '193535', '友情岁月', '郑伊健', 'http://p1.music.126.net/KUmuNdJyl3-mMbX-7VUBnQ==/18213410114676922.jpg', '128');
INSERT INTO `song` VALUES ('419', '449818741', '光年之外', 'G.E.M.邓紫棋', 'http://p2.music.126.net/fkqFqMaEt0CzxYS-0NpCog==/18587244069235039.jpg', '0');
INSERT INTO `song` VALUES ('420', '30987293', '讲真的', '曾惜', 'http://p2.music.126.net/cd9tDyVMq7zzYFbkr0gZcw==/2885118513459477.jpg', '128');
INSERT INTO `song` VALUES ('421', '1338695683', '起风了', '吴青峰', 'http://p2.music.126.net/aMVPsO00OqlVTS2yMH8RgA==/109951163785600029.jpg', '4');
INSERT INTO `song` VALUES ('422', '29814898', '可惜没如果', '林俊杰', 'http://p2.music.126.net/X0EDfXzxMQJiQ-71JFGdZw==/3238061746556733.jpg', '132');
INSERT INTO `song` VALUES ('423', '557581476', '去年夏天', '王大毛', 'http://p2.music.126.net/5M7Qvv32HaFmMrLN8uehuA==/109951163293243877.jpg', '0');
INSERT INTO `song` VALUES ('424', '1293951677', '昨日青空', '尤长靖', 'http://p2.music.126.net/5BLwaGxULPLXWhhnIzD2CQ==/109951163413015911.jpg', '128');
INSERT INTO `song` VALUES ('425', '417250673', '父亲写的散文诗', '许飞', 'http://p2.music.126.net/klZM86P-K_DHWpOj0gJ3Mg==/3252355400229043.jpg', '0');
INSERT INTO `song` VALUES ('426', '413812448', '大鱼', '周深', 'http://p1.music.126.net/aiPQXP8mdLovQSrKsM3hMQ==/1416170985079958.jpg', '128');
INSERT INTO `song` VALUES ('427', '569214126', '可能否', '木小雅', 'http://p1.music.126.net/SJYnDay7wgewU3O7tPfmOQ==/109951163322541581.jpg', '0');
INSERT INTO `song` VALUES ('428', '504835560', '假装', '陈雪凝', 'http://p1.music.126.net/LLI28TeCfNBo6DK1Ct1k4Q==/109951163249809425.jpg', '0');
INSERT INTO `song` VALUES ('429', '526464293', '空空如也 ', '任然', 'http://p1.music.126.net/84FJjDgb51TmRqixaUpshg==/109951163094476391.jpg', '128');
INSERT INTO `song` VALUES ('430', '571338279', '往后余生', '王贰浪', 'http://p1.music.126.net/hTiVEeQTUSsc-YGF3o6ItQ==/109951163337847600.jpg', '0');
INSERT INTO `song` VALUES ('431', '108478', '醉赤壁', '林俊杰', 'http://p2.music.126.net/s6zFxvXe5kOxub4_x4rZhQ==/109951163052847567.jpg', '0');
INSERT INTO `song` VALUES ('432', '474567580', '远走高飞', '金志文', 'http://p2.music.126.net/elfqBKIdad0KYCCeKQpDSA==/18700493767108166.jpg', '128');
INSERT INTO `song` VALUES ('433', '452986458', '红昭愿', '音阙诗听', 'http://p2.music.126.net/8ltR3o9R8uJ9_5Cc71cDhA==/109951162951242154.jpg', '256');
INSERT INTO `song` VALUES ('434', '480580003', '再也没有', '永彬Ryan.B-AY楊佬叁', 'http://p2.music.126.net/B7MRU9cieODaInnwzyLwYQ==/18771962022944662.jpg', '0');
INSERT INTO `song` VALUES ('435', '482395261', '我们不一样', '大壮', 'http://p2.music.126.net/e8rrwkOED4RbeaKuaVOcJA==/18997361904874206.jpg', '128');
INSERT INTO `song` VALUES ('436', '553755659', '可不可以', '张紫豪', 'http://p2.music.126.net/WafK2OQfEtqXitdDXJ772Q==/109951163252847249.jpg', '0');
INSERT INTO `song` VALUES ('437', '440411424', '缘分一道桥', '王力宏-谭维维', 'http://p2.music.126.net/8MW-Aeleuk_gcvc7T2qZJg==/109951163779532550.jpg', '128');
INSERT INTO `song` VALUES ('438', '460578140', '感谢你曾来过', 'Ayo97-是阿涵阿', 'http://p2.music.126.net/iL36G-e6rm2zwCUmlL4pOw==/109951162859100521.jpg', '2');
INSERT INTO `song` VALUES ('439', '450853439', '遥不可及的你', '花粥', 'http://p2.music.126.net/_d88fVvtP17B-hV7z1lWzg==/109951162835476747.jpg', '0');
INSERT INTO `song` VALUES ('440', '474922552', '我唯一青春里的路人', '陈雪凝', 'http://p2.music.126.net/LLI28TeCfNBo6DK1Ct1k4Q==/109951163249809425.jpg', '0');
INSERT INTO `song` VALUES ('441', '514761281', '白羊', '徐秉龙-沈以诚', 'http://p2.music.126.net/tczb_7II9KzSuLQsVt89Gw==/109951163049336667.jpg', '0');
INSERT INTO `song` VALUES ('442', '436514312', '成都', '赵雷', 'http://p2.music.126.net/34YW1QtKxJ_3YnX9ZzKhzw==/2946691234868155.jpg', '0');
INSERT INTO `song` VALUES ('443', '471403427', '我喜欢上你时的内心活动', '陈绮贞', 'http://p2.music.126.net/AyyxC4stCu-Pm5qa8gaqDQ==/18762066418246617.jpg', '0');
INSERT INTO `song` VALUES ('444', '496869422', '打上花火', 'DAOKO-米津玄師', 'http://p2.music.126.net/ZUCE_1Tl_hkbtamKmSNXEg==/109951163009282836.jpg', '0');
INSERT INTO `song` VALUES ('445', '35476049', '这个年纪', '齐一', 'http://p2.music.126.net/PkmlUOniYE7KWhBIH7gayg==/18427814881575887.jpg', '132');
INSERT INTO `song` VALUES ('446', '536099160', '不染', '毛不易', 'http://p2.music.126.net/gEia-o05FSas8uJos54Sug==/109951163456726954.jpg', '132');
INSERT INTO `song` VALUES ('447', '571074019', '时间飞行', '白宇-朱一龙', 'http://p2.music.126.net/0L3N_IHy_Se107oF5jFDuw==/109951163334334869.jpg', '0');
INSERT INTO `song` VALUES ('448', '442314991', '凉城', '任然', 'http://p2.music.126.net/9RQepityGQUfi5Rbcz7xCQ==/18747772766555079.jpg', '130');
INSERT INTO `song` VALUES ('449', '496370620', '断线', 'Shang-lil sophy', 'http://p1.music.126.net/W-4b64hCb_s8OAGROQXgig==/109951162995598984.jpg', '128');
INSERT INTO `song` VALUES ('450', '421423806', '小半', '陈粒', 'http://p1.music.126.net/HQxTggMCB7AHUXN-ZFEtmA==/1371091013186741.jpg', '256');
INSERT INTO `song` VALUES ('451', '518686034', '戒烟', '李荣浩', 'http://p1.music.126.net/rVkRzdKkIqVxRjDhN4LFHQ==/18342052975051883.jpg', '128');
INSERT INTO `song` VALUES ('452', '489506275', '非酋', '薛明媛-朱贺', 'http://p1.music.126.net/gtPsmgldw_UEsCT2k9eocQ==/19067730649109671.jpg', '2');
INSERT INTO `song` VALUES ('453', '408814900', '借我', '谢春花', 'http://p1.music.126.net/Eg4cy0_HIF2nrX2gMCsWkQ==/17967119509636556.jpg', '130');
INSERT INTO `song` VALUES ('454', '445665094', '过客', '是阿涵阿', 'http://p1.music.126.net/ai-tIcR1c69_tXCoDy8hyA==/18770862510931326.jpg', '128');
INSERT INTO `song` VALUES ('455', '551816010', '我们', '陈奕迅', 'http://p1.music.126.net/Ng7OR-bdgrHQKXzLyj2mGg==/109951163240732641.jpg', '132');
INSERT INTO `song` VALUES ('456', '526464145', '喜欢', '阿肆', 'http://p1.music.126.net/BA0bFrD0cK4YDSYublCThA==/109951163093942268.jpg', '128');
INSERT INTO `song` VALUES ('457', '34923114', '晚安', '丢火车', 'http://p1.music.126.net/Gc73jHSIUHqA0WCp9SZTtw==/7941772490076501.jpg', '2');
INSERT INTO `song` VALUES ('458', '445546453', '浮生', '刘莱斯', 'http://p2.music.126.net/l-Ev4NbIeolk9QoJLtRzTQ==/109951162819579041.jpg', '2');
INSERT INTO `song` VALUES ('459', '33162226', '悟空', '戴荃', 'http://p2.music.126.net/gn4pPKc_Wk3EyByfi86lUQ==/3333719255417035.jpg', '2');
INSERT INTO `song` VALUES ('460', '29567189', '理想', '赵雷', 'http://p2.music.126.net/PJNV84mjt_mDXEkxtjzB4w==/18957779486268444.jpg', '0');
INSERT INTO `song` VALUES ('461', '1294899063', '陷阱', '王北车', 'http://p2.music.126.net/1hyPx7SxIQH8nnsIhcgmfQ==/109951163415300959.jpg', '128');
INSERT INTO `song` VALUES ('462', '483937795', '撒野（Cover：欸-61）', '凯瑟喵', 'http://p2.music.126.net/7bWGHPaWKcN8Kaonhe0I7w==/109951162947439817.jpg', '0');
INSERT INTO `song` VALUES ('463', '31445554', '七月上', 'Jam', 'http://p2.music.126.net/9kZl6NRj3HxmQQ8DqTjZ4Q==/17729624997966923.jpg', '0');
INSERT INTO `song` VALUES ('464', '483671599', '追光者', '岑宁儿', 'http://p2.music.126.net/ZZAQGWl9mR7g5xCyWWH3Pw==/19149094509535913.jpg', '128');
INSERT INTO `song` VALUES ('465', '518725853', '篝火旁', '吕大叶-马子林Broma', 'http://p2.music.126.net/sN5dTpmeJO1DhxIj1ogMLg==/109951163416453597.jpg', '2');
INSERT INTO `song` VALUES ('466', '536502758', '离人愁', '李袁杰', 'http://p2.music.126.net/GwuLAjpfZysAB9U5rC9C9g==/109951163248612704.jpg', '0');
INSERT INTO `song` VALUES ('467', '518781004', '生僻字', '陈柯宇', 'http://p2.music.126.net/fzy5I3GvAjiDfwhIEbgXuw==/109951163062323125.jpg', '0');
INSERT INTO `song` VALUES ('468', '441491828', '水星记', '郭顶', 'http://p2.music.126.net/wSMfGvFzOAYRU_yVIfquAA==/2946691248081599.jpg', '132');
INSERT INTO `song` VALUES ('469', '371362', '小跳蛙', '青蛙', 'http://p2.music.126.net/9xK60ID8ozN56lrjZqpAVQ==/105553116282321.jpg', '0');
INSERT INTO `song` VALUES ('470', '437292675', '我要你', '任素汐', 'http://p1.music.126.net/dDV995SIeG5-IN1eYq6FOg==/3300733912593978.jpg', '0');
INSERT INTO `song` VALUES ('471', '574566207', '盗将行', '花粥-马雨阳', 'http://p1.music.126.net/-qHPT3rhxDlu5zQV9NcQ-A==/109951163555860423.jpg', '0');
INSERT INTO `song` VALUES ('472', '1330348068', '起风了', '买辣椒也用券', 'http://p1.music.126.net/diGAyEmpymX8G7JcnElncQ==/109951163699673355.jpg', '4');
INSERT INTO `song` VALUES ('473', '478303470', '心做し（Cover GUMI）', '双笙', 'http://p1.music.126.net/uwF73BxhvWiR-Kxn0wGe0g==/109951162927951204.jpg', '0');
INSERT INTO `song` VALUES ('474', '29850531', '不找了', '郭旭', 'http://p1.music.126.net/o25ptaSygDb2rVdTpIKexw==/17793396672429120.jpg', '130');
INSERT INTO `song` VALUES ('475', '175072', '不再联系', '夏天Alex', 'http://p1.music.126.net/1IyS4hDwsxgzIObfQU5__g==/71468255818380.jpg', '128');
INSERT INTO `song` VALUES ('476', '411214279', '雅俗共赏', '许嵩', 'http://p1.music.126.net/Wcs2dbukFx3TUWkRuxVCpw==/3431575794705764.jpg', '128');
INSERT INTO `song` VALUES ('477', '412902950', '最佳歌手', '许嵩', 'http://p1.music.126.net/Wcs2dbukFx3TUWkRuxVCpw==/3431575794705764.jpg', '128');
INSERT INTO `song` VALUES ('478', '569213279', '大千世界', '许嵩', 'http://p1.music.126.net/BUFZLieG5a6E3ZVpkHP6fA==/109951163402069754.jpg', '128');
INSERT INTO `song` VALUES ('479', '1305366556', '寒鸦少年', '华晨宇', 'http://p1.music.126.net/qRQTS_TroZo9SLV5yqpT5A==/109951163520638522.jpg', '4');
INSERT INTO `song` VALUES ('480', '513360721', '云烟成雨', '房东的猫', 'http://p1.music.126.net/DSTg1dR7yKsyGq4IK3NL8A==/109951163046050093.jpg', '2');
INSERT INTO `song` VALUES ('481', '486814412', '沙漠骆驼', '展展与罗罗', 'http://p1.music.126.net/oov7j64hTKZSm0CEUkRNoQ==/109951163111639178.jpg', '0');
INSERT INTO `song` VALUES ('482', '26524510', '我好想你', '苏打绿', 'http://p1.music.126.net/t3yhufmRdlQZPfkLlxlgOA==/109951163240602374.jpg', '132');
INSERT INTO `song` VALUES ('483', '31445772', '理想三旬', '陈鸿宇', 'http://p1.music.126.net/cqTTEPAaxXG3cOwaE4E_-g==/109951163104103366.jpg', '2');
INSERT INTO `song` VALUES ('484', '468513829', '说散就散', 'JC陈泳彤', 'http://p1.music.126.net/LSBrAS5oxxQHouvqLDR4lA==/19095218439644352.jpg', '4');
INSERT INTO `song` VALUES ('485', '202373', '南方姑娘', '赵雷', 'http://p1.music.126.net/wldFtES1Cjnbqr5bjlqQbg==/18876415625841069.jpg', '0');
INSERT INTO `song` VALUES ('486', '28815250', '平凡之路', '朴树', 'http://p1.music.126.net/W_5XiCv3rGS1-J7EXpHSCQ==/18885211718782327.jpg', '128');
INSERT INTO `song` VALUES ('487', '38576323', '春风十里', '鹿先森乐队', 'http://p1.music.126.net/hYjA4Th6CAdkWI_sm32juw==/109951163669459549.jpg', '128');
INSERT INTO `song` VALUES ('488', '557584888', '往后余生', '马良', 'http://p1.music.126.net/VY-LfiQZZNjtDBHGmEu85A==/109951163300149472.jpg', '0');
INSERT INTO `song` VALUES ('489', '417833348', '超越无限', '林俊杰', 'http://p1.music.126.net/CpfqDSpDkPz1XLEqiQZycg==/1398578802654645.jpg', '4');
INSERT INTO `song` VALUES ('490', '28892408', '我的天空', '南征北战NZBZ', 'http://p1.music.126.net/UeTuwE7pvjBpypWLudqukA==/3132508627578625.jpg', '128');
INSERT INTO `song` VALUES ('491', '516076896', '纸短情长（完整版）', '烟把儿', 'http://p1.music.126.net/tbZaE-DjL_BkemynFlL1cQ==/109951163052534918.jpg', '0');
INSERT INTO `song` VALUES ('492', '1321382642', 'Hard Road', '黄明昊 (Justin)', 'http://p1.music.126.net/EIDBC9QB31Gcqor9jXEcwg==/109951163641410508.jpg', '0');
INSERT INTO `song` VALUES ('493', '521415426', '蝴蝶的时间', '许嵩', 'http://p1.music.126.net/PlFNeWv_Fg9Ix0cyOgNGSg==/109951163073208728.jpg', '0');
INSERT INTO `song` VALUES ('494', '531295576', '最美的期待', '周笔畅', 'http://p1.music.126.net/mwCUI0iL3xEC2a4WVICHlA==/109951163115369030.jpg', '0');
INSERT INTO `song` VALUES ('495', '355992', '追梦赤子心', 'GALA', 'http://p1.music.126.net/XDncptlBJ4_LN3hLBx-8aw==/19061133579343591.jpg', '128');
INSERT INTO `song` VALUES ('496', '25788001', '其实都没有', '杨宗纬', 'http://p1.music.126.net/DxQeZM26qjkQsyZulBdw6A==/109951163314294843.jpg', '4');
INSERT INTO `song` VALUES ('497', '208902', '红色高跟鞋', '蔡健雅', 'http://p1.music.126.net/2toWuH2oD6c0dM6QLdThzg==/109951163165824418.jpg', '128');
INSERT INTO `song` VALUES ('498', '468176711', '城南花已开', '三亩地', 'http://p1.music.126.net/i-7ktILRPImJ0NwiH8DABg==/109951162885959979.jpg', '2');
INSERT INTO `song` VALUES ('499', '30431376', '易燃易爆炸', '陈粒', 'http://p2.music.126.net/VuJFMbXzpAProbJPoXLv7g==/7721870161993398.jpg', '256');
INSERT INTO `song` VALUES ('500', '553310243', '后来的我们', '五月天', 'http://p2.music.126.net/s6bXQX0M-H9EoeqGfr4wrg==/109951163250238942.jpg', '0');
INSERT INTO `song` VALUES ('501', '514055051', '跳舞的梵谷', '孙燕姿', 'http://p2.music.126.net/_VjuIgInJqwxdyoy4FF3IA==/18357446138140955.jpg', '128');
INSERT INTO `song` VALUES ('502', '465920905', '全部都是你', 'DP龙猪-CNBALLER-CLOUD WANG', 'http://p2.music.126.net/H4VucaH8T_vEtHcPEtNeAg==/19146895486122470.jpg', '0');
INSERT INTO `song` VALUES ('503', '439915614', '刚好遇见你', '李玉刚', 'http://p2.music.126.net/lDyytkTaPYVTb1Vpide6AA==/18591642115187138.jpg', '128');
INSERT INTO `song` VALUES ('504', '1296645941', '皇帝的新衣 (Skr)', 'AR（刘夫阳）', 'http://p2.music.126.net/TxwwIjyZxV7XbukRcDoRJA==/109951163426881993.jpg', '0');
INSERT INTO `song` VALUES ('505', '29004400', '烟火里的尘埃', '华晨宇', 'http://p2.music.126.net/_49Xz_x9kTTdEgmYYk6w2w==/6672936069046297.jpg', '4');
INSERT INTO `song` VALUES ('506', '431357712', '你在终点等我', '王菲', 'http://p2.music.126.net/ddhcDeGSl9VhXJLfOsNDEA==/3433774824740403.jpg', '128');
INSERT INTO `song` VALUES ('507', '529668356', '你要的全拿走', '胡彦斌', 'http://p2.music.126.net/9uUWLnRsv4c0F0wu9dlttA==/109951163118372627.jpg', '128');
INSERT INTO `song` VALUES ('508', '392605', '祝你生日快乐', '云雀合唱团', 'http://p2.music.126.net/pWb12X9wqFw2rvKyFFJrCA==/36283883730804.jpg', '0');
INSERT INTO `song` VALUES ('509', '25706282', '夜空中最亮的星', '逃跑计划', 'http://p1.music.126.net/d541jx7SqoDzVkenhmtg6g==/19193074974743620.jpg', '0');
INSERT INTO `song` VALUES ('510', '432509483', '全世界谁倾听你 ', '林宥嘉', 'http://p1.music.126.net/zGgUaGvXapKMy5tfQIB7cw==/109951163167743834.jpg', '128');
INSERT INTO `song` VALUES ('511', '25867002', '关于郑州的记忆', '李志', 'http://p1.music.126.net/80diFjTazGCdf0Ql3HAqGA==/2296879790481625.jpg', '130');
INSERT INTO `song` VALUES ('512', '5240550', '北京东路的日子', '刘千楚-徐逸昊-鲁天舒-姜玮珉-胡梦原-张鎏依-梁竞元-游彧涵-金书援-许一璇-汪源-张夙西', 'http://p1.music.126.net/nioPMqyc0opzEavs67vdYw==/19128203788658830.jpg', '0');
INSERT INTO `song` VALUES ('513', '547976490', '爱了很久的朋友', '田馥甄', 'http://p1.music.126.net/tegGg2OyD9OdsXyHG-IRfQ==/109951163213124268.jpg', '4');
INSERT INTO `song` VALUES ('514', '405597568', '山外小楼夜听雨', '任然', 'http://p1.music.126.net/L8SZ53Nf5le4JDvG6qVB6g==/1424967072083597.jpg', '130');
INSERT INTO `song` VALUES ('515', '1332718235', '不开心就要消你呀', '牛奶咖啡-kiki富妍-Yunomi', 'http://p1.music.126.net/YOT5pbZ76nM6w66XoK1j-g==/109951163725313296.jpg', '4');
INSERT INTO `song` VALUES ('516', '513791211', '广东十年爱情故事', '广东雨神', 'http://p1.music.126.net/SWDOrvO3f6L8Q1xGPTbb6w==/109951163102543599.jpg', '128');
INSERT INTO `song` VALUES ('517', '486218073', 'BINGBIAN病变（prod.jurrivh）', 'Cubi-Aydo$-BRGang', 'http://p1.music.126.net/FcW4qPSjTLRJORMWNHeElA==/109951162955696086.jpg', '2');
INSERT INTO `song` VALUES ('518', '479598964', '椿', '沈以诚', 'http://p1.music.126.net/CpwIPy2YUWC6ksF88eGNyw==/109951162931819035.jpg', '0');
INSERT INTO `song` VALUES ('519', '418602088', 'Nevada (feat. Cozi Zuehlsdorff)', 'Vicetone-Cozi Zuehlsdorff', 'http://p1.music.126.net/X_Ukd1BhXdDwsz4NqrisNA==/109951163640412456.jpg', '128');
INSERT INTO `song` VALUES ('520', '406475394', 'Wonderful U (Demo Version)', 'AGA', 'http://p1.music.126.net/UIE3T_txKzd6e8PORxmpCQ==/109951163412959613.jpg', '132');
INSERT INTO `song` VALUES ('521', '501133611', 'Look What You Made Me Do', 'Taylor Swift', 'http://p1.music.126.net/fdh0myRe6FD87QNJtvGe_A==/109951163054654501.jpg', '128');
INSERT INTO `song` VALUES ('522', '2740360', 'The Hampster Dance Song', 'Hampton the Hampster', 'http://p1.music.126.net/E8HdKVEirTbxd0KpUWRXrw==/1739427395146797.jpg', '0');
INSERT INTO `song` VALUES ('523', '461347998', 'Something Just Like This', 'The Chainsmokers-Coldplay', 'http://p1.music.126.net/ggnyubDdMxrhpqYvpZbhEQ==/3302932937412681.jpg', '132');
INSERT INTO `song` VALUES ('524', '139774', 'The truth that you leave', 'Pianoboy高至豪', 'http://p1.music.126.net/9idkdzbel_-lYBP7Dv_dVQ==/102254581395289.jpg', '2');
INSERT INTO `song` VALUES ('525', '29750825', 'Es rappelt im Karton', 'Pixie Paris', 'http://p1.music.126.net/0iZ3SxgLvKah7MhPYNJHpw==/6633353651501334.jpg', '4');
INSERT INTO `song` VALUES ('526', '443875380', '生きていたんだよな', 'あいみょん', 'http://p1.music.126.net/QvGlOYCfXWx94a19_lmh5A==/3315027565433501.jpg', '128');
INSERT INTO `song` VALUES ('527', '440353010', '#Lov3 #Ngẫu Hứng', 'Hoaprox', 'http://p1.music.126.net/znZQMUXniXqwjJrXMJO_Qg==/109951163100026676.jpg', '132');
INSERT INTO `song` VALUES ('528', '27759600', 'Five Hundred Miles', 'Justin Timberlake-Carey Mulligan-Stark Sands', 'http://p1.music.126.net/4BTe96FPQ_kW1pmNnlNvHg==/2536573326765583.jpg', '132');
INSERT INTO `song` VALUES ('529', '29787426', 'Freaks (Radio Edit)', 'Timmy Trumpet-Savage', 'http://p2.music.126.net/eB_-llmEgPAyXPjLaCS7Fg==/109951163197847943.jpg', '4');
INSERT INTO `song` VALUES ('530', '506196018', 'Legends Never Die', 'Against the Current', 'http://p2.music.126.net/raAqjrUB_OMiVbbPkrGtXg==/109951162926087188.jpg', '0');
INSERT INTO `song` VALUES ('531', '1310906383', 'Head Above Water', 'Avril Lavigne', 'http://p2.music.126.net/S1pHCS9mf8JEmzyiia0cag==/109951163561900810.jpg', '128');
INSERT INTO `song` VALUES ('532', '472361096', 'Despacito (Remix)', 'Luis Fonsi-Daddy Yankee-Justin Bieber', 'http://p2.music.126.net/vA4UF75gS1Qpyx07B0acrw==/18521273371761277.jpg', '132');
INSERT INTO `song` VALUES ('533', '38592976', 'Dream It Possible', 'Delacey', 'http://p2.music.126.net/Gfq_eVuq7lgilBf0w1g5dg==/109951163088676710.jpg', '0');
INSERT INTO `song` VALUES ('534', '31356499', 'Waiting For Love', 'Avicii-Martin Garrix-Simon Aldred', 'http://p2.music.126.net/oaRoXPxV3EzchLOLQ6a5uQ==/2932397511504193.jpg', '4');
INSERT INTO `song` VALUES ('535', '4017240', 'Intro: The Dawn', 'Dreamtale', 'http://p2.music.126.net/N9KUUZHsDXrrLKQz5d--dw==/6639950720964639.jpg', '132');
INSERT INTO `song` VALUES ('536', '3935139', 'Breath and Life', 'Audio Machine', 'http://p2.music.126.net/cgJkMUiT6IVfnrETh_aKGg==/1709740581199087.jpg', '128');
INSERT INTO `song` VALUES ('537', '26060065', 'Counting Stars', 'OneRepublic', 'http://p2.music.126.net/b2nl6jsVbqj23IV8dVvJcg==/7766950139663735.jpg', '132');
INSERT INTO `song` VALUES ('538', '30953009', 'See You Again', 'Wiz Khalifa-Charlie Puth', 'http://p2.music.126.net/JIc9X91OSH-7fUZqVfQXAQ==/7731765766799133.jpg', '128');
INSERT INTO `song` VALUES ('539', '33035611', 'Time (Official)', 'MKJ', 'http://p2.music.126.net/ClQyajrD09sGC8Or13I3FA==/109951163649593576.jpg', '1024');
INSERT INTO `song` VALUES ('540', '480426313', 'There For You', 'Martin Garrix-Troye Sivan', 'http://p2.music.126.net/E_ffmvXrVZoTugVf_Zf4Cg==/18520173860179248.jpg', '4');
INSERT INTO `song` VALUES ('541', '26092806', 'Take my hand', 'DAISHI DANCE-Cecile Corbel', 'http://p2.music.126.net/AoVFMKkLVMOmTMo_A6x02g==/109951163403515653.jpg', '0');
INSERT INTO `song` VALUES ('542', '406238', 'Flower Dance', 'DJ Okawari', 'http://p2.music.126.net/P1ac-TWkFzjDqcvl5_oK7Q==/881808325476577.jpg', '128');
INSERT INTO `song` VALUES ('543', '451703096', 'Shape of You', 'Ed Sheeran', 'http://p2.music.126.net/5Zs51JS6cQzvQclW5u_J1g==/18832435162240436.jpg', '4');
INSERT INTO `song` VALUES ('544', '29722263', 'Uptown Funk', 'Mark Ronson-Bruno Mars', 'http://p2.music.126.net/SsPvUEo8WSIwAiBuWEGFXg==/18448705602716641.jpg', '0');
INSERT INTO `song` VALUES ('545', '19542337', 'Hall of Fame', 'The Script-will.i.am', 'http://p1.music.126.net/s4CT1dVikwYFxtxOvrp4GA==/6638851209069793.jpg', '0');
INSERT INTO `song` VALUES ('546', '26199445', 'The Phoenix', 'Fall Out Boy', 'http://p1.music.126.net/N07DLBEqprGMTZH21VC0vw==/19129303300296000.jpg', '132');
INSERT INTO `song` VALUES ('547', '553813030', 'Dawn of us', '王嘉尔', 'http://p1.music.126.net/36Jn70oJcxhTpiWunyyg8w==/109951163255300834.jpg', '128');
INSERT INTO `song` VALUES ('548', '28263911', 'Five Hours', 'Deorro', 'http://p1.music.126.net/GsnBQJa5pmw3nBJrOoQKVw==/18857723928100389.jpg', '132');
INSERT INTO `song` VALUES ('549', '407839677', 'HandClap', 'Fitz & the Tantrums', 'http://p1.music.126.net/02p9J45HTVD_nkOHpP8WcQ==/109951163203375290.jpg', '4');
INSERT INTO `song` VALUES ('550', '2866921', 'Schnappi', 'Joy Gruttmann', 'http://p1.music.126.net/oO9XCny2OCD0WCoBezra9g==/2369447557909302.jpg', '0');
INSERT INTO `song` VALUES ('551', '2919622', 'I Am You', 'Kim Taylor', 'http://p1.music.126.net/cCw5Kr5C52bYbV-AOp6IUA==/109951163073357482.jpg', '132');
INSERT INTO `song` VALUES ('552', '29717271', 'Go Time', 'Mark Petrie', 'http://p1.music.126.net/TJe468hZr_0ndQRfTAKdqA==/3233663697760186.jpg', '0');
INSERT INTO `song` VALUES ('553', '812400', 'PLANET', 'ラムジ', 'http://p1.music.126.net/cCyPSxi-BE2h-SmpLBztbA==/18635622580993683.jpg', '1');
INSERT INTO `song` VALUES ('554', '440208476', 'That Girl', 'Olly Murs', 'http://p1.music.126.net/_dPhSlbDz23MjXUEYeBGRw==/18820340533734696.jpg', '4');
INSERT INTO `song` VALUES ('555', '34229976', 'Panama', 'Matteo', 'http://p1.music.126.net/8dEEj_V5UxD2VW3tXxIp4w==/109951163676757259.jpg', '128');
INSERT INTO `song` VALUES ('556', '36308916', 'Monody', 'TheFatRat-Laura Brehm', 'http://p1.music.126.net/qcO4OtbG5c3wy4YjbLYhvw==/3398590443354806.jpg', '128');
INSERT INTO `song` VALUES ('557', '5308028', 'My Soul', 'July', 'http://p1.music.126.net/NFl1s5Hl3E37dCaFIDHfNw==/727876697598920.jpg', '261');
INSERT INTO `song` VALUES ('558', '41500546', 'China-X', '徐梦圆', 'http://p1.music.126.net/hH4UmteuzsqZHacrr3YS_g==/18358545649308968.jpg', '2');
INSERT INTO `song` VALUES ('559', '499274178', 'Friends', 'Justin Bieber-BloodPop', 'http://p1.music.126.net/LVmBVwRmzKJ92ssNZyZEWQ==/18811544441628957.jpg', '4');
INSERT INTO `song` VALUES ('560', '38019092', 'Lifeline', 'Zeraphym', 'http://p1.music.126.net/jxI9-BtlKasm_5NzwNGdwA==/3408486049423414.jpg', '128');
INSERT INTO `song` VALUES ('561', '536622304', 'Lemon', '米津玄師', 'http://p1.music.126.net/6IeZ9MiSSDXifj74nzH6ww==/109951163561494000.jpg', '132');
INSERT INTO `song` VALUES ('562', '31654455', 'Victory', 'Two Steps From Hell', 'http://p1.music.126.net/nJROWeZiEp1TUv27amRguQ==/18195817928618786.jpg', '128');
INSERT INTO `song` VALUES ('563', '36990266', 'Faded', 'Alan Walker-Iselin Solheim', 'http://p1.music.126.net/8dzD62VK8jLDbhEqkmpIAg==/18277181788626198.jpg', '132');
INSERT INTO `song` VALUES ('564', '4153366', 'Numb', 'Linkin Park', 'http://p2.music.126.net/FVJgTDHNi9EhAjUNTGJ0kA==/18890709276852111.jpg', '128');
INSERT INTO `song` VALUES ('565', '438801442', 'JULY', '吴亦凡', 'http://p2.music.126.net/EbtEQchXFKPOc1dQbxM6ig==/18550960184779345.jpg', '128');
INSERT INTO `song` VALUES ('566', '29947420', 'Fade', 'Alan Walker', 'http://p2.music.126.net/6Skxbgl8cfIjFGV-MzGi0Q==/109951163787691327.jpg', '260');
INSERT INTO `song` VALUES ('567', '33211676', 'Hello', 'OMFG', 'http://p2.music.126.net/8QKweqIW-FDcpCdelLVAdw==/7963762721216450.jpg', '0');
INSERT INTO `song` VALUES ('568', '30394891', 'Seve', 'Tez Cadey', 'http://p2.music.126.net/bv58miRmMR0JL4lHy5rTTg==/7853811557348624.jpg', '132');
INSERT INTO `song` VALUES ('569', '1313107065', 'RISE', 'The Glitch Mob-Mako-The Word Alive', 'http://p2.music.126.net/XLulJwVbfowNQhATCt809g==/109951163573081067.jpg', '0');
INSERT INTO `song` VALUES ('570', '529823971', 'Ei Ei', '偶像练习生', 'http://p2.music.126.net/iutMqAr58qq8HYKPCrv9sg==/109951163110826700.jpg', '128');
INSERT INTO `song` VALUES ('571', '4341314', 'Intro', 'The xx', 'http://p2.music.126.net/Xik6a3wXoGPOLI1GNXGdFQ==/825733232504415.jpg', '128');
INSERT INTO `song` VALUES ('572', '3932159', 'You', 'Approaching Nirvana', 'http://p2.music.126.net/4d8hnmrMxDrKnn_0i1JqyA==/1728432278871211.jpg', '0');
INSERT INTO `song` VALUES ('573', '515803379', '别', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '128');
INSERT INTO `song` VALUES ('574', '1334647784', '天份', '薛之谦', 'http://p2.music.126.net/TOkRGd59o3hAOKsnMMmMMA==/109951163755246383.jpg', '0');
INSERT INTO `song` VALUES ('575', '32192436', '绅士', '薛之谦', 'http://p2.music.126.net/qpvBqYIqkRhO9Ry2qOCdJQ==/2942293117852634.jpg', '128');
INSERT INTO `song` VALUES ('576', '1294910785', '最好', '薛之谦', 'http://p2.music.126.net/TOkRGd59o3hAOKsnMMmMMA==/109951163755246383.jpg', '0');
INSERT INTO `song` VALUES ('577', '466122271', '高尚', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '128');
INSERT INTO `song` VALUES ('578', '557583281', '哑巴', '薛之谦', 'http://p2.music.126.net/TOkRGd59o3hAOKsnMMmMMA==/109951163755246383.jpg', '0');
INSERT INTO `song` VALUES ('579', '471385043', '暧昧', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '0');
INSERT INTO `song` VALUES ('580', '32507038', '演员', '薛之谦', 'http://p2.music.126.net/qpvBqYIqkRhO9Ry2qOCdJQ==/2942293117852634.jpg', '128');
INSERT INTO `song` VALUES ('581', '415792881', '刚刚好', '薛之谦', 'http://p2.music.126.net/hti_a0LADoFMBHvOBwAtRA==/1369991500930171.jpg', '128');
INSERT INTO `song` VALUES ('582', '474567044', '我害怕', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '128');
INSERT INTO `song` VALUES ('583', '412902689', '初学者', '薛之谦', 'http://p2.music.126.net/hti_a0LADoFMBHvOBwAtRA==/1369991500930171.jpg', '128');
INSERT INTO `song` VALUES ('584', '468517654', '动物世界', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '128');
INSERT INTO `song` VALUES ('585', '516657051', '像风一样', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '128');
INSERT INTO `song` VALUES ('586', '557581967', '肆无忌惮', '薛之谦', 'http://p2.music.126.net/TOkRGd59o3hAOKsnMMmMMA==/109951163755246383.jpg', '0');
INSERT INTO `song` VALUES ('587', '553543014', '摩天大楼', '薛之谦', 'http://p2.music.126.net/TOkRGd59o3hAOKsnMMmMMA==/109951163755246383.jpg', '0');
INSERT INTO `song` VALUES ('588', '443277013', '火星人来过', '薛之谦', 'http://p2.music.126.net/fNbj5uDwltSDLbETdnEYYQ==/109951163069265719.jpg', '128');
INSERT INTO `song` VALUES ('589', '417859631', '我好像在哪见过你', '薛之谦', 'http://p2.music.126.net/hti_a0LADoFMBHvOBwAtRA==/1369991500930171.jpg', '128');
INSERT INTO `song` VALUES ('590', '571340283', '那是你离开了北京的生活', '薛之谦', 'http://p2.music.126.net/TOkRGd59o3hAOKsnMMmMMA==/109951163755246383.jpg', '0');
INSERT INTO `song` VALUES ('591', '26830207', '僕が死のうと思ったのは', '中島美嘉', 'http://p2.music.126.net/c3J4oI2wNSuBg3r2x9LwLg==/5505254720366452.jpg', '128');
INSERT INTO `song` VALUES ('592', '461083054', '还不是因为你长得不好看（Cover：July）', '满汉全席', 'http://p2.music.126.net/HJ8qYeUjbzg4ptx9TdIP4Q==/109951162863614721.jpg', '0');
INSERT INTO `song` VALUES ('593', '33911781', 'secret base ~君がくれたもの~ (10 years after Ver.)', '茅野愛衣-戸松遥-早見沙織', 'http://p2.music.126.net/daZcHVIJicL3wXJWMIjAng==/7926379325753633.jpg', '0');
INSERT INTO `song` VALUES ('594', '471284744', '僕が死のうと思ったのは/曾经我也想过一了百了（Cover 中岛美嘉）', '芝麻Mochi', 'http://p2.music.126.net/I0IfRCaR894dOC5wvHgCYA==/109951162871826975.jpg', '0');
INSERT INTO `song` VALUES ('595', '523863496', '云村的告别', '邱有句-编曲馒头MIDIbear', 'http://p2.music.126.net/UKAcaFmlW2GyGQu5z70fqw==/109951163082484910.jpg', '2');
INSERT INTO `song` VALUES ('596', '541432715', '云村的重逢/致爱梵高，自由旋转的向日葵', '邱有句', 'http://p2.music.126.net/40O4dcMTih5HGz7UdhZfrA==/109951163164499376.jpg', '2');
INSERT INTO `song` VALUES ('597', '522202385', '繁华的风景', 'Candy_Wind', 'http://p2.music.126.net/oZvpxMSngslrwobDaLffGw==/109951163075628700.jpg', '0');
INSERT INTO `song` VALUES ('598', '38018122', 'Please Come Back', 'Zeraphym', 'http://p2.music.126.net/tJTpAKlzWiJIPxPr-IW1Rg==/3294136842701414.jpg', '0');
INSERT INTO `song` VALUES ('599', '490687121', '夏に花が散る', '羽肿', 'http://p2.music.126.net/sTAnmzTuh0ulGgG5ZltyKQ==/109951162975022170.jpg', '2');
INSERT INTO `song` VALUES ('600', '454638104', 'Inside The Lines（Newton-/DcAlvis Remix）', 'Newton--DcAlvis', 'http://p2.music.126.net/VlwgxVMJ13SUV4UfcJojhQ==/109951162936136937.jpg', '2');
INSERT INTO `song` VALUES ('601', '5086081', 'River Flows In You (Original Mix)', 'Mark Pride', 'http://p2.music.126.net/VEVDZhxhSzJyLwZ-R0lvFQ==/1761417627708961.jpg', '0');
INSERT INTO `song` VALUES ('602', '27644359', 'Remember (Original Mix)', 'Sensitive-Bogdan Bondarenko', 'http://p2.music.126.net/wplU5ibdftnuIMg7wsj0eQ==/6633353651220264.jpg', '132');
INSERT INTO `song` VALUES ('603', '1330023854', 'Think of me（Off Vocal Ver.）', '梓黎', 'http://p2.music.126.net/LtiSe1E-2tU4tVTgWbm6Qg==/109951163697602009.jpg', '0');
INSERT INTO `song` VALUES ('604', '416966064', '孤独的时光', '小周', 'http://p2.music.126.net/ifjtnSY8oQqU1Il7qH7I6Q==/18151837463614639.jpg', '2');
INSERT INTO `song` VALUES ('605', '522994016', '☹', 'MiG0', 'http://p1.music.126.net/N6ZdniZWp9JFKzTWvqm7dA==/109951163078744720.jpg', '0');
INSERT INTO `song` VALUES ('606', '1314975701', 'Land of Silence', '千坂-DCGO-T-2011-Y.F', 'http://p1.music.126.net/k4QO5eufP6WkCZ6wCJKscw==/109951163583880136.jpg', '0');
INSERT INTO `song` VALUES ('607', '33715168', '清晨的美好(钢琴曲)', '张宇桦', 'http://p1.music.126.net/LRlorsd2KlZYC31p1uqrog==/7856010581562831.jpg', '2');
INSERT INTO `song` VALUES ('608', '28160235', '被遗忘的89键(钢琴曲)', '张宇桦', 'http://p1.music.126.net/CWeAKWr06dC8pc0rajYN_w==/109951162811772268.jpg', '2');
INSERT INTO `song` VALUES ('609', '28160231', '风中的蒲公英(钢琴曲)', '张宇桦', 'http://p1.music.126.net/CWeAKWr06dC8pc0rajYN_w==/109951162811772268.jpg', '2');
INSERT INTO `song` VALUES ('610', '28160230', '优美的小调(钢琴曲)', '张宇桦', 'http://p1.music.126.net/CWeAKWr06dC8pc0rajYN_w==/109951162811772268.jpg', '2');
INSERT INTO `song` VALUES ('611', '30569879', 'Reprieve', 'Vallis Alps', 'http://p1.music.126.net/lBvFv5nVK4y_OeJSNxu3Gg==/7729566743509132.jpg', '0');
INSERT INTO `song` VALUES ('612', '36872363', 'Listen (Elekid Remix)', 'Elekid-Said The Sky', 'http://p1.music.126.net/GFa1AaQbVxWCdP1gndWBGw==/3295236352495420.jpg', '0');
INSERT INTO `song` VALUES ('613', '422977895', 'Soulflare', 'Xeuphoria', 'http://p1.music.126.net/V6Fw5Z80HGpSxAGuj28c6A==/2946691197630492.jpg', '0');
INSERT INTO `song` VALUES ('614', '1302193713', '七夕', '四季音色', 'http://p1.music.126.net/QnXFan2HDXmoPrIfeJ7n5A==/109951163463247261.jpg', '2');
INSERT INTO `song` VALUES ('615', '1306093088', '思絮（Thought flocculation）', 'Mr Chip', 'http://p1.music.126.net/6A7ntL9-SGE7kHbmfLHLbg==/109951163523218458.jpg', '2');
INSERT INTO `song` VALUES ('616', '1304960504', '心绪 Continuous Thought', 'Mr Chip', 'http://p1.music.126.net/JDS1dEGG1PJEP6C1SWYJUQ==/109951163512559055.jpg', '2');
INSERT INTO `song` VALUES ('617', '1307063992', 'Echo of Rain', '清风至-落雨夜明-∅', 'http://p1.music.126.net/7dqqXeyxM_iOsfJOwsH-_g==/109951163530874184.jpg', '0');
INSERT INTO `song` VALUES ('618', '1298651651', '夏凉', '文武贝', 'http://p1.music.126.net/mbD5jyup0MuDUmlg3SWZkw==/109951163439553153.jpg', '0');
INSERT INTO `song` VALUES ('619', '1298135870', 'Atolón', 'Noicybino', 'http://p1.music.126.net/ID9frVgi-6h0-o9immuB0A==/109951163436673353.jpg', '2');
INSERT INTO `song` VALUES ('620', '1297333319', '那风停下', '饭碗的彼岸', 'http://p1.music.126.net/kSecQUHkuXeRZn1IY9WbWw==/109951163431792190.jpg', '0');
INSERT INTO `song` VALUES ('621', '34014163', 'theme of SSS -Piano Arrange Ver.-', 'Key Sounds Label', 'http://p1.music.126.net/8tt8jxABjO4pSKhPa0pxHA==/8001146117226406.jpg', '0');
INSERT INTO `song` VALUES ('622', '22802198', '记忆', 'Paniyolo', 'http://p1.music.126.net/hzBmEv7NSIaL0Y_7XVB84Q==/616826023203547.jpg', '0');
INSERT INTO `song` VALUES ('623', '864885422', 'Starting point', '祭酒', 'http://p1.music.126.net/CVSCy7sxqKPT9j5v35jSIA==/109951163396621562.jpg', '2');
INSERT INTO `song` VALUES ('624', '1296816863', '沐风', '四季音色', 'http://p1.music.126.net/pEyAvmXFO3bXtsOXSrj2Fw==/109951163427970183.jpg', '2');
INSERT INTO `song` VALUES ('625', '1297940270', '逆流', '逆时针向', 'http://p1.music.126.net/taaKq-0J6lBxCVbjSyGMzQ==/109951163435622971.jpg', '2');
INSERT INTO `song` VALUES ('626', '864634875', '蝉鸣知夏', '清风至', 'http://p1.music.126.net/8Fx2oXWF0nYlE5l9QWRRTw==/109951163393561441.jpg', '2');
INSERT INTO `song` VALUES ('627', '865320957', 'Palpitate', '逆时针向', 'http://p1.music.126.net/Hb3jnHGH0b1B3hRvh5P6bg==/109951163399857455.jpg', '2');
INSERT INTO `song` VALUES ('628', '865283011', 'All in a Daydream', 'Snigellin', 'http://p1.music.126.net/Mfj_-rIJ1UXyaimIRKc1_A==/109951163663399670.jpg', '128');
INSERT INTO `song` VALUES ('629', '866032176', '莲有秀兮', '饭碗的彼岸', 'http://p1.music.126.net/SsLbGNia06HxDDegS1v1Ug==/109951163405364326.jpg', '2');
INSERT INTO `song` VALUES ('630', '1294219906', '中二幻想曲', '邱有句-馒头MIDIBear', 'http://p1.music.126.net/CLaPZd1vauIsSC94l5txyQ==/109951163410449496.jpg', '0');
INSERT INTO `song` VALUES ('631', '863884847', '如果当初和你在一起', '邱有句-馒头MIDIBear', 'http://p1.music.126.net/eNBvQUE7dD6nU5WWwd2-yA==/109951163385993537.jpg', '0');
INSERT INTO `song` VALUES ('632', '1294799290', '夏风微凉', '忘乡', 'http://p1.music.126.net/aZfj7hc9n8u-ztZ2kkLyDA==/109951163414029984.jpg', '2');
INSERT INTO `song` VALUES ('633', '1295248577', 'Finally with you', 'Candy_Wind', 'http://p1.music.126.net/3g-aXInpCIm7Jkm-0w3QCA==/109951163417134456.jpg', '0');
INSERT INTO `song` VALUES ('634', '864094867', '青山外', '馒头MIDIBear', 'http://p1.music.126.net/DkFwmLsPx11_ZivGpI1Q9g==/109951163388310411.jpg', '0');
INSERT INTO `song` VALUES ('635', '1295843182', '天归自然', '馒头MIDIBear', 'http://p2.music.126.net/scm8IudnLMzTW8GaaAYCRw==/109951163420949116.jpg', '0');
INSERT INTO `song` VALUES ('636', '1295989412', 'Morning Light', '傅许', 'http://p2.music.126.net/UoLoIUM7_3n6Pm8jSoaDFA==/109951163421932325.jpg', '2');
INSERT INTO `song` VALUES ('637', '863464857', '我们别时和见时不同', '饭碗的彼岸', 'http://p2.music.126.net/MvnFO_J-KGZ-q1SIFXZufA==/109951163381550693.jpg', '2');
INSERT INTO `song` VALUES ('638', '503519084', '葬花', '蓝云木-THT', 'http://p2.music.126.net/exjHcps1wDOZVMfauYDuTw==/109951163017611268.jpg', '2');
INSERT INTO `song` VALUES ('639', '862149590', '小时候', '文武贝', 'http://p2.music.126.net/TJC8GSHs0sBptn1W3StZTg==/109951163369857932.jpg', '0');
INSERT INTO `song` VALUES ('640', '574296614', '望(伴奏)', '邱有句-馒头MIDIBear', 'http://p2.music.126.net/gXPkzVNnD53bTZePRFLJbA==/109951163363810491.jpg', '0');
INSERT INTO `song` VALUES ('641', '572719808', 'Settle', '千坂', 'http://p2.music.126.net/wBCIBSNsrLo_is4_2eWkFw==/109951163346327830.jpg', '0');
INSERT INTO `song` VALUES ('642', '573795673', '满夏与距离', '闫东炜', 'http://p2.music.126.net/DABiP3Dc113fo4LFlu7Jvg==/109951163393663194.jpg', '2');
INSERT INTO `song` VALUES ('643', '573633797', 'Night City', '逆时针向-夜の律', 'http://p2.music.126.net/Y4MdyzYtcfVOolpQSY3ejQ==/109951163356228091.jpg', '2');
INSERT INTO `song` VALUES ('644', '572296319', 'Wish For You', '逆时针向', 'http://p2.music.126.net/Maqdmgjyqa5unJ4hET3oZg==/109951163342188642.jpg', '2');
INSERT INTO `song` VALUES ('645', '572182643', 'Rainy Dumplings', '饭碗的彼岸', 'http://p2.music.126.net/ifsWclFHHTZQrEs4uUnvpg==/109951163341188750.jpg', '2');
INSERT INTO `song` VALUES ('646', '571533390', '梨花寻', '馒头MIDIBear', 'http://p2.music.126.net/jxeGbHc_Yva9_idpRDchXw==/109951163335666699.jpg', '0');
INSERT INTO `song` VALUES ('647', '570463424', '消逝', '傅许', 'http://p2.music.126.net/0dVjtSoRkRrX06c6VopN5w==/109951163327706067.jpg', '2');
INSERT INTO `song` VALUES ('648', '570303859', '望', '邱有句-馒头MIDIBear', 'http://p2.music.126.net/D8zoktffaFdbJWc_N8Q-qg==/109951163326755269.jpg', '2');
INSERT INTO `song` VALUES ('649', '564349308', 'We', '四季音色', 'http://p2.music.126.net/Pb6vfimYxkSCPKkRSPfCYQ==/109951163306627813.jpg', '2');
INSERT INTO `song` VALUES ('650', '568110909', '如何（伴奏）', '逆时针向', 'http://p2.music.126.net/kvV_MpAnjKiDEgiWBZqt0g==/109951163305986195.jpg', '2');
INSERT INTO `song` VALUES ('651', '563762640', '夏日蒲公英', '饭碗的彼岸', 'http://p2.music.126.net/v4S_V5Y6t985Ueo_JFOhoA==/109951163304542992.jpg', '2');
INSERT INTO `song` VALUES ('652', '559332460', '江南', '邱有句-馒头MIDIBear-神话音乐社', 'http://p2.music.126.net/QYIKS51StS0DqqMKrTHiQg==/109951163292257546.jpg', '2');
INSERT INTO `song` VALUES ('653', '556673324', '无仙', 'Candy_Wind', 'http://p2.music.126.net/u_l-DllJXI5NzSzpsJ_nVA==/109951163275176799.jpg', '0');
INSERT INTO `song` VALUES ('654', '555110156', '云村的烟花', '邱有句-馒头MIDIBear', 'http://p2.music.126.net/-PrCo3tJyIAL-RHmD2EyYg==/109951163270163495.jpg', '2');
INSERT INTO `song` VALUES ('655', '28054760', 'The Last Saint', 'Mario M', 'http://p1.music.126.net/q9jiI9NQ8lyTMGJjt2VfeQ==/6648746814074341.jpg', '0');
INSERT INTO `song` VALUES ('656', '551029940', '云村的夏句', '邱有句-馒头MIDIBear', 'http://p1.music.126.net/B0L4_iM8t8IEpvUzEJi6ow==/109951163235856317.jpg', '2');
INSERT INTO `song` VALUES ('657', '552935325', '云村的时光', '邱有句-孔小怖-AirS1991', 'http://p1.music.126.net/kKMnXwiA6PSBks-PTXHDng==/109951163247583125.jpg', '2');
INSERT INTO `song` VALUES ('658', '555168700', 'Always Here', '傅许', 'http://p1.music.126.net/Y3tOwzOtl7Qqs_0b4mkddA==/109951163264066678.jpg', '2');
INSERT INTO `song` VALUES ('659', '555516605', '雨之翼', 'Candy_Wind', 'http://p1.music.126.net/49YXWPr8Ka0D0kBuJUYQzA==/109951163267004120.jpg', '0');
INSERT INTO `song` VALUES ('660', '554618922', 'U.Wind', 'Noicybino', 'http://p1.music.126.net/eIcylUdP4DBuZcmqZg0kxw==/109951163258913188.jpg', '2');
INSERT INTO `song` VALUES ('661', '528414846', '《蝶语》', 'MT1990', 'http://p2.music.126.net/Uvu5C4NOJxgRr0KnPfXvcg==/109951163157806396.jpg', '2');
INSERT INTO `song` VALUES ('662', '553750304', '花语', '逆时针向', 'http://p2.music.126.net/XVFzN12yX40I6Wc5wjGQ9g==/109951163252772398.jpg', '2');
INSERT INTO `song` VALUES ('663', '553748329', 'by your side', '逆时针向', 'http://p2.music.126.net/XVFzN12yX40I6Wc5wjGQ9g==/109951163252772398.jpg', '2');
INSERT INTO `song` VALUES ('664', '546912061', '春时初', '逆时针向', 'http://p2.music.126.net/bm4YRrJU7hwVidnbqb-6YA==/109951163200296950.jpg', '2');
INSERT INTO `song` VALUES ('665', '487093203', '夏星夜（Piano Ver.）', '逆时针向', 'http://p2.music.126.net/tzZAooPh3o1bd-gS3OVZ9w==/109951162959063625.jpg', '2');
INSERT INTO `song` VALUES ('666', '542818195', '回忆之末', '忘乡', 'http://p2.music.126.net/7kP8-L8nR_vG6Kwof0bhpA==/109951163171039905.jpg', '2');
INSERT INTO `song` VALUES ('667', '490267528', 'Sakura Tears', 'ChampionLee', 'http://p2.music.126.net/JJ-RC_M48U0TqeXTp7R8rA==/109951162973512791.jpg', '0');
INSERT INTO `song` VALUES ('668', '509313150', 'Sakura Tears', 'Nigel Silin', 'http://p2.music.126.net/UeTuwE7pvjBpypWLudqukA==/3132508627578625.jpg', '0');
INSERT INTO `song` VALUES ('669', '515635175', '桜恋', '詹昊晁', 'http://p2.music.126.net/yn13XuYSJkmTRLW9fJEDdw==/109951163051175085.jpg', '2');
INSERT INTO `song` VALUES ('670', '538559837', '新愿', '逆时针向-smile丶轩', 'http://p2.music.126.net/26UM7eFZHMhYr1xSwJIk0g==/109951163148342026.jpg', '0');
INSERT INTO `song` VALUES ('671', '538394140', '梦醒了', '傅许', 'http://p2.music.126.net/qrSuuOcByjngQ1_hSMKFLg==/109951163147308109.jpg', '2');
INSERT INTO `song` VALUES ('672', '537948037', 'Live for You', 'Snigellin', 'http://p2.music.126.net/SrDM4nfGTWJDkL8n7igpIg==/109951163663394996.jpg', '128');
INSERT INTO `song` VALUES ('673', '467744316', '儿时的夏日', '余日秋山', 'http://p2.music.126.net/abymHUq7Ks0pPT-Beaqhmw==/109951162884434996.jpg', '2');
INSERT INTO `song` VALUES ('674', '535120899', '念', '逆时针向', 'http://p2.music.126.net/pkjaxEKp3y7didZAkpHOhw==/109951163129531562.jpg', '2');
INSERT INTO `song` VALUES ('675', '33035427', 'Chasing Clouds', 'Août', 'http://p2.music.126.net/npeQ-6zQ6PuXb6VBJ2klug==/2919203374302492.jpg', '0');
INSERT INTO `song` VALUES ('676', '535331509', '沐白', '四季音色', 'http://p2.music.126.net/FI7UL7uAIWI8BsN5Muo8Nw==/109951163130601845.jpg', '2');
INSERT INTO `song` VALUES ('677', '533343413', '雫', 'Funton', 'http://p2.music.126.net/6cAxwGac_1vytpl2JZypTw==/109951163731507784.jpg', '0');
INSERT INTO `song` VALUES ('678', '506646198', 'Waiting Bar', '十指流玉', 'http://p2.music.126.net/BPa2WXhZp3Px1Icbjow58Q==/109951163026306473.jpg', '2');
INSERT INTO `song` VALUES ('679', '520849195', '云村的风', '邱有句-AirS1991', 'http://p2.music.126.net/hzaCetDBfQ4cLqD3TXVTFw==/109951163070143402.jpg', '2');
INSERT INTO `song` VALUES ('680', '492292805', 'Sky Mirrors', 'Jannik', 'http://p2.music.126.net/df9JhN546U5bp_6nRmCUIA==/109951162980845369.jpg', '2');
INSERT INTO `song` VALUES ('681', '479641409', '醒不来的梦', 'BrighterThan', 'http://p2.music.126.net/sVQiopVxbwD2IsXTch315g==/109951162923727589.jpg', '0');
INSERT INTO `song` VALUES ('682', '515384475', 'Fwio', 'Saiakoup', 'http://p2.music.126.net/YQqbSt7lbVdmUqraf0ku7A==/109951163050319613.jpg', '0');
INSERT INTO `song` VALUES ('683', '530325654', '你看起来有点甜', '忘乡', 'http://p2.music.126.net/sFWLhVBqQkkW6xI8Zm0LUw==/109951163107330906.jpg', '2');
INSERT INTO `song` VALUES ('684', '530113170', '2020', '四季音色', 'http://p2.music.126.net/TbVkj70kHYvIce-VtF8Wlg==/109951163106534003.jpg', '2');
INSERT INTO `song` VALUES ('685', '527305648', '浮生若梦', '逆时针向', 'http://p2.music.126.net/58zr30MKRCBqcv_k5R5rcA==/109951163096382628.jpg', '2');
INSERT INTO `song` VALUES ('686', '495626744', 'Azure', 'Saiakoup', 'http://p2.music.126.net/iPVQQO0D6ZCMzfRriFx2eQ==/109951162993251564.jpg', '0');
INSERT INTO `song` VALUES ('687', '38592319', 'Memories Of You (Original Mix)', 'You Are Free', 'http://p1.music.126.net/HliytY7h0yxFy_XO0JVrzg==/3395291910036703.jpg', '0');
INSERT INTO `song` VALUES ('688', '464863017', '烟袋斜街', '接个吻，开一枪', 'http://p1.music.126.net/tTRaVql9l0ZwQ2Y3oSZ9pQ==/109951162874838750.jpg', '0');
INSERT INTO `song` VALUES ('689', '477417503', '最初', '逆时针向', 'http://p1.music.126.net/JEZ4HxGJXIQgQwxH0RUiFA==/109951162925502415.jpg', '2');
INSERT INTO `song` VALUES ('690', '517346741', 'Gypsophila', 'MoreanP', 'http://p1.music.126.net/I6L-jkmBdicjAGU64ZsfRw==/109951163057015842.jpg', '0');
INSERT INTO `song` VALUES ('691', '526118754', '圣诞与元旦', '闫东炜', 'http://p1.music.126.net/_FpGpE-PD8QkQVVOeP92Mg==/18027592649105768.jpg', '2');
INSERT INTO `song` VALUES ('692', '422419646', 'Unable', 'July', 'http://p1.music.126.net/pYUVL8aj6FjgeNH4rbNGlg==/109951163600248714.jpg', '261');
INSERT INTO `song` VALUES ('693', '454757785', 'Forward', 'K kure', 'http://p1.music.126.net/gsUbmXEexZCaQVbwFCL-UQ==/109951162846616156.jpg', '2');
INSERT INTO `song` VALUES ('694', '496774187', 'Feeling The Rain', 'MoreanP', 'http://p1.music.126.net/p9Frozdg_luAkO6ENOtTXg==/109951162997219545.jpg', '0');
INSERT INTO `song` VALUES ('695', '506650377', '忆夏思乡', 'MoreanP', 'http://p1.music.126.net/nd_hrcffrO41ho9kwvh6mQ==/109951163026324216.jpg', '0');
INSERT INTO `song` VALUES ('696', '467163300', 'Pisces', '和弦', 'http://p1.music.126.net/m7klvUGBX51nWosh6lo5EQ==/109951162881995450.jpg', '0');
INSERT INTO `song` VALUES ('697', '404459321', 'Love home', '小周', 'http://p1.music.126.net/4v79EBaIw-6ohXTnT27M8w==/16586132905531420.jpg', '2');
INSERT INTO `song` VALUES ('698', '523157861', 'Waiting', '傅许', 'http://p1.music.126.net/0E_ddKvh70pBu4bSLWSKhA==/109951163079897708.jpg', '2');
INSERT INTO `song` VALUES ('699', '519286594', '熹光', '逆时针向', 'http://p1.music.126.net/OekYOJnPUy_93q-QkYQz6w==/109951163064087024.jpg', '2');
INSERT INTO `song` VALUES ('700', '518540371', '斑光', '四季音色', 'http://p1.music.126.net/riBaS2eoGflvzHM99CP2-A==/109951163061531613.jpg', '2');
INSERT INTO `song` VALUES ('701', '455382413', 'Beijing', '接个吻，开一枪-Clare', 'http://p1.music.126.net/p-PJoWb1XKRU0y46dduuag==/109951162848216929.jpg', '2');
INSERT INTO `song` VALUES ('702', '465239256', 'Dream', 'Thunse', 'http://p1.music.126.net/ldhJ7W3Y1XkJNKsYPZFlHQ==/109951162875665571.jpg', '130');
INSERT INTO `song` VALUES ('703', '777951', '恸哭', 'MANYO', 'http://p1.music.126.net/crvtWaK8js6buwOzGIFrCA==/792747883626783.jpg', '0');
INSERT INTO `song` VALUES ('704', '515516330', '一个人的城市', '傅许', 'http://p1.music.126.net/y0TeBSVNHjUe5wSCdRsYcw==/109951163050795809.jpg', '2');
INSERT INTO `song` VALUES ('705', '403012374', 'Reminiscence', 'Sappheiros', 'http://p1.music.126.net/UW091F1oSWN1lFNgLT2D0w==/1408474395783846.jpg', '0');
INSERT INTO `song` VALUES ('706', '452392270', '秋之痕', '詹昊晁', 'http://p1.music.126.net/68MPj8weF3RprvYlZdE_ng==/109951163520387849.jpg', '2');
INSERT INTO `song` VALUES ('707', '458026683', '桜之空', '詹昊晁', 'http://p1.music.126.net/rh4_1FPn1x2AMIpBd3W_fA==/109951162855350627.jpg', '2');
INSERT INTO `song` VALUES ('708', '511040995', '时光记忆', '傅许', 'http://p1.music.126.net/JWONwHugPCdOreJYBVNkAw==/109951163037057470.jpg', '2');
INSERT INTO `song` VALUES ('709', '462177081', 'An Old Song', 'MoreanP', 'http://p1.music.126.net/JoPwp8la7lf2bFi0UQKn_g==/109951162866713272.jpg', '128');
INSERT INTO `song` VALUES ('710', '1992391', 'Awaken The Dawn', 'Stanton Lanier', 'http://p1.music.126.net/Ppsv2k6EmaTzIfXZk6qyJg==/6633353650602688.jpg', '0');
INSERT INTO `song` VALUES ('711', '18861490', 'Promise', '山岡晃', 'http://p1.music.126.net/QbadLxlMMmb4iStV4JnKLA==/6664139976590904.jpg', '128');
INSERT INTO `song` VALUES ('712', '32217265', '望天', '孙无忧', 'http://p1.music.126.net/JMY8fFnoKY4M69mbz0WdiQ==/2906009233923869.jpg', '0');
INSERT INTO `song` VALUES ('713', '27580009', 'Destiny', 'Rainy Day', 'http://p1.music.126.net/pERhjARCIrZwNd0UFfHpWg==/5749346301711508.jpg', '0');
INSERT INTO `song` VALUES ('714', '31789196', 'Dragonfly Keeper', 'Phildel', 'http://p1.music.126.net/mEUFjfp8oj1-zM7MiqkZlw==/2910407279805247.jpg', '0');
INSERT INTO `song` VALUES ('715', '848290', 'LONGING LOVE (カバー)', 'The Standard Club', 'http://p1.music.126.net/051OagP3a75nZG2HiTNh7w==/109951163598701684.jpg', '0');
INSERT INTO `song` VALUES ('716', '760058', 'Bloom of Youth', '清水準一', 'http://p1.music.126.net/BxiuK1_8_RXArdjxOqqUeg==/3382097775018074.jpg', '0');
INSERT INTO `song` VALUES ('717', '406232', 'Luv Letter', 'DJ Okawari', 'http://p1.music.126.net/ca-BEF4QaxzYSa-glDjS2w==/109951163530161960.jpg', '128');
INSERT INTO `song` VALUES ('718', '434871406', '夏の喚く', '邱有句-AirS1991', 'http://p1.music.126.net/7BPYzlYTQp285WXdO-u2Ug==/18215609137826245.jpg', '2');
INSERT INTO `song` VALUES ('719', '472256897', '四月，初雨微凉', '紫竹笛韵', 'http://p1.music.126.net/Qy3aDAXC0LvMNMPsJBywKA==/109951162903624584.jpg', '2');
INSERT INTO `song` VALUES ('720', '492926375', '七月，蝉鸣月色', '紫竹笛韵', 'http://p1.music.126.net/IYmyLaT89ouNZMsIOuOJUg==/109951162983120979.jpg', '2');
INSERT INTO `song` VALUES ('721', '478830981', '五月，和风微醺', '紫竹笛韵', 'http://p1.music.126.net/PWUVBmiUUqf-alS_1QHm8Q==/109951162929500596.jpg', '2');
INSERT INTO `song` VALUES ('722', '502218792', '初秋与七夕', '闫东炜', 'http://p1.music.126.net/_FpGpE-PD8QkQVVOeP92Mg==/18027592649105768.jpg', '2');
INSERT INTO `song` VALUES ('723', '479494742', '夏之风', '阿铭', 'http://p1.music.126.net/7F_75SSITgJ9LHM3m07diw==/109951162931512258.jpg', '2');
INSERT INTO `song` VALUES ('724', '30245064', 'アゲイン', '横山克', 'http://p1.music.126.net/GSciAiBHt0OplBApxsUC-A==/7742760882881891.jpg', '0');
INSERT INTO `song` VALUES ('725', '496071832', 'After The Rain', '傅许', 'http://p1.music.126.net/NUiGuuMBJ2_Etp_TvTXvtg==/109951162994645221.jpg', '2');
INSERT INTO `song` VALUES ('726', '490991569', 'Hometown and miss', '小周', 'http://p1.music.126.net/8tRQuPlNjFAuXLrb6d4gWg==/109951162976208315.jpg', '2');
INSERT INTO `song` VALUES ('727', '403012108', 'Rainy Morning', '金允', 'http://p2.music.126.net/GxRfaxtumSlkcy7BdiHkXw==/1391981721414434.jpg', '128');
INSERT INTO `song` VALUES ('728', '29378656', '쓰레기 (Inst.)', '河佑镇', 'http://p2.music.126.net/m8R_rJn29F0gMZofwCjzEA==/3207275418305070.jpg', '0');
INSERT INTO `song` VALUES ('729', '30780440', 'Far Away', 'Yinyues', 'http://p2.music.126.net/DW-fId71WHtzfDJH_X5kBg==/7777945255137045.jpg', '0');
INSERT INTO `song` VALUES ('730', '29544794', 'Everything', 'Yinyues', 'http://p2.music.126.net/TcxdEdzRbKrwli4fVGeSiw==/6628955604788949.jpg', '0');
INSERT INTO `song` VALUES ('731', '4946902', 'pure heart', '松田彬人', 'http://p2.music.126.net/ec-hMJpWpcXxkmWxzSRcKg==/6066005650723645.jpg', '0');
INSERT INTO `song` VALUES ('732', '5364950', '사랑...아프다...', 'Acoustic Radio', 'http://p2.music.126.net/PGgVwl49UaZr7zXNqCsTsA==/522268023193620.jpg', '128');
INSERT INTO `song` VALUES ('733', '5365169', '행복한 느낌', 'Acoustic Radio', 'http://p2.music.126.net/z_Ts0qhtIYbITTj0oedinA==/522268023193623.jpg', '128');
INSERT INTO `song` VALUES ('734', '5079881', 'Only Wish', 'Nicholas Cheung', 'http://p2.music.126.net/1IgM_3bBIVUudtXd4n_JXQ==/571746046489303.jpg', '0');
INSERT INTO `song` VALUES ('735', '454035505', 'Asphyxia', '逆时针向', 'http://p2.music.126.net/HBQ85tWUCLd25-YEfi_9YQ==/109951162844677225.jpg', '2');
INSERT INTO `song` VALUES ('736', '357126', 'Tassel', 'Cymophane', 'http://p2.music.126.net/7cYhniBuLvU3fvLjeRFeNw==/106652627910735.jpg', '0');
INSERT INTO `song` VALUES ('737', '698479', 'Best Moments (feat. Kondor)', 'Blazo', 'http://p2.music.126.net/zAPL3SWyt-4RIFFzdfMwPA==/944480488259775.jpg', '0');
INSERT INTO `song` VALUES ('738', '5101648', 'Righteous Path', 'Blazo', 'http://p2.music.126.net/o4wMwFnshjdtqCaHTSJpFA==/1669058650976408.jpg', '128');
INSERT INTO `song` VALUES ('739', '26125533', 'Hope', 'Blazo', 'http://p2.music.126.net/Pb5Hz3Wwlw-Y8B4seXObtA==/2390338278810211.jpg', '0');
INSERT INTO `song` VALUES ('740', '28838936', '4월의 눈동자를 지닌 소녀 (The Girl With April In Her Eyes)', 'Crepe', 'http://p2.music.126.net/U61kK1oR0rCfzHEkP09G1w==/109951163143540317.jpg', '128');
INSERT INTO `song` VALUES ('741', '28089959', '나예요(Inst.)', '한울', 'http://p2.music.126.net/Gu4b7HVlALeFG9diIYUxXQ==/17981413160909217.jpg', '128');
INSERT INTO `song` VALUES ('742', '480353', 'いつも何度でも', '宗次郎', 'http://p2.music.126.net/ygxAeYxxXPONww041tylMw==/5996736418028563.jpg', '0');
INSERT INTO `song` VALUES ('743', '28889785', 'Peace Of Mind', 'Jacoo', 'http://p2.music.126.net/GPv_mcfeaD5aZ5L70udTtg==/109951163298570854.jpg', '132');
INSERT INTO `song` VALUES ('744', '487089933', '夏新晨', '逆时针向', 'http://p2.music.126.net/tzZAooPh3o1bd-gS3OVZ9w==/109951162959063625.jpg', '2');
INSERT INTO `song` VALUES ('745', '488077597', 'Hanabi', 'Noicybino', 'http://p2.music.126.net/vHO15CRtupjfnjBH4dOgHg==/109951162963693252.jpg', '2');
INSERT INTO `song` VALUES ('746', '451543833', 'Last Reincarnation', 'AniFace', 'http://p2.music.126.net/FgLIokiq3mdjLjUMTxKcJg==/109951162837881950.jpg', '0');
INSERT INTO `song` VALUES ('747', '485327917', '夏日、教室与望着窗外的我', 'Candy_Wind', 'http://p2.music.126.net/QlKAIFfjip5N0weK4YinHg==/109951162952177323.jpg', '2');
INSERT INTO `song` VALUES ('748', '477844082', '风屿', '闫东炜', 'http://p2.music.126.net/LDVWKDqOIhXGytKQFDiQbA==/18317863718845292.jpg', '2');
INSERT INTO `song` VALUES ('749', '139177', '秋～華恋～', 'α·Pav', 'http://p1.music.126.net/HwQ5ubsoQtN8kDSlCleB_A==/102254581398923.jpg', '1');
INSERT INTO `song` VALUES ('750', '139268', '桜', 'α·Pav', 'http://p1.music.126.net/lGKTPIR0dvEt09OMlzflxA==/93458488376709.jpg', '2');
INSERT INTO `song` VALUES ('751', '28748337', '바람의 꽃이 되어서', 'Reve', 'http://p1.music.126.net/yK7eGEr44DmU-HJjerwikA==/6051711999913168.jpg', '0');
INSERT INTO `song` VALUES ('752', '34040337', '마지막 세계의 왈츠', 'Sereno', 'http://p1.music.126.net/_snpBQeE96uf8XAhdYMXog==/7852712046706413.jpg', '0');
INSERT INTO `song` VALUES ('753', '5322513', 'Rain', 'Nonefree', 'http://p1.music.126.net/5AHE92Ta5ksGvr3BNo1PKA==/568447511566434.jpg', '128');
INSERT INTO `song` VALUES ('754', '28830584', 'In The Sky (String Ver.)', 'Geo', 'http://p1.music.126.net/FvITXVGDuFuXQEwcCvkVcQ==/5956054488081550.jpg', '0');
INSERT INTO `song` VALUES ('755', '28941364', '카푸치노처럼 부드러운 그대와', 'Nadan', 'http://p1.music.126.net/JwJd2e7JuJ0Xe6kiWsgnPA==/8901646138805353.jpg', '128');
INSERT INTO `song` VALUES ('756', '28941461', 'No Regrets', 'Yulia', 'http://p1.music.126.net/1rmqOkuXwo5X6AkmmrntBQ==/8892850045783019.jpg', '0');
INSERT INTO `song` VALUES ('757', '28161223', 'Beautiful Moment', 'Yulia', 'http://p1.music.126.net/iXoHYP16YMlzWTqkSJ5e3g==/5888984278380961.jpg', '0');
INSERT INTO `song` VALUES ('758', '5293138', 'Music Brings You', 'Aev', 'http://p1.music.126.net/zLbkj97NFVNgzE9FMCbVjA==/136339441865170.jpg', '132');
INSERT INTO `song` VALUES ('759', '425684875', '그대가 그리운 날에는', 'DD', 'http://p1.music.126.net/u_J9UnEskalfzDdMSMddjA==/738871824141957.jpg', '128');
INSERT INTO `song` VALUES ('760', '432698278', 'Protect You', '吴俊城', 'http://p1.music.126.net/NvAvVA9632WQmWvjiRDeyQ==/18700493765616154.jpg', '128');
INSERT INTO `song` VALUES ('761', '433107499', '星空', '文武贝', 'http://p1.music.126.net/MkUpH9QOMVdV0minPZOajg==/17993507788768631.jpg', '0');
INSERT INTO `song` VALUES ('762', '155847', '镜夜', 'V.K克', 'http://p1.music.126.net/wu0Lu5JtOFgLdxsFScSnZg==/130841883718453.jpg', '0');
INSERT INTO `song` VALUES ('763', '437752427', '幽梦', '阿铭', 'http://p1.music.126.net/_t6a2HBdyP3s83A5TneY9w==/109951162841684035.jpg', '2');
INSERT INTO `song` VALUES ('764', '437752156', '羽毛', '刘捷', 'http://p1.music.126.net/lxhE6BYr4jLA5WTSjmclZw==/17682345998262738.jpg', '2');
INSERT INTO `song` VALUES ('765', '461074907', '寂静之空', '傅许', 'http://p1.music.126.net/SWO7UuIF2yOPpguwI4vXvw==/109951162863193280.jpg', '2');
INSERT INTO `song` VALUES ('766', '476625725', 'Summer Fantasy~', '傅许', 'http://p1.music.126.net/Iw4RX41INrRGqQV9UUhgrA==/109951162922687626.jpg', '2');
INSERT INTO `song` VALUES ('767', '409649038', '小河', '饭碗的彼岸', 'http://p1.music.126.net/VMQ_xa5cqPKdJD8YjPkWnw==/18291475439922896.jpg', '2');
INSERT INTO `song` VALUES ('768', '40257799', '阳光明媚的早晨我迟到了', '饭碗的彼岸', 'http://p1.music.126.net/x0i7jsQXgMzKz1Kyb3P9kg==/109951163072128619.jpg', '2');
INSERT INTO `song` VALUES ('769', '36897723', '风居住的街道（Piano ver）', '饭碗的彼岸', 'http://p1.music.126.net/whY6XEhDBloYvnU4M9z5-Q==/18250793509574805.jpg', '0');
INSERT INTO `song` VALUES ('770', '406070435', '小樱', '饭碗的彼岸', 'http://p1.music.126.net/Cohn8qMSUA0Mt6JlfOzCiw==/109951162809958318.jpg', '2');
INSERT INTO `song` VALUES ('771', '450686151', '晨光一现', '小周', 'http://p1.music.126.net/y6t5yw0ILjVSMnAEHp4O-A==/109951162834959927.jpg', '2');
INSERT INTO `song` VALUES ('772', '41669234', 'My dream', '小周', 'http://p1.music.126.net/eO7UYL2yKraUoM1N2ZBHBQ==/18254092044710231.jpg', '2');
INSERT INTO `song` VALUES ('773', '475584898', '半夏', '十指流玉', 'http://p2.music.126.net/LOKGuPNt1m7_mdZZg_LSww==/109951163156638721.jpg', '2');
INSERT INTO `song` VALUES ('774', '22688487', '風見鶏', 'DEPAPEPE', 'http://p2.music.126.net/e7tHu2ucWtRob8LIoDkzbA==/17801093254116482.jpg', '132');
INSERT INTO `song` VALUES ('775', '26624714', 'When The Light Comes', 'Dirk Reichardt', 'http://p2.music.126.net/lK-dDgUWE26Salju3bmZIw==/2313372464905462.jpg', '0');
INSERT INTO `song` VALUES ('776', '404610', 'Town of Windmill', 'a_hisa', 'http://p2.music.126.net/RAloNVx4neI7Od9-YBUqzA==/890604418498806.jpg', '0');
INSERT INTO `song` VALUES ('777', '28949390', 'Piano Beat', 'BeaTsGOy', 'http://p2.music.126.net/UeTuwE7pvjBpypWLudqukA==/3132508627578625.jpg', '0');
INSERT INTO `song` VALUES ('778', '25731432', 'what for?', 'sAr', 'http://p2.music.126.net/vHfL6AtfXZvdUzUMl4V1wg==/5737251673795920.jpg', '0');
INSERT INTO `song` VALUES ('779', '2060546', 'Sky High', 'Thomas Prime', 'http://p2.music.126.net/xiSkYsT7xcvqh2bauJ1E1w==/871912720871539.jpg', '0');
INSERT INTO `song` VALUES ('780', '29747816', 'Don Coi (Instrumental)', 'Truong Quynh Anh', 'http://p2.music.126.net/rxPF4G0IVD1fT9ngKQIuGQ==/3294136838291293.jpg', '0');
INSERT INTO `song` VALUES ('781', '27903692', 'Radioactive', 'William Joseph', 'http://p2.music.126.net/IeNepGO_b0uKEzF3ASYA5w==/5715261441302954.jpg', '0');
INSERT INTO `song` VALUES ('782', '475311996', '白露', '羽肿', 'http://p2.music.126.net/Q9w4z76hCfERyt-BfpZ9JA==/109951162916180393.jpg', '2');
INSERT INTO `song` VALUES ('783', '462375091', '我们', '逆时针向', 'http://p2.music.126.net/fT5GWPu2mN6M8ETW8H9BZg==/109951162867232146.jpg', '2');
INSERT INTO `song` VALUES ('784', '453843751', 'Where are you', 'AniFace', 'http://p2.music.126.net/AUfXMljLBgB3PBV731IzRg==/109951162857118370.jpg', '2');
INSERT INTO `song` VALUES ('785', '474579829', '一握之砂', '闫东炜', 'http://p2.music.126.net/9BlWzdAZ_CxaPpKAN85Z5g==/109951163398344996.jpg', '2');
INSERT INTO `song` VALUES ('786', '441532', '流れ行く云', '岸部眞明', 'http://p2.music.126.net/l5-9FCPKx9xrUtzyKCMPPw==/81363860481074.jpg', '0');
INSERT INTO `song` VALUES ('787', '420602', 'グリーン・ウィローGuitar2', '池頼広', 'http://p2.music.126.net/Q13hoKmeL_2qS02kURmVPA==/18569651883279731.jpg', '0');
INSERT INTO `song` VALUES ('788', '22822502', 'CLOSE TO YOU', '押尾コータロー', 'http://p2.music.126.net/MdOs_GIUYgK8blnXajs2IQ==/873012232478202.jpg', '0');
INSERT INTO `song` VALUES ('789', '1993749', 'Rainy Day Reminiscence', 'Soulostar', 'http://p2.music.126.net/LeucwtFfHIFeUxuDDgTyTA==/1760318116070865.jpg', '0');
INSERT INTO `song` VALUES ('790', '27580689', 'In Time', 'Soulostar', 'http://p2.music.126.net/Qwdlx_359nJps2b1A8Mdpg==/5694370720322357.jpg', '0');
INSERT INTO `song` VALUES ('791', '26328682', '芳香', 'Beatsound', 'http://p2.music.126.net/11csG5bPEI-sPGfir_NbZw==/2409029976512917.jpg', '0');
INSERT INTO `song` VALUES ('792', '28188702', 'Stand on Your Feet', 'Beatsound', 'http://p2.music.126.net/gn1ZPC0ZMN5DimX40HS_hg==/5880188185451810.jpg', '0');
INSERT INTO `song` VALUES ('793', '63486', 'Sustain', 'Beatsound', 'http://p2.music.126.net/JbJW6-QshiKR_pZDlJmcLw==/80264348828320.jpg', '0');
INSERT INTO `song` VALUES ('794', '410042763', '夏夜', '四季音色', 'http://p2.music.126.net/pk-xo-6Nu5bwrA-ylVJFUA==/17885755649212510.jpg', '2');
INSERT INTO `song` VALUES ('795', '409649183', '春日', '四季音色', 'http://p2.music.126.net/IzwWL-ULrEKH9FK3pEFLFA==/17857168346938270.jpg', '2');
INSERT INTO `song` VALUES ('796', '410181618', '雨夜', '四季音色', 'http://p2.music.126.net/hWiypXV3Gj0oMLxxkydofQ==/18365142719272422.jpg', '2');

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
  `zyyzs` int(11) DEFAULT '0' COMMENT '总音缘指数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'oGKBZ5Dl0vVABRCMvjvgxXsazyjQ', 'Kevin_涛', 'https://wx.qlogo.cn/mmopen/vi_32/xhPG9GR4vqMABc9vZ9667ZgOqcomOEMuWnfkas1bpm33RcniakbFfAicLYny2ww6JCKzYePJ5vSQXAbeXoHjCG5w/132', '1', '1132', '212');
INSERT INTO `user` VALUES ('2', 'oGKBZ5EE55SzVmnkkPKb8djD4PgY', 'Le', 'https://wx.qlogo.cn/mmopen/vi_32/mM10icFM9LzPaa2D8CLmucMxKWjl4MhOqOMD3PpXUNsQTdQHLcf3rODqGs0kwvyPerpywBiaerqviczWAMCzdyGSA/132', '1', '1032', '46');
INSERT INTO `user` VALUES ('3', 'oGKBZ5Jk_cn7u7asO4DobEOrRFCU', '幼今', 'https://wx.qlogo.cn/mmopen/vi_32/iasSQvhohGicxePcOla15AwSTah55icdbMeQibeVdvbRjibweGdbxdE9QgfobtQu2EbfQDNjMmjT7F5QgPy3bVOnq8w/132', '2', '999', '66');
INSERT INTO `user` VALUES ('4', 'oGKBZ5PX3gs8hCccN8XmaIpCQPdc', '이역봉', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epZnG62cq5IxqMKK05iaDBmIicmKkReKsgUJhGhBYefv4XibCytlTq3QCm81diaQ48XViaAMiaaa6LfbM4g/132', '2', '999', '99');
INSERT INTO `user` VALUES ('5', 'oGKBZ5JxpLwiTXGSs0F5bJMZ3VnI', '平凡的世界', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erk5UhvmJB8HKUrwnp564tRAVtVERcQB7cOEEU5XaHrNBGw0MUTEU8pA8gT4ZzecIclkaDFuhmaWw/132', '1', '984', '22');
INSERT INTO `user` VALUES ('6', 'oGKBZ5MurBoQ3VsMh8N0z4IJCAWA', '^o^爇尽残阳水沉烟', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIibD7vjC8JExPWf6xtw4kHvDed3U8upfpfNAXicJpGvrd0aRBG2dNGj94LApwgEhThFc9VuHoTr96w/132', '1', '989', '11');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户感受表（关联用户听歌时选择的感受）';

-- ----------------------------
-- Records of userfeel
-- ----------------------------

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
  `hostId` int(11) DEFAULT NULL COMMENT '匹配的用户创建者id',
  `yyNum` varchar(255) DEFAULT NULL COMMENT '音缘序号',
  `ppzs` int(1) DEFAULT NULL COMMENT '匹配指数(0~5)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='音缘表（若用户匹配音缘满阶，则将记录保存在此。可通过groupBy分组 count计数 orderBy排序进行最终排名）';

-- ----------------------------
-- Records of yinyuan
-- ----------------------------
INSERT INTO `yinyuan` VALUES ('1', '2', '1', '15402355', '3');
