/*
 Source Schema         : tudbaauditar
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `tutablaaauditar`;
CREATE TABLE `tutablaaauditar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campo1` varchar(255) DEFAULT NULL,
  `campo2` varchar(255) DEFAULT NULL,
  `campo3` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1379 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
