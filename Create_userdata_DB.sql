CREATE DATABASE IF NOT EXISTS userdata;

USE userdata;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id INT NOT NULL AUTO_INCREMENT,
	username CHAR(12) NOT NULL,
	email VARCHAR(50) NOT NULL,
	password CHAR(12) NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	country VARCHAR(20),
	city VARCHAR(20),
	country_subdivision CHAR(20),
	post_code CHAR(7),
	PRIMARY KEY (user_id)
);

ALTER TABLE users auto_increment=1000;

CREATE TABLE posts(
	post_id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	time_posted DATETIME DEFAULT CURRENT_TIMESTAMP,
	post_content VARCHAR(127),
	PRIMARY KEY (post_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments(
	comment_id int NOT NULL AUTO_INCREMENT,
	user_id int NOT NULL,
	post_id int NOT NULL,
	time_commented DATETIME DEFAULT CURRENT_TIMESTAMP,
	comment_content VARCHAR(127),
	PRIMARY KEY (comment_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (post_id) REFERENCES posts(post_id)
);




