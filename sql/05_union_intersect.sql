-- 17. Gộp danh sách email từ bảng customers và một danh sách email marketing
select email from customers
where city = 'Hà Nội'
union
select email from customers
where city = 'TP.HCM';

-- 18. Tìm khách hàng vừa mua sản phẩm category 'Electronics' vừa mua 'Books'
select c.customer_name from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where p.category = 'Electronics'
intersect
select c.customer_name from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
where p.category = 'Books';

-- 19. So sánh danh sách sản phẩm bán chạy tháng này và tháng trước
select p.product_name, '01/2025' as thang
from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where extract(month from o.order_date) = 1 and extract(year from o.order_date) = 2025
union all
select p.product_name, '02/2025' as thang from products p
join order_items oi on p.product_id = oi.product_id
join orders o on oi.order_id = o.order_id
where extract(month from o.order_date) = 2 and extract(year from o.order_date) = 2025;

-- 20. Tìm khách hàng có ở cả hai thành phố Hà Nội và TP.HCM (giả sử có bảng customer_addresses)
select c.customer_name from customers c
join customer_addresses ca on c.customer_id = ca.customer_id
where ca.city = 'Hà Nội'
intersect
select c.customer_name from customers c
join customer_addresses ca on c.customer_id = ca.customer_id
where ca.city = 'TP.HCM';
