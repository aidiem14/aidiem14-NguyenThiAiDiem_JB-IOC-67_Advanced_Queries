-- 13. Hiển thị thông tin đơn hàng kèm tên khách hàng và email
select o.order_id, c.customer_name, c.email, o.total_amount
from orders o join customers c on o.customer_id = c.customer_id;

-- 14. Liệt kê tất cả khách hàng và số đơn hàng của họ
select c.customer_name, count(o.order_id) as order_count
from customers c left join orders o on c.customer_id = o.customer_id
group by c.customer_name;

-- 15. Hiển thị tất cả sản phẩm và số lượng đã bán
select p.product_name, coalesce(sum(oi.quantity),0) as total_sold
from products p left join order_items oi on p.product_id = oi.product_id
group by p.product_name;

-- 16. Liệt kê tất cả danh mục và số sản phẩm trong mỗi danh mục
select c.category_name, count(p.product_id) as total_products
from categories c left join products p on c.category_name = p.category
group by c.category_name;
