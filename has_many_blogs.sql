--Drop user and database
 DROP DATABASE IF EXISTS has_many_blogs;
 DROP USER IF EXISTS has_many_user;

--Create a new database named has_many_blogs owned by has_many_user
 CREATE USER has_many_user;
 CREATE DATABASE has_many_blogs;

--Run the provided scripts/car_models.sql script on the indexed_cars database
\c has_many_blogs.sql
\i scripts/blog_data.sql