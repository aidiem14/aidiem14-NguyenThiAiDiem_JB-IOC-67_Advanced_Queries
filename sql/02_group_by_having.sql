-- 5. Tìm các khách hàng có từ 3 đơn hàng trở lên
select c.customer_name, count(o.order_id)
from customers c join orders o on c.customer_id = o.customer_id
group by c.customer_name
having count(o.order_id) >= 3;

-- 6. Liệt kê các danh mục có tổng số lượng sản phẩm tồn kho > 100
select category, sum(stock_quantity)
from products group by category having sum(stock_quantity) > 100;

-- 7. Tìm các thành phố có số khách hàng >= 5
select city, sum(customer_id)
from customers group by city having sum(customer_id) >= 5;

-- 8. Liệt kê các sản phẩm có tổng số lượng bán ra > 50
select p.product_name, sum(oi.quantity)
from products p join order_items oi on p.product_id = oi.product_id
group by p.product_name having sum(oi.quantity) > 50;