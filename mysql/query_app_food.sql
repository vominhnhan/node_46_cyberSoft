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

