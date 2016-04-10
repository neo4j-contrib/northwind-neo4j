northwind-neo4j
===============

## `/data`: Initial Load from Relational Database

Table => Graph mapping

|File|Description|Neo4j Representation|
|---|---|---|
|`categories.csv`|product categories|`(:Person:Customer)`|
|`employees.csv`|people who are employees|`(:Person:Employee)`|
|`order-details.csv`|extra detail about an order|`(:OrderDetail)`|
|`orders.csv`|product orders|`(:Order)`|
|`products.csv`|products sold by Northwind|`(:Product)`|
|`territories.csv`|Sales territories|`(:Territory)`|
|`employee-territories.csv`|`JOIN` table of employees to their territories|`(:Employee)-[:SELLS_IN]->(:Territory)`|

## Using the Neo4j Import Tool

Import Tool Considerations

* All files must use the same delimiter
* Files can be repeatedly used for both nodes and relationships.
* Files can be compressed.
* Data can optionally be provided using multiple files
* A header which provides information on the data fields must precede each input
* Fields without corresponding information in the header will not be read.
* UTF-8 encoding is used.
* Indexes are not created during the import. 
* Bulk import is only available for initial seeding of a database.

### Groups

The import tool assumes that node identifiers are unique across node files.
If this isn’t the case then we can define groups. Groups are defined as part of the ID field of node files.
For example, to specify the Person group we would use the field header ID(Person) in our persons node file.
We also need to reference that exact group in our relationships file i.e. `START_ID(Person)` or `END_ID(Person)`.

In this example, the `suppliers.csv` header would be modified to include a *group* for Supplier nodes:

Original Header:

```
supplierID,companyName,contactName,contactTitle,...
```

Modified Header:

```
id:ID(Supplier),companyName,contactName,contactTitle,...
```

### Property Types

Property types for nodes and relationships are set in the header file (e.g. `:int`, `:string`, `:IGNORE, et cetera).
In this example, `supplier.csv` be modified like this:

```
id:ID(Supplier),companyName:String,contactName:String,contactTitle:String,...
```

### Labels

Use the `LABEL` header to provide the labels of each node created by a row.
In this example, one could add a column with header `LABEL` and content `Supplier`, `Product`, or whatever the node labels are.
As the `supplier.csv` file represents nodes that have all the same label, the node label can be declared on the command line.

### Delimiters

Because addresses in particular have many commas, the data would ideally be exported using a non-comma delimiter.
Replace the delimiter in the dataset with something else, like a `TAB`.

### Relationships

Relationship data sources have three mandatory fields:

* `TYPE`: The relationship type to use for the relationship.
* `START_ID`: The id of the start node of the relationship to create.
* `END_ID`: The id of the end node of the relationship to create.

In the case of this dataset, the `products.csv` export from the relational database can be repurposed to build the `(:Supplier)-[:SUPPLIES]->(:Product)` relationships in the graph database. 
Original `products.csv` header:

```
id:ID(Product)	productName:String	supplierID:int	categoryID:int	...
```

Modified `supplies_rels.csv` header:

```
:END_ID(Product)	productName:IGNORE	:START_ID(Supplier)	categoryID:IGNORE	...
```

As every row in the input file is of the same relationship type, the TYPE is set in the console command.
Import Products, Suppliers, and the SUPPLIES relationship between them using the following command:

```
neo4j-import --into northwind-db --ignore-empty-strings --delimiter "TAB" --nodes:Supplier import-tool-data/suppliers.csv --nodes:Product import-tool-data/products.csv --relationships:SUPPLIES
```

The following command imports 

Nodes:

- Supplier
- Product
- Order
- Customer

Relationships:

- SUPPLIES
- PURCHASED
- ORDERS

```
neo4j-import --into northwind-db --ignore-empty-strings --delimiter "TAB" --nodes:Supplier import-tool-data/suppliers.csv --nodes:Product import-tool-data/products.csv --relationships:SUPPLIES import-tool-data/supplies_rels.csv --nodes:Order import-tool-data/orders.csv --nodes:Customer import-tool-data/customers.csv --relationships:PURCHASED import-tool-data/purchased_rels.csv --relationships:ORDERS import-tool-data/order_rels.csv
```
