// NORTHWIND - relate order details to orders and products
MATCH (o:Order),(p:Product),(od:OrderDetail)
WHERE o.OrderID = od.OrderID 
AND p.ProductID = od.ProductID
MERGE (o)-[:LISTS]->(od)-[:FOR]->(p)
