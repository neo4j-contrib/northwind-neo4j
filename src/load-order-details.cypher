// NORTHWIND - load order details
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/order-details.csv" AS row
CREATE (c:OrderDetail)
SET c = row,
    c.OrderID = toInt(row.OrderID),
    c.ProductID = toInt(row.ProductID),
    c.UnitPrice = toFloat(row.UnitPrice),
    c.Quantity = toInt(row.Quantity),
    c.Discount = toFloat(row.Discount)
