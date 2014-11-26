// NORTHWIND - load orders
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/orders.csv" AS row
CREATE (c:Order)
SET c = row, 
    c.OrderID = toInt(row.OrderID),
    c.EmployeeID = toInt(row.EmployeeID)
