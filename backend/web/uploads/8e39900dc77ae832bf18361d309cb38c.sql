/*
Navicat MySQL Data Transfer

Source Server         : videoOld
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : db667790565

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2017-03-13 15:52:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1485178472');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1485178475');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `at` int(11) DEFAULT NULL,
  `cr` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('111', 'Valod', '144', '18');
INSERT INTO `test` VALUES ('1241', 'Valod', '2017', '2017');
INSERT INTO `test` VALUES ('11741', 'Valod', '1744', '18');
INSERT INTO `test` VALUES ('12451', 'Valod', '2017', '2017');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'mcadmin', 'CiIwTYvAnOLdLrTS1uIY8A8m84PO1306', '$2y$13$YEiKa8L5ifMMm1KbGwvJHuUlyZaO5IiQPoVuSmKSgQr1PAhsW9Gtq', null, 'mcadmin@gmail.com', '10', '1485246566', '1485246566');

-- ----------------------------
-- Table structure for vid_actions
-- ----------------------------
DROP TABLE IF EXISTS `vid_actions`;
CREATE TABLE `vid_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_name` varchar(255) DEFAULT NULL,
  `action_type` varchar(255) DEFAULT NULL,
  `type` int(5) DEFAULT '0' COMMENT '"1"- goal keeper',
  `time_before` int(11) DEFAULT NULL,
  `time_after` int(11) DEFAULT NULL,
  `event_type` int(5) DEFAULT '0' COMMENT '1-evnet 0-action',
  `main_type` int(5) DEFAULT '0' COMMENT '1-show in main page',
  `timer_role` varchar(5) DEFAULT 'E',
  `sorting` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vid_actions
-- ----------------------------
INSERT INTO `vid_actions` VALUES ('1', 'Faute', null, '0', '5', '3', '0', '1', 'S', '9');
INSERT INTO `vid_actions` VALUES ('2', 'Hors-jeu', null, '0', '7', '3', '0', '1', 'S', '10');
INSERT INTO `vid_actions` VALUES ('3', 'Sortie', null, '0', '3', '3', '1', '1', 'S', '5');
INSERT INTO `vid_actions` VALUES ('4', 'Duel', null, '0', '4', '4', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('5', 'Duel aérien', null, '0', '3', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('6', 'Coup franc', null, '0', '3', '7', '0', '1', 'R', '13');
INSERT INTO `vid_actions` VALUES ('7', 'Main', null, '0', '4', '3', '0', '1', 'S', '11');
INSERT INTO `vid_actions` VALUES ('8', 'Penalty', null, '0', '3', '3', '0', '1', 'R', '14');
INSERT INTO `vid_actions` VALUES ('9', 'Passe', null, '0', '3', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('10', 'Passe longue', null, '0', '3', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('11', 'Passe avant', null, '0', '3', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('12', 'Passe avant longue', null, '0', '3', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('13', 'Centre', null, '0', '4', '4', '0', '0', 'R', null);
INSERT INTO `vid_actions` VALUES ('14', '6m', null, '0', '3', '7', '0', '1', 'R', '8');
INSERT INTO `vid_actions` VALUES ('15', 'Corner', null, '0', '3', '7', '0', '1', 'R', '7');
INSERT INTO `vid_actions` VALUES ('16', 'Entre 2', null, '0', '2', '5', '0', '1', 'R', '15');
INSERT INTO `vid_actions` VALUES ('17', 'Touche', null, '0', '3', '7', '0', '1', 'R', '6');
INSERT INTO `vid_actions` VALUES ('18', 'But', 'GOAL', '0', '7', '3', '0', '1', 'S', '1');
INSERT INTO `vid_actions` VALUES ('19', 'But CSC', 'GOALC', '0', '7', '3', '0', '1', 'S', '2');
INSERT INTO `vid_actions` VALUES ('20', 'Tir cadré', null, '0', '7', '3', '0', '1', 'E', '3');
INSERT INTO `vid_actions` VALUES ('21', 'Tir hors cadre', null, '0', '7', '3', '0', '1', 'E', '4');
INSERT INTO `vid_actions` VALUES ('22', 'Tir contré', null, '0', '4', '4', '0', '0', 'R', null);
INSERT INTO `vid_actions` VALUES ('23', 'Intervention-Dégagement', null, '0', '4', '4', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('24', 'Arrêt 18m', null, '1', '5', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('25', 'Arrêt 6m', null, '1', '5', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('26', 'Attaque camp adverse', null, '1', '4', '4', '0', '0', '', null);
INSERT INTO `vid_actions` VALUES ('27', 'intervention hors surface', null, '1', '5', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('28', 'Relance main courte', null, '1', '2', '4', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('29', 'Relance main longue', null, '1', '2', '4', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('30', 'Relance pied courte', null, '1', '2', '4', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('31', 'Relance pied longue', null, '1', '2', '4', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('32', 'Sortie aérienne 18m', null, '1', '5', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('33', 'Sortie aérienne 6m', null, '1', '5', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('34', 'Sortie gardien 18m (sup 6m)', null, '1', '5', '3', '0', '0', null, null);
INSERT INTO `vid_actions` VALUES ('35', 'Fin  mi-temps', 'END', '0', null, null, '1', '1', 'E', '18');
INSERT INTO `vid_actions` VALUES ('36', 'Carton', null, '0', '5', '5', '0', '1', 'E', '16');
INSERT INTO `vid_actions` VALUES ('38', 'Action VM', null, '0', '5', '5', '0', '1', 'E', '17');
INSERT INTO `vid_actions` VALUES ('39', 'Coup d’envoie mi-temps', 'START', '0', null, null, '1', '0', 'E', null);

-- ----------------------------
-- Table structure for vid_events
-- ----------------------------
DROP TABLE IF EXISTS `vid_events`;
CREATE TABLE `vid_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `player1_id` int(11) DEFAULT NULL,
  `player2_id` int(11) DEFAULT NULL,
  `time_game` float(11,0) DEFAULT NULL,
  `time_video` float(11,0) DEFAULT NULL,
  `success` enum('Y','N') DEFAULT NULL,
  `card_yellow` int(11) DEFAULT NULL,
  `card_red` int(11) DEFAULT NULL,
  `visible` int(11) DEFAULT '1',
  `full_geolocation` int(11) DEFAULT NULL,
  `half_geolocation` int(11) DEFAULT NULL,
  `half_time` int(11) NOT NULL,
  `favorite` int(11) DEFAULT NULL,
  `sec_action_id` int(11) DEFAULT NULL,
  `sec_player1_id` int(11) DEFAULT NULL,
  `sec_player2_id` int(11) DEFAULT NULL,
  `sec_success` enum('Y','N') DEFAULT NULL,
  `sec_full_geolocation` int(11) DEFAULT NULL,
  `time_from` int(11) DEFAULT NULL,
  `time_to` int(11) DEFAULT NULL,
  `video_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_player_id1` (`player1_id`),
  KEY `fk_player_id2` (`player2_id`),
  KEY `fk_sec_player_id1` (`sec_player1_id`),
  KEY `fk_sec_player_id2` (`sec_player2_id`),
  CONSTRAINT `fk_player_id1` FOREIGN KEY (`player1_id`) REFERENCES `vid_players` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_player_id2` FOREIGN KEY (`player2_id`) REFERENCES `vid_players` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sec_player_id1` FOREIGN KEY (`sec_player1_id`) REFERENCES `vid_players` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sec_player_id2` FOREIGN KEY (`sec_player2_id`) REFERENCES `vid_players` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2465 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vid_events
-- ----------------------------
INSERT INTO `vid_events` VALUES ('2459', '2', '19', '2', null, '84', '456', null, null, null, '1', null, null, '2', null, null, null, null, null, null, null, null, '');
INSERT INTO `vid_events` VALUES ('2460', '2', '15', '3', null, '85', '457', null, null, null, '1', null, null, '2', null, null, null, null, null, null, '454', '464', '');
INSERT INTO `vid_events` VALUES ('2461', '2', '20', '10', null, '86', '458', null, null, null, '1', null, null, '2', null, null, null, null, null, null, '451', '461', '');
INSERT INTO `vid_events` VALUES ('2462', '2', '21', '42', null, '88', '460', null, null, null, '1', null, null, '2', null, null, null, null, null, null, '453', '463', '');
INSERT INTO `vid_events` VALUES ('2463', '2', '19', '8', null, '89', '461', null, null, null, '1', null, null, '2', null, null, null, null, null, null, '454', '464', '');
INSERT INTO `vid_events` VALUES ('2464', '2', '15', '6', null, '91', '463', null, null, null, '1', null, null, '2', null, null, null, null, null, null, '460', '470', '');

-- ----------------------------
-- Table structure for vid_match_players_number
-- ----------------------------
DROP TABLE IF EXISTS `vid_match_players_number`;
CREATE TABLE `vid_match_players_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vid_match_players_number
-- ----------------------------
INSERT INTO `vid_match_players_number` VALUES ('8', '4', '26', '97');
INSERT INTO `vid_match_players_number` VALUES ('9', '3', '41', '91');
INSERT INTO `vid_match_players_number` VALUES ('10', '3', '29', '11');
INSERT INTO `vid_match_players_number` VALUES ('11', '3', '20', '21');
INSERT INTO `vid_match_players_number` VALUES ('12', '3', '19', '25');
INSERT INTO `vid_match_players_number` VALUES ('13', '3', '18', '22');
INSERT INTO `vid_match_players_number` VALUES ('14', '1', '29', '51');
INSERT INTO `vid_match_players_number` VALUES ('15', '4', '38', '21');
INSERT INTO `vid_match_players_number` VALUES ('16', '1', '42', '1');

-- ----------------------------
-- Table structure for vid_matchs
-- ----------------------------
DROP TABLE IF EXISTS `vid_matchs`;
CREATE TABLE `vid_matchs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team1_id` int(11) DEFAULT NULL,
  `team2_id` int(11) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `video_src` varchar(255) DEFAULT NULL,
  `status_end` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `tema_id` (`team1_id`),
  KEY `team_id_2` (`team2_id`),
  CONSTRAINT `team_id_2` FOREIGN KEY (`team2_id`) REFERENCES `vid_teams` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tema_id` FOREIGN KEY (`team1_id`) REFERENCES `vid_teams` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vid_matchs
-- ----------------------------
INSERT INTO `vid_matchs` VALUES ('1', '1', '2', '22/11/2017', '/videos/test.mp4', 'Y');
INSERT INTO `vid_matchs` VALUES ('2', '2', '1', '28/04/2016', 'http://cdn-qa.mycoachfootball.com/videos/70c0c86d-c35f-4105-823c-91aa84d3c22d.mp4', 'N');
INSERT INTO `vid_matchs` VALUES ('3', '1', '2', '29/01/2015', '/videos/test.mp4', 'Y');
INSERT INTO `vid_matchs` VALUES ('4', '2', '1', '18/05/2017', '/videos/test.mp4', 'N');

-- ----------------------------
-- Table structure for vid_player_positions
-- ----------------------------
DROP TABLE IF EXISTS `vid_player_positions`;
CREATE TABLE `vid_player_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `player_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_playrt_id` (`player_id`),
  KEY `fk_match_id` (`match_id`),
  CONSTRAINT `fk_match_id` FOREIGN KEY (`match_id`) REFERENCES `vid_matchs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_playrt_id` FOREIGN KEY (`player_id`) REFERENCES `vid_players` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10635 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vid_player_positions
-- ----------------------------
INSERT INTO `vid_player_positions` VALUES ('10401', '2', '1', '3');
INSERT INTO `vid_player_positions` VALUES ('10402', '2', '20', '6');
INSERT INTO `vid_player_positions` VALUES ('10403', '2', '2', '7');
INSERT INTO `vid_player_positions` VALUES ('10404', '2', '13', '9');
INSERT INTO `vid_player_positions` VALUES ('10405', '2', '11', '10');
INSERT INTO `vid_player_positions` VALUES ('10406', '2', '3', '12');
INSERT INTO `vid_player_positions` VALUES ('10407', '2', '7', '13');
INSERT INTO `vid_player_positions` VALUES ('10408', '2', '6', '14');
INSERT INTO `vid_player_positions` VALUES ('10409', '2', '10', '17');
INSERT INTO `vid_player_positions` VALUES ('10410', '2', '8', '18');
INSERT INTO `vid_player_positions` VALUES ('10411', '2', '9', '19');
INSERT INTO `vid_player_positions` VALUES ('10412', '2', '42', '22');
INSERT INTO `vid_player_positions` VALUES ('10413', '2', '41', '23');
INSERT INTO `vid_player_positions` VALUES ('10414', '2', '40', '24');
INSERT INTO `vid_player_positions` VALUES ('10415', '2', '29', '27');
INSERT INTO `vid_player_positions` VALUES ('10416', '2', '33', '28');
INSERT INTO `vid_player_positions` VALUES ('10417', '2', '34', '29');
INSERT INTO `vid_player_positions` VALUES ('10418', '2', '38', '31');
INSERT INTO `vid_player_positions` VALUES ('10419', '2', '35', '32');
INSERT INTO `vid_player_positions` VALUES ('10420', '2', '30', '34');
INSERT INTO `vid_player_positions` VALUES ('10421', '2', '31', '35');
INSERT INTO `vid_player_positions` VALUES ('10422', '2', '23', '38');
INSERT INTO `vid_player_positions` VALUES ('10569', '1', '1', '3');
INSERT INTO `vid_player_positions` VALUES ('10570', '1', '20', '6');
INSERT INTO `vid_player_positions` VALUES ('10571', '1', '2', '7');
INSERT INTO `vid_player_positions` VALUES ('10572', '1', '13', '9');
INSERT INTO `vid_player_positions` VALUES ('10573', '1', '11', '10');
INSERT INTO `vid_player_positions` VALUES ('10574', '1', '3', '11');
INSERT INTO `vid_player_positions` VALUES ('10575', '1', '7', '13');
INSERT INTO `vid_player_positions` VALUES ('10576', '1', '6', '15');
INSERT INTO `vid_player_positions` VALUES ('10577', '1', '10', '17');
INSERT INTO `vid_player_positions` VALUES ('10578', '1', '8', '18');
INSERT INTO `vid_player_positions` VALUES ('10579', '1', '9', '19');
INSERT INTO `vid_player_positions` VALUES ('10580', '1', '42', '22');
INSERT INTO `vid_player_positions` VALUES ('10581', '1', '41', '23');
INSERT INTO `vid_player_positions` VALUES ('10582', '1', '40', '24');
INSERT INTO `vid_player_positions` VALUES ('10583', '1', '29', '27');
INSERT INTO `vid_player_positions` VALUES ('10584', '1', '33', '28');
INSERT INTO `vid_player_positions` VALUES ('10585', '1', '34', '29');
INSERT INTO `vid_player_positions` VALUES ('10586', '1', '38', '31');
INSERT INTO `vid_player_positions` VALUES ('10587', '1', '35', '32');
INSERT INTO `vid_player_positions` VALUES ('10588', '1', '30', '34');
INSERT INTO `vid_player_positions` VALUES ('10589', '1', '31', '35');
INSERT INTO `vid_player_positions` VALUES ('10590', '1', '23', '38');
INSERT INTO `vid_player_positions` VALUES ('10591', '3', '1', '3');
INSERT INTO `vid_player_positions` VALUES ('10592', '3', '20', '6');
INSERT INTO `vid_player_positions` VALUES ('10593', '3', '2', '7');
INSERT INTO `vid_player_positions` VALUES ('10594', '3', '13', '9');
INSERT INTO `vid_player_positions` VALUES ('10595', '3', '11', '10');
INSERT INTO `vid_player_positions` VALUES ('10596', '3', '3', '12');
INSERT INTO `vid_player_positions` VALUES ('10597', '3', '7', '13');
INSERT INTO `vid_player_positions` VALUES ('10598', '3', '6', '14');
INSERT INTO `vid_player_positions` VALUES ('10599', '3', '10', '17');
INSERT INTO `vid_player_positions` VALUES ('10600', '3', '8', '18');
INSERT INTO `vid_player_positions` VALUES ('10601', '3', '9', '19');
INSERT INTO `vid_player_positions` VALUES ('10602', '3', '42', '22');
INSERT INTO `vid_player_positions` VALUES ('10603', '3', '41', '23');
INSERT INTO `vid_player_positions` VALUES ('10604', '3', '40', '24');
INSERT INTO `vid_player_positions` VALUES ('10605', '3', '29', '27');
INSERT INTO `vid_player_positions` VALUES ('10606', '3', '33', '28');
INSERT INTO `vid_player_positions` VALUES ('10607', '3', '34', '29');
INSERT INTO `vid_player_positions` VALUES ('10608', '3', '38', '31');
INSERT INTO `vid_player_positions` VALUES ('10609', '3', '35', '32');
INSERT INTO `vid_player_positions` VALUES ('10610', '3', '30', '34');
INSERT INTO `vid_player_positions` VALUES ('10611', '3', '31', '35');
INSERT INTO `vid_player_positions` VALUES ('10612', '3', '23', '38');
INSERT INTO `vid_player_positions` VALUES ('10613', '4', '1', '3');
INSERT INTO `vid_player_positions` VALUES ('10614', '4', '2', '7');
INSERT INTO `vid_player_positions` VALUES ('10615', '4', '13', '9');
INSERT INTO `vid_player_positions` VALUES ('10616', '4', '11', '10');
INSERT INTO `vid_player_positions` VALUES ('10617', '4', '20', '11');
INSERT INTO `vid_player_positions` VALUES ('10618', '4', '3', '12');
INSERT INTO `vid_player_positions` VALUES ('10619', '4', '7', '13');
INSERT INTO `vid_player_positions` VALUES ('10620', '4', '6', '14');
INSERT INTO `vid_player_positions` VALUES ('10621', '4', '10', '17');
INSERT INTO `vid_player_positions` VALUES ('10622', '4', '8', '18');
INSERT INTO `vid_player_positions` VALUES ('10623', '4', '9', '19');
INSERT INTO `vid_player_positions` VALUES ('10624', '4', '42', '22');
INSERT INTO `vid_player_positions` VALUES ('10625', '4', '41', '23');
INSERT INTO `vid_player_positions` VALUES ('10626', '4', '40', '24');
INSERT INTO `vid_player_positions` VALUES ('10627', '4', '29', '27');
INSERT INTO `vid_player_positions` VALUES ('10628', '4', '33', '28');
INSERT INTO `vid_player_positions` VALUES ('10629', '4', '34', '29');
INSERT INTO `vid_player_positions` VALUES ('10630', '4', '38', '31');
INSERT INTO `vid_player_positions` VALUES ('10631', '4', '27', '32');
INSERT INTO `vid_player_positions` VALUES ('10632', '4', '30', '34');
INSERT INTO `vid_player_positions` VALUES ('10633', '4', '31', '35');
INSERT INTO `vid_player_positions` VALUES ('10634', '4', '23', '38');

-- ----------------------------
-- Table structure for vid_players
-- ----------------------------
DROP TABLE IF EXISTS `vid_players`;
CREATE TABLE `vid_players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(255) DEFAULT NULL,
  `player_number` int(11) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id_teams` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vid_players
-- ----------------------------
INSERT INTO `vid_players` VALUES ('1', 'Ter Stegen', '1', '2');
INSERT INTO `vid_players` VALUES ('2', 'Piqué', '3', '2');
INSERT INTO `vid_players` VALUES ('3', 'I. Rakitic', '4', '2');
INSERT INTO `vid_players` VALUES ('4', 'Sergio', '5', '2');
INSERT INTO `vid_players` VALUES ('5', 'Denis Suárez', '6', '2');
INSERT INTO `vid_players` VALUES ('6', 'Arda', '7', '2');
INSERT INTO `vid_players` VALUES ('7', 'A. Iniesta', '8', '2');
INSERT INTO `vid_players` VALUES ('8', 'Suárez', '9', '2');
INSERT INTO `vid_players` VALUES ('9', 'Messi', '10', '2');
INSERT INTO `vid_players` VALUES ('10', 'Neymar', '11', '2');
INSERT INTO `vid_players` VALUES ('11', 'Rafinha', '12', '2');
INSERT INTO `vid_players` VALUES ('12', 'Cillessen', '13', '2');
INSERT INTO `vid_players` VALUES ('13', 'Mascherano', '14', '2');
INSERT INTO `vid_players` VALUES ('14', 'Paco Alcácer', '17', '2');
INSERT INTO `vid_players` VALUES ('15', 'Jordi Alba', '18', '2');
INSERT INTO `vid_players` VALUES ('16', 'Digne', '19', '2');
INSERT INTO `vid_players` VALUES ('17', 'Sergi Roberto', '20', '2');
INSERT INTO `vid_players` VALUES ('18', 'André Gomes', '21', '2');
INSERT INTO `vid_players` VALUES ('19', 'Aleix Vidal', '22', '2');
INSERT INTO `vid_players` VALUES ('20', 'Umtiti', '23', '2');
INSERT INTO `vid_players` VALUES ('21', 'Mathieu', '24', '2');
INSERT INTO `vid_players` VALUES ('22', 'Masip', '25', '2');
INSERT INTO `vid_players` VALUES ('23', 'KEYLOR NAVAS ', '1', '1');
INSERT INTO `vid_players` VALUES ('24', 'K. CASILLA ', '13', '1');
INSERT INTO `vid_players` VALUES ('25', 'RUBÉN YÁÑEZ ', '25', '1');
INSERT INTO `vid_players` VALUES ('26', 'CARVAJAL ', '2', '1');
INSERT INTO `vid_players` VALUES ('27', 'PEPE ', '3', '1');
INSERT INTO `vid_players` VALUES ('28', 'SERGIO RAMOS ', '4', '1');
INSERT INTO `vid_players` VALUES ('29', 'VARANE ', '5', '1');
INSERT INTO `vid_players` VALUES ('30', 'NACHO ', '6', '1');
INSERT INTO `vid_players` VALUES ('31', 'MARCELO ', '12', '1');
INSERT INTO `vid_players` VALUES ('32', 'COENTRÃO', '15', '1');
INSERT INTO `vid_players` VALUES ('33', 'KROOS ', '8', '1');
INSERT INTO `vid_players` VALUES ('34', 'JAMES RODRÍGUEZ ', '10', '1');
INSERT INTO `vid_players` VALUES ('35', 'CASEMIRO ', '14', '1');
INSERT INTO `vid_players` VALUES ('36', 'KOVACIC ', '16', '1');
INSERT INTO `vid_players` VALUES ('37', 'MODRIC ', '19', '1');
INSERT INTO `vid_players` VALUES ('38', 'ASENSIO ', '20', '1');
INSERT INTO `vid_players` VALUES ('39', 'ISCO ', '22', '1');
INSERT INTO `vid_players` VALUES ('40', 'RONALDO', '7', '1');
INSERT INTO `vid_players` VALUES ('41', 'BENZEMA', '9', '1');
INSERT INTO `vid_players` VALUES ('42', 'BALE', '11', '1');
INSERT INTO `vid_players` VALUES ('43', 'LUCAS VÁZQUEZ', '17', '1');
INSERT INTO `vid_players` VALUES ('44', 'MARIANO', '18', '1');
INSERT INTO `vid_players` VALUES ('45', 'MORATA', '21', '1');
INSERT INTO `vid_players` VALUES ('100', 'unknow_player_t1', '0', '0');
INSERT INTO `vid_players` VALUES ('101', 'unknow_player_t2', '0', '0');

-- ----------------------------
-- Table structure for vid_teams
-- ----------------------------
DROP TABLE IF EXISTS `vid_teams`;
CREATE TABLE `vid_teams` (
  `id` int(11) NOT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vid_teams
-- ----------------------------
INSERT INTO `vid_teams` VALUES ('1', 'Real Madrid CF');
INSERT INTO `vid_teams` VALUES ('2', 'FC Barcelona');
SET FOREIGN_KEY_CHECKS=1;
