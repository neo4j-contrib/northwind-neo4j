// NORTHWIND - load order details
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/order-details.csv" AS row
CREATE (n:OrderDetail)
SET n = row,
    n.OrderID = toInt(row.OrderID),
    n.ProductID = toInt(row.ProductID),
    n.UnitPrice = toFloat(row.UnitPrice),
    n.Quantity = toInt(row.Quantity),
    n.Discount = toFloat(row.Discount)
