// NORTHWIND - relate employees with reporting
MATCH (a:Employee),(b:Employee)
WHERE b.EmployeeID = a.ReportsTo
MERGE (a)-[:REPORTS_TO]->(b)
