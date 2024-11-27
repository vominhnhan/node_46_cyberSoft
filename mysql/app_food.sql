-- DATABASE
CREATE DATABASE IF NOT EXISTS db_app_food;
USE db_app_food;
-- DROP DATABASE db_app_food

-- TABLE users
CREATE TABLE IF NOT EXISTS `user` (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

-- TABLE restaurant
CREATE TABLE IF NOT EXISTS restaurant (
	res_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	`desc` VARCHAR(255)
);

-- TABLE food_type
CREATE TABLE IF NOT EXISTS food_type (
	type_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
);

-- TABLE food
CREATE TABLE IF NOT EXISTS food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    `desc` VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

-- TABLE sub_food
CREATE TABLE IF NOT EXISTS sub_food (
	sub_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	sub_name VARCHAR(255),
	sub_price FLOAT,
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- TABLE order
CREATE TABLE IF NOT EXISTS `order` (
	user_id INT,
	food_id INT,
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255),
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (food_id) REFERENCES food(food_id)
);

-- TABLE like_res
CREATE TABLE IF NOT EXISTS like_res (
	user_id INT,
	res_id INT,
	date_like DATETIME,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- TABLE rate_res
CREATE TABLE IF NOT EXISTS rate_res (
	user_id INT,
	res_id INT,
	amount INT,
	date_rate DATETIME,
	FOREIGN KEY (user_id) REFERENCES `user`(user_id),
	FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- Thêm dữ liệu mẫu cho restaurant
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('The Food House', 'foodhouse.jpg', 'Cozy place with delicious meals'),
('Gourmet Paradise', 'gourmet.jpg', 'A high-end dining experience'),
('Quick Bites', 'quickbites.jpg', 'Fast food with premium quality');

-- Thêm dữ liệu mẫu cho user
INSERT INTO `user` (full_name, email, password) VALUES
('Alice', 'alice@example.com', 'password1'),
('Bob', 'bob@example.com', 'password2'),
('Charlie', 'charlie@example.com', 'password3'),
('David', 'david@example.com', 'password4'),
('Eva', 'eva@example.com', 'password5'),
('Myan', 'myan@example.com', 'password6'),
('Jack', 'jack@example.com', 'password7'),
('Sol', 'Sol@example.com', 'password8');

-- Thêm dữ liệu mẫu cho like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-11-01'),
(2, 1, '2024-11-02'),
(3, 1, '2024-11-03'),
(6, 2, '2024-11-04'),
(2, 2, '2024-11-05'),
(3, 2, '2024-11-06'),
(4, 2, '2024-11-07'),
(5, 2, '2024-11-08'),
(1, 3, '2024-11-09'),
(2, 3, '2024-11-10');

-- Thêm dữ liệu mẫu cho rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 4, '2024-11-25 15:30:00'),
(2, 2, 5, '2024-11-26 12:00:00'),
(3, 3, 3, '2024-11-27 18:45:00');

-- Thêm dữ liệu mẫu cho food_type
INSERT INTO food_type (type_name) VALUES
('Main Course'),
('Dessert'),
('Beverage');

-- Thêm dữ liệu mẫu cho food
INSERT INTO food (food_name, image, price, `desc`, type_id) VALUES
('Cheeseburger', 'cheeseburger.jpg', 5.99, 'A classic cheeseburger with fresh ingredients', 1),
('Chocolate Cake', 'chocolate_cake.jpg', 3.99, 'Rich and creamy chocolate dessert', 2),
('Iced Coffee', 'iced_coffee.jpg', 2.99, 'Refreshing cold coffee', 3);

-- Thêm dữ liệu mẫu cho order
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORD123', '1'),
(2, 2, 1, 'ORD124', '2'),
(3, 3, 3, 'ORD125', '3'),
(3, 2, 3, 'ORD126', '3'),
(2, 3, 2, 'ORD127', '2'),
(3, 2, 1, 'ORD128', '3'),
(3, 1, 4, 'ORD129', '3');

-- Thêm dữ liệu mẫu cho sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 0.99, 1),
('Whipped Cream', 0.49, 2),
('Caramel Syrup', 0.59, 3);


-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT
    `user`.user_id,
    `user`.full_name,
    COUNT(like_res.res_id) AS total_likes
FROM
    like_res
JOIN
    `user` ON like_res.user_id = `user`.user_id
GROUP BY
    user_id, full_name
ORDER BY
    total_likes DESC
LIMIT 5;


-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT
	restaurant.res_id,
	restaurant.res_name,
	COUNT(like_res.res_id) AS total_like_restaurant
FROM
	like_res
JOIN
	restaurant ON like_res.res_id = restaurant.res_id
GROUP BY
	res_id, res_name
ORDER BY
	total_like_restaurant DESC
LIMIT 2;


-- Tìm người đã đặt hàng nhiều nhất
SELECT
	`user`.user_id,
    `user`.full_name,
    COUNT(`order`.food_id) AS total_order
FROM
	`order`
JOIN
	`user` ON `user`.user_id = `order`.user_id
GROUP BY
	user_id, full_name
ORDER BY
	total_order DESC
LIMIT 1;


-- Tìm người dùng không hoạt động trong hệ thống
SELECT
	`user`.user_id,
    `user`.full_name,
    `user`.email
FROM
	`user`
LEFT JOIN
	`order` ON `user`.user_id = `order`.user_id
LEFT JOIN
	like_res ON `user`.user_id = like_res.user_id
LEFT JOIN
	rate_res ON `user`.user_id = rate_res.user_id
WHERE
	`order`.user_id IS NULL
	AND like_res.user_id IS NULL
	AND rate_res.user_id IS NULL;

