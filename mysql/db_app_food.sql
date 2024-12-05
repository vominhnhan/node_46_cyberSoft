/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `food_type`;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `like_res`;
CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `rate_res`;
CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `sub_food`;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(1, 'Cheeseburger', 'cheeseburger.jpg', 5.99, 'A classic cheeseburger with fresh ingredients', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(2, 'Chocolate Cake', 'chocolate_cake.jpg', 3.99, 'Rich and creamy chocolate dessert', 2);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(3, 'Iced Coffee', 'iced_coffee.jpg', 2.99, 'Refreshing cold coffee', 3);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desc`, `type_id`) VALUES
(4, 'Cheeseburger', 'cheeseburger.jpg', 5.99, 'A classic cheeseburger with fresh ingredients', 1),
(5, 'Chocolate Cake', 'chocolate_cake.jpg', 3.99, 'Rich and creamy chocolate dessert', 2),
(6, 'Iced Coffee', 'iced_coffee.jpg', 2.99, 'Refreshing cold coffee', 3);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Main Course');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Dessert');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Beverage');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Main Course'),
(5, 'Dessert'),
(6, 'Beverage');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2024-11-01 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2024-11-02 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(3, 1, '2024-11-03 00:00:00');
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(6, 2, '2024-11-04 00:00:00'),
(2, 2, '2024-11-05 00:00:00'),
(3, 2, '2024-11-06 00:00:00'),
(4, 2, '2024-11-07 00:00:00'),
(5, 2, '2024-11-08 00:00:00'),
(1, 3, '2024-11-09 00:00:00'),
(2, 3, '2024-11-10 00:00:00'),
(1, 1, '2024-11-01 00:00:00'),
(2, 1, '2024-11-02 00:00:00'),
(3, 1, '2024-11-03 00:00:00'),
(6, 2, '2024-11-04 00:00:00'),
(2, 2, '2024-11-05 00:00:00'),
(3, 2, '2024-11-06 00:00:00'),
(4, 2, '2024-11-07 00:00:00'),
(5, 2, '2024-11-08 00:00:00'),
(1, 3, '2024-11-09 00:00:00'),
(2, 3, '2024-11-10 00:00:00');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORD123', '1');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(2, 2, 1, 'ORD124', '2');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 3, 3, 'ORD125', '3');
INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(3, 2, 3, 'ORD126', '3'),
(2, 3, 2, 'ORD127', '2'),
(3, 2, 1, 'ORD128', '3'),
(3, 1, 4, 'ORD129', '3'),
(1, 1, 2, 'ORD123', '1'),
(2, 2, 1, 'ORD124', '2'),
(3, 3, 3, 'ORD125', '3'),
(3, 2, 3, 'ORD126', '3'),
(2, 3, 2, 'ORD127', '2'),
(3, 2, 1, 'ORD128', '3'),
(3, 1, 4, 'ORD129', '3');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 4, '2024-11-25 15:30:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 2, 5, '2024-11-26 12:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 3, 3, '2024-11-27 18:45:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 4, '2024-11-25 15:30:00'),
(2, 2, 5, '2024-11-26 12:00:00'),
(3, 3, 3, '2024-11-27 18:45:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(1, 'The Food House', 'foodhouse.jpg', 'Cozy place with delicious meals');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(2, 'Gourmet Paradise', 'gourmet.jpg', 'A high-end dining experience');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(3, 'Quick Bites', 'quickbites.jpg', 'Fast food with premium quality');
INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `desc`) VALUES
(4, 'The Food House', 'foodhouse.jpg', 'Cozy place with delicious meals'),
(5, 'Gourmet Paradise', 'gourmet.jpg', 'A high-end dining experience'),
(6, 'Quick Bites', 'quickbites.jpg', 'Fast food with premium quality');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Extra Cheese', 0.99, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Whipped Cream', 0.49, 2);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Caramel Syrup', 0.59, 3);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Extra Cheese', 0.99, 1),
(5, 'Whipped Cream', 0.49, 2),
(6, 'Caramel Syrup', 0.59, 3);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'Alice', 'alice@example.com', 'password1');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Bob', 'bob@example.com', 'password2');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Charlie', 'charlie@example.com', 'password3');
INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'David', 'david@example.com', 'password4'),
(5, 'Eva', 'eva@example.com', 'password5'),
(6, 'Myan', 'myan@example.com', 'password6'),
(7, 'Jack', 'jack@example.com', 'password7'),
(8, 'Sol', 'Sol@example.com', 'password8'),
(9, 'Alice', 'alice@example.com', 'password1'),
(10, 'Bob', 'bob@example.com', 'password2'),
(11, 'Charlie', 'charlie@example.com', 'password3'),
(12, 'David', 'david@example.com', 'password4'),
(13, 'Eva', 'eva@example.com', 'password5'),
(14, 'Myan', 'myan@example.com', 'password6'),
(15, 'Jack', 'jack@example.com', 'password7'),
(16, 'Sol', 'Sol@example.com', 'password8');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;