-- 9. Tìm khách hàng có tổng giá trị đơn hàng cao nhất
select c.customer_name, sum(o.total_amount)
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_name
having sum(o.total_amount) = (
select max(total) from (
select c.customer_name, sum(o.total_amount) as total
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_name));

-- 10. Liệt kê sản phẩm chưa từng được bán
select * from products
where product_id not in (
select distinct product_id from order_items
);

-- 11. Tìm khách hàng có đơn hàng đầu tiên trong tháng hiện tại
select distinct c.customer_id, c.customer_name, o.order_date
from customers c join orders o on c.customer_id = o.customer_id
where o.order_date = (
select min(o2.order_date)
from orders o2
where o2.customer_id = c.customer_id
) and extract(month from o.order_date) = extract(month from current_date);

-- 12. Liệt kê sản phẩm có giá cao hơn giá trung bình của danh mục đó
select * from products p
where p.price > (
select avg(price) from products
where category = p.category
);
