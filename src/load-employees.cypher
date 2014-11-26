// NORTHWIND - load employees
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/neo4j-contrib/northwind-neo4j/master/original/employees.csv" AS row
CREATE (c:Person:Employee)
SET c = row, 
    c.EmployeeID = toInt(row.EmployeeID), 
    c.ReportsTo = toInt(row.ReportsTo)
