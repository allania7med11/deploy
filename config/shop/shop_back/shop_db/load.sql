DROP DATABASE IF EXISTS shop_db;
CREATE DATABASE shop_db;
\c shop_db;
\i ./config/shop/shop_back/shop_db/shop_db_init.sql;