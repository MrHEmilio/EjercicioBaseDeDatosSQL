USE classicmodels;

SELECT * FROM offices; -- número de teléfono del empleado que atendió													7;
SELECT * FROM employees; -- Nombre(s) de empleado que atendió															6;
SELECT * FROM payments; -- cantidad pagada																				5;
SELECT * FROM customers; -- Nombre del cliente, número del cliente, nombre y apellido del contacto del cliente.			1;
SELECT * FROM orders; -- órdenes * (excepto el número del cliente)														2;
SELECT * FROM orderdetails; -- código del producto, cantidad, precio unitario, unidades adquiridas						3;
SELECT * FROM products; -- Nombre del producto, línea del producto, descripción, 										4;
SELECT * FROM productlines; -- descripciones textuales																	6


SELECT 
	customers.customerName AS nombre_cliente,
    customers.customerNumber AS numero_cliente,
    customers.contactFirstName AS nombre_contacto,
    customers.contactLastName AS apellido_contacto,
    orders.orderNumber AS numero_orden,
    orders.orderDate AS fecha_orden,
    orders.status AS status_orden,
    products.productName AS nombre_producto,
    orderdetails.quantityOrdered AS cantidad_pedida,
    orderdetails.priceEach AS precio_unitario,
    payments.amount AS cantidad_pagada,
    employees.firstName AS nombre_vendedor,
    employees.lastName AS apellido_vendedor,
    offices.phone AS telefono_vendedor
FROM customers
JOIN orders ON orders.customerNumber = customers.customerNumber
JOIN orderdetails ON orderdetails.orderNumber = orders.orderNumber
JOIN products ON products.productCode = orderdetails.productCode
JOIN payments ON payments.customerNumber = customers.customerNumber
JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN offices ON offices.officeCode = employees.officeCode;

    