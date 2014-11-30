// NORTHWIND - load employees
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/northwind/data/employees.csv" AS row
CREATE (n:Employee)
SET n = row,
    n.EmployeeID = toInt(row.EmployeeID),
    n.ReportsTo = toInt(row.ReportsTo)
