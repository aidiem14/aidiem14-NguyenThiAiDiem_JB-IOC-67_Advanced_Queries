create table customers (
	customer_id serial primary key,
	customer_name varchar(100),
	email varchar(100),
	city varchar(50),
	join_date date
);

create table products (
	product_id serial primary key,
	product_name varchar(100),
	category varchar(50),
	price int,
	stock_quantity int
);

create table orders (
	order_id serial primary key,
	customer_id int references customers(customer_id),
	order_date date,
	total_amount int,
	status varchar(50)
);

create table order_items (
	item_id serial primary key,
	order_id int references orders(order_id),
	product_id int references products(product_id),
	quantity int,
	unit_price int
);

create table categories (
	category_id serial primary key,
	category_name varchar(100),
	description text
);

-- customers
insert into customers (customer_name, email, city, join_date) values
('Nguyễn Văn An', 'an@gmail.com', 'Hà Nội', '2024-01-05'),
('Trần Thị Bình', 'binh@gmail.com', 'TP.HCM', '2024-02-10'),
('Lê Minh Cường', 'cuong@gmail.com', 'Hà Nội', '2024-03-12'),
('Phạm Thu Dung', 'dung@gmail.com', 'Đà Nẵng', '2024-01-20'),
('Hoàng Quốc Huy', 'huy@gmail.com', 'Hà Nội', '2024-04-01');

-- categories
insert into categories (category_name, description) values
('Electronics', 'Thiết bị điện tử'),
('Books', 'Sách'),
('Clothing', 'Thời trang');

-- products
insert into products (product_name, category, price, stock_quantity) values
('Laptop', 'Electronics', 20000000, 30),
('Smartphone', 'Electronics', 15000000, 50),
('SQL Book', 'Books', 300000, 100),
('T-Shirt', 'Clothing', 200000, 80);

-- orders
insert into orders (customer_id, order_date, total_amount, status) values
(1, '2025-01-05', 20300000, 'Completed'),
(2, '2025-01-10', 15000000, 'Completed'),
(1, '2025-02-02', 300000, 'Pending'),
(3, '2025-02-15', 200000, 'Completed');

-- order_items
insert into order_items (order_id, product_id, quantity, unit_price) values
(1, 1, 1, 20000000),
(1, 3, 1, 300000),
(2, 2, 1, 15000000),
(3, 3, 1, 300000),
(4, 4, 1, 200000);