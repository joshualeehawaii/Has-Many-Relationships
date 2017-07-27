--Drop user and database
 DROP DATABASE IF EXISTS has_many_blogs;
 DROP USER IF EXISTS has_many_user;

--Create a new database named has_many_blogs owned by has_many_user
 CREATE USER has_many_user;
 CREATE DATABASE has_many_blogs WITH OWNER has_many_user;

--Connect to the newly created database
\c has_many_blogs;

--Users
CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  username VARCHAR(90) NOT NULL,
  first_name VARCHAR(90) DEFAULT NULL,
  last_name VARCHAR(90) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);

--Posts
--DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
  id SERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(180) DEFAULT NULL,
  url VARCHAR(510) DEFAULT NULL,
  content TEXT DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  user_id INTEGER NOT NULL REFERENCES users(id)
);

--Comments
--DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
  id SERIAL NOT NULL PRIMARY KEY,
  body VARCHAR(510) DEFAULT NULL,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  user_id INTEGER NOT NULL REFERENCES users(id),
  posts_id INTEGER NOT NULL REFERENCES posts(id)
);

--data fro the tables
\i scripts/blog_data.sql;