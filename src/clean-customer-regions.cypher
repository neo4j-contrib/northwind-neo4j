// NORTHWIND -- clean customer regions
MATCH (c:Customer) 
WHERE c.Region in ["NULL", "null"]
REMOVE c.Region
