CREATE DATABASE IF NOT EXISTS Car_rentalDB;

USE  Car_rentalDB;

DROP TABLE IF EXISTS  admins;

CREATE TABLE admins (
  admin_id int(11) NOT NULL AUTO_INCREMENT,
  admin_name varchar(50) NOT NULL,
  contact varchar(11) NOT NULL,
  address varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  admin_password varchar(30) NOT NULL,
 PRIMARY KEY (admin_id)

 );
 
 DROP TABLE IF EXISTS cars ;
 
 CREATE TABLE cars ( 
   car_id int(11) NOT NULL AUTO_INCREMENT,
   car_name varchar(30) NOT NULL,
   car_description varchar(100) NOT NULL,
   car_model_year int(4) NOT NULL,
   car_brand varchar(25) NOT NULL,
   color varchar(15) NOT NULL,
   capacity int(3) NOT NULL,
   plate_number varchar(11) NOT NULL,
   rate float NOT NULL,
   owner_id int(11) NOT NULL,
   car_status int(2) NOT NULL,
   PRIMARY KEY (car_id)
 );
 
 DROP TABLE IF EXISTS cars_images ;
 
CREATE TABLE cars_images (
  image_id int(11) NOT NULL AUTO_INCREMENT,
  image_description varchar(50) NOT NULL,
  car_id int(11) NOT NULL,
  PRIMARY KEY (image_id)
);

 DROP TABLE IF EXISTS cars_review ;

CREATE TABLE cars_review (
  review_id int(11) NOT NULL AUTO_INCREMENT,
  review varchar(100) NOT NULL,
  review_score int(1) NOT NULL,
  car_date date NOT NULL,
  customer_id int(11) NOT NULL,
  car_id int(11) NOT NULL,
  PRIMARY KEY (review_id)
);

 DROP TABLE IF EXISTS customers ;

CREATE TABLE customers (
  customer_id int(11) NOT NULL AUTO_INCREMENT,
  customer_name varchar(50) NOT NULL,
  address varchar(100) NOT NULL,
  contact varchar(11) NOT NULL,
  profile_image blob NOT NULL,
  fb_account varchar(50) NOT NULL,
  username varchar(30) NOT NULL,
  customer_password varchar(30) NOT NULL,
  admin_id int(11) NOT NULL,
  account_status int(1) NOT NULL,
  PRIMARY KEY (customer_id)
);

 DROP TABLE IF EXISTS cars_owners ;
 
 CREATE TABLE cars_owners (
  owner_id int(11) NOT NULL AUTO_INCREMENT,
  owner_name varchar(50) NOT NULL,
  address varchar(100) NOT NULL,
  contact varchar(11) NOT NULL,
  profile_image blob NOT NULL,
  fb_account varchar(50) NOT NULL,
  username varchar(30) NOT NULL,
  owner_password varchar(30) NOT NULL,
  admin_id int(11) NOT NULL,
  account_status int(1) NOT NULL,
  PRIMARY KEY (owner_id)
 );
 
  DROP TABLE IF EXISTS payment ;
  
  CREATE TABLE payment (
  payment_id int(11) NOT NULL AUTO_INCREMENT,
  rental_id int(11) NOT NULL,
  payment_amount float NOT NULL,
  add_charges float NOT NULL,
  payment_date date NOT NULL,
  admin_id int(11) NOT NULL,
  PRIMARY KEY (payment_id)
  );
  
  
  DROP TABLE IF EXISTS rental ;
  
  CREATE TABLE rental (
  rental_id int(11) NOT NULL AUTO_INCREMENT,
  rental_date date NOT NULL,
  rental_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  return_date date NOT NULL,
  owner_id int(11) NOT NULL,
  car_id int(11) NOT NULL,
  customer_id int(11) NOT NULL,
  rental_status int(2) NOT NULL,
  PRIMARY KEY (rental_id)
  );
  
  
  ALTER TABLE cars ADD CONSTRAINT cars_ibfk_1 FOREIGN KEY (owner_id) REFERENCES cars_owners(owner_id) ON DELETE CASCADE;
  ALTER TABLE cars_images ADD CONSTRAINT cars_images_ibfk_1 FOREIGN KEY (car_id) REFERENCES cars(car_id) ON DELETE CASCADE;
  ALTER TABLE cars_review ADD CONSTRAINT cars_reviwe_ibfk_1 FOREIGN KEY (car_id) REFERENCES cars(car_id) ON DELETE CASCADE;
  ALTER TABLE cars_review ADD CONSTRAINT cars_review_ibfk_2 FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;
  ALTER TABLE customers ADD CONSTRAINT customers_ibfk_1 FOREIGN KEY (admin_id) REFERENCES admins(admin_id) ON DELETE CASCADE;
  ALTER TABLE cars_owners ADD CONSTRAINT cars_owners_ibfk_1 FOREIGN KEY (admin_id) REFERENCES admins(admin_id) ON DELETE CASCADE;
  ALTER TABLE payment ADD CONSTRAINT payment_ibfk_1 FOREIGN KEY (admin_id) REFERENCES admins(admin_id) ON DELETE CASCADE;
  ALTER TABLE rental ADD CONSTRAINT rental_ibfk_1 FOREIGN KEY (car_id) REFERENCES cars(car_id) ON DELETE CASCADE;
  ALTER TABLE rental ADD CONSTRAINT rental_ibfk_2 FOREIGN KEY (owner_id) REFERENCES cars_owners(owner_id) ON DELETE CASCADE;
  ALTER TABLE rental ADD CONSTRAINT rental_ibfk_3 FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;