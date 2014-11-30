// NORTHWIND - load orders
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/orders.csv" AS row
CREATE (n:Order)
SET n = row,
    n.OrderID = toInt(row.OrderID),
    n.EmployeeID = toInt(row.EmployeeID)
