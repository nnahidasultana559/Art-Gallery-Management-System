CREATE TABLE artist
(
  artist_name VARCHAR(100) NOT NULL,
  birth_place VARCHAR(200) NOT NULL,
  artist_id INT NOT NULL,
  style_of_art VARCHAR(1000) NOT NULL,
  age INT NOT NULL,
  about VARCHAR(2000) NOT NULL,
  artist_image VARCHAR(1000) NOT NULL,
  PRIMARY KEY (artist_id)
);

CREATE TABLE gallery
(
  gallery_id INT NOT NULL,
  gallery_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (gallery_id)
);

CREATE TABLE exhibition
(
  exhibition_id INT NOT NULL,
  title VARCHAR(1000) NOT NULL,
  theme VARCHAR(1000) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  start_time VARCHAR(20) NOT NULL,
  end_time VARCHAR(20) NOT NULL,
  e_artist_details VARCHAR(2000) NOT NULL,
  place VARCHAR(200) NOT NULL,
  ticket_price NUMERIC(9,2) NOT NULL,
  gallery_id INT,
  PRIMARY KEY (exhibition_id),
  FOREIGN KEY (gallery_id) REFERENCES gallery(gallery_id)
);

CREATE TABLE users
(
  user_id INT NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  discount NUMERIC(7,2) NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE has
(
  artist_id INT NOT NULL,
  gallery_id INT NOT NULL,
  PRIMARY KEY (artist_id, gallery_id),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
  FOREIGN KEY (gallery_id) REFERENCES gallery(gallery_id)
);

CREATE TABLE customer
(
  cust_id INT NOT NULL,
  F_name VARCHAR(100) NOT NULL,
  L_name VARCHAR(100) NOT NULL,
  address VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  gallery_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (cust_id),
  FOREIGN KEY (gallery_id) REFERENCES gallery(gallery_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE ticket
(
  ticket_id INT NOT NULL,
  name VARCHAR(200) NOT NULL,
  address VARCHAR(500) NOT NULL,
  email VARCHAR(100) NOT NULL,
  ticket_number VARCHAR(100) NOT NULL,
  exp_time VARCHAR(100) NOT NULL,
  price NUMERIC(9,2) NOT NULL,
  quantity INT NOT NULL,
  cust_id INT,
  PRIMARY KEY (ticket_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE payment_module
(
  payment_id INT NOT NULL,
  payment_type VARCHAR(500) NOT NULL,
  products VARCHAR(1000) NOT NULL,
  amount NUMERIC(9,2) NOT NULL,
  payment_date DATE NOT NULL,
  cust_id INT,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE customer_phone
(
  phone INT NOT NULL,
  cust_id INT NOT NULL,
  PRIMARY KEY (phone, cust_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE message
(
  msg_id INT NOT NULL,
  msg_title VARCHAR(1000) NOT NULL,
  msg_body VARCHAR(2000) NOT NULL,
  gallery_id INT,
  cust_id INT,
  PRIMARY KEY (msg_id),
  FOREIGN KEY (gallery_id) REFERENCES gallery(gallery_id),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE cart
(
  product_name VARCHAR(200) NOT NULL,
  product_price NUMERIC(9,2) NOT NULL,
  product_quantity INT NOT NULL,
  product_img VARCHAR(1000) NOT NULL,
  total_price NUMERIC(9,2) NOT NULL,
  cart_item_code INT NOT NULL,
  payment_id INT NOT NULL,
  PRIMARY KEY (cart_item_code),
  FOREIGN KEY (payment_id) REFERENCES payment_module(payment_id)
);

CREATE TABLE art_work
(
  name VARCHAR(200) NOT NULL,
  title VARCHAR(1000) NOT NULL,
  type_of_art VARCHAR(1000) NOT NULL,
  price NUMERIC(9,2) NOT NULL,
  image VARCHAR(1000) NOT NULL,
  art_code INT NOT NULL,
  year_made VARCHAR(100) NOT NULL,
  artist_id INT NOT NULL,
  gallery_id INT NOT NULL,
  cart_item_code INT NOT NULL,
  PRIMARY KEY (art_code),
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
  FOREIGN KEY (gallery_id) REFERENCES gallery(gallery_id),
  FOREIGN KEY (cart_item_code) REFERENCES cart(cart_item_code),
  UNIQUE (title)
);

CREATE TABLE access
(
  art_code INT NOT NULL,
  cust_id INT NOT NULL,
  PRIMARY KEY (art_code, cust_id),
  FOREIGN KEY (art_code) REFERENCES art_work(art_code),
  FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);