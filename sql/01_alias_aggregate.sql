-- Liệt kê danh sách sản phẩm với tên sản phẩm được đặt ALIAS là "Tên SP", giá được đặt ALIAS là "Đơn giá"
select product_name as "Tên SP", price as "Đơn giá"
from products;

-- Tính tổng số khách hàng theo từng thành phố
select city, count(customer_id)
from customers group by city;

-- Tìm giá cao nhất, thấp nhất và trung bình của sản phẩm theo từng danh mục
select category, max(price) as "Giá cao nhất", min(price) as "Giá thấp nhất", round(avg(price),2) as "Giá trung bình"
from products group by category;

-- Đếm số đơn hàng theo từng trạng thái
select status, count(order_id) from orders group by status;
