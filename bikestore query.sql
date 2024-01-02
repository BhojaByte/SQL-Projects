select ord.order_id, 
	CONCAT(cust.first_name, ' ' ,cust.last_name) as Customers,
	cust.city,
	cust.state,
	ord.order_date,
	SUM(items.quantity) AS 'Total units',
	SUM(items.list_price * items.quantity ) AS 'Revenue',
	prod.product_name,
	cat.category_name as category,
	store.store_name,
	concat(staff.first_name,' ',staff.last_name) as salesmen

from sales.orders as ord
JOIN sales.customers as cust
on ord.customer_id = cust.customer_id
JOIN sales.order_items as items
ON ord.order_id = items.order_id
JOIN production.products as prod
ON prod.product_id = items.product_id
JOIN production.categories as cat
ON prod.category_id = cat.category_id
Join sales.stores as store
ON store.store_id = ord.store_id
Join sales.staffs as staff
ON staff.store_id = store.store_id

Group by ord.order_id, 
	CONCAT(cust.first_name, ' ' ,cust.last_name),
	cust.city,
	cust.state,
	ord.order_date,
	prod.product_name,
	cat.category_name,
	store.store_name,
	CONCAT(staff.first_name,' ',staff.last_name)