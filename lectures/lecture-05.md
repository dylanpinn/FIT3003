# Lecture 5 - Dimensional Modelling for Data Warehouses

## Agenda

1. Star Schemas
2. Physical Design Considerations
   1. Heterogeneous facts and dimensions
   2. Mini dimensions
   3. Junk dimensions
   4. Slowly changing dimensions
   5. Aggregate storage and navigation

## Star Schemas

- Each dimension becomes a table
- The 'content' of the cube also becomes a table (called the 'fact' table)
- Each dimension table is related to the fact table with a mandatory
  one-to-optional many relationship.
- The primary keys of the dimension tables becomes a composite primary key of
  the fact table.
- Measures are modelled as attributes on the fact table.
- Members of the dimensions become records in the dimension tables.
  - Attributes of the dimension tables are determined based on the dimensional
    information needed, including hierarchies.

### Example conceptual dimensional model

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hj81w5bkj30pr0f1my5.jpg)

### Corresponding Star Schema

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hj8vsafcj30se0fk76g.jpg)

### Star Schema (with attributes)

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hj9haruej30tb0h9djt.jpg)

### Snowflake schema

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hja2v3j7j30ss0gi3zx.jpg)

### Advantages of Star Schemas

- Much easier for non-technical people to navigate than 3NF ER.
- More efficient too - fewer JOINs, at most one-step.

  ```sql
  SELECT
    Store.StoreName,
    SUM(Sales.Dollar Sales)
  FROM Sales
    JOIN Store on Sales.StoreID = Store.StoreID
  WHERE
    Store.Region = 'Victoria'
  GROUP BY
    Store.StoreName
  ```

## Physical Design Considerations

### Kimball's (1996) steps in the dimensional model design process

1. Choose a business process
2. Choose the grain of the fact table
3. Choose the dimensions
4. Choose the measured facts
   - (usually numeric, additive quantities)
5. Complete the dimension table
6. Determine strategy for slowly changing dimensions
7. Create aggregations and other physical storage components
8. Determine the historical duration of the database
9. Determine the urgency with which the data is to be extracted and loaded into
   the data warehouse

### Heterogeneous products

- Typical situation in banking
- Each account type has a number of facts that aren't associated with other
  account types
  - Savings
    - Interest paid
  - Cheque
    - Overdraft limit
  - Credit cards
    - Credit limit

#### Potential logical schema\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hjhj1664j30gq0gijsx.jpg)

#### Physically - a disaster

- The fact and product tables could each have over 100 fields.
  - Costly in terms of disk space, speed and complexity
- Most fields in most records would be blank
- Kimball's answer is to split the fact and dimension table by product type
- Fact tables will share some dimensions

#### Split Design example\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hjk1zdhbj30qn0hudj3.jpg)

### Mini-Dimensions

- Typically, used for demographics or categories.
- Create a link between dimension tables
- Used to group continuous values into groups
  - e.g. Income, Age, etc.
- Might have more than one
- Provides an extra primary key by which to 'slice' the fact table.

#### Typical demographic mini-dimension\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hjsxdcptj30j40eyjt7.jpg)

#### Mini-Dimensions

- Used to make queries at aggregate levels in a dimension run faster.
- Create overhead and complexity though
  - Only use when users are mostly querying at the aggregate rather than base
    level of a dimension hierarchy
- Works by adding a new primary key attribute to the facts table

#### Use case example

- Imagine a Customer dimension with 10 customers (Customer IDs = 1 to 10), and
  two customer groups: 'high income' and 'low income'.
- Customers 1,3,4,7, and 9 are high income customers, the rest low.

**Without** a Mini-Dimension

```SQL
SELECT
  SUM(Sale.Dollar Sales)
FROM
  SALE
WHERE
  Sale.CustomerID = 1 OR
  Sale.CustomerID = 3 OR
  Sale.CustomerID = 4 OR
  Sale.CustomerID = 7 OR
  Sale.CustomerID = 9
```

**With** a Mini-Dimension

```SQL
SELECT
  SUM(Sale.Dollar Sales)
FROM
  Sale
WHERE
  Sale.CustomerIncomeGroupID = 1
```

### Junk-Dimensions

- A type of dimension that consolidates all the low-cardinality attributes or
  many small dimensions tables into a single dimension table.
- Low-cardinality attributes are attributes with small range of values, such as
  male/female, yes/no, 1/2/3, North/South/East/West etc.
- Therefore, the content of a junk dimension is a Cartesian product of the
  values of all its attributes.

#### Example junk dimension\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hk0cc192j30j40i8q6t.jpg)

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hk1134npj30le0jjgo8.jpg)

### Slowly Changing Dimensions

- Many dimensions (e.g. Customer) evolve slowly over time
  - Humans change names, addresses, etc.
  - Sales forces change names of districts, regions, etc.
- Three standard approaches are:
  - Overwrite old values
  - Create an additional dimension record
  - Create a current value field

#### Type 1: Overwrite

- Simply overwrite attribute values
  - For example: a change in martial status to the customer Mary Jones to
    "married"

Advantage

: Easy to implement

Disadvantage

: Lose history

#### Type 2: New Record

- Create a new dimension table record for each version

Advantage

: Automatically maintains and partitions history

Disadvantage

: More complex than overwrite

#### Type 3: Create a current value field

- Simply create a field called "Current X", e.g.:
  - Current address
  - Old address
- Useful where you want to know the old and new values.

Advantage

: Simple and fast, allows easy comparisons

Disadvantage

: becomes complex with another change, date of change, etc.

#### Choosing a method

- Type 1
  - Very crude. Only use when historical values are of no importance.
- Type 2
  - Generally most flexible. Useful for dimensions with up to hundreds of
    thousands of records, especially with a good DBMS.
- Type 3
  - Not as flexible as Type 2, but can be used for dimensions with millions of
    records.

### Store Pre-Calculated Aggregates and Aggregate Navigation

#### Aggregates

- Most data warehouses have very large fact tables (up to 50 billion records and
  approx 1-5 terabytes).
- Aggregates (pre-calculated summaries) are the most effective way of improving
  data warehouse performance.

#### Storing aggregates

- An aggregate is a fact table record representing a summarisation of base level
  fact table records.
- Aggregate facts reside in either new aggregate fact tables or in the original
  fact table.

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkdhttjwj30dk0avmxl.jpg){width=50%}

##### Single fact table approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkf9rppej30sa0gxgob.jpg)

##### Aggregate Fact Table Approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkg2737cj30s00evacd.jpg)

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkgjlzh3j30s00gpdi1.jpg)

#### Storing Aggregates

- The single fact table approach can lead to double counting in queries
- Aggregate fact tables lead to multiple physical versions of the schema

#### Aggregate Navigation\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkj11vxvj30s60fp0wa.jpg)

- The aggregate navigation automatically transforms the user's base SQL into
  aggregate aware SQL.
- It dynamically selects the best aggregation tables to use.
- It insulates users from the portfolio of aggregations and allows the DBA to
  adjust aggregations.

## Example Star Schema Designs from Kimball

### Example Designs

- A useful way to learn about data warehouse design principles is by using
  examples
- Kimball - Data warehouse lifecycle toolkit
- Adamson & Venerable - Data Warehouse Design Solutions

### Inventory

- An inventory system serves as a "middleman" between the manufacturer and the
  retailer
  - Value adding process
- There are 3 types of inventory model
  - Inventory snapshot
  - Delivery status
  - Transaction

#### Inventory snapshot model

For specific time periods, inventory levels are measured and recorded

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hknydzf2j30n80bzq3v.jpg)

#### Delivery status model

Create one record for each complete shipment of a product to a warehouse

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkotb2krj30ig0f73zq.jpg)

#### Transaction model

Record every transaction that affects the inventory

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkqa9umtj30ig0f73ze.jpg)

### Shipments

- The shipment process is where the product leaves a company and is delivered to
  a customer.
- Typically, accompanying each shipment is a shipment invoice.
- Each line item on the shipment invoice corresponds to an SKU.

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkskr1vmj30ml0fjmyz.jpg)

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkt4vi7cj30ij0fjq5a.jpg)

### Financial services

- Typically a large bank
- Services include
  - cheque accounts, savings accounts, mortgage loans, investment loans,
    personal loans, credit cards, etc.
- Goal
  - to market more effectively to households
- Build a household data warehouse to track accounts, account holders and their
  household groupings.

#### Requirements

- Five years of monthly data for each account.
- For current month must be snapshot as of previous day.
- Group and compare primary balances across accounts.
- Each account type has different attributes and numeric facts.
- Each account belongs to a household.
- Records of account holders names and addresses may differ from account to
  account.
- Interested in demographics and activity in each of the accounts.

#### Process

1. Choose a Business Process

   - Monthly account balances

2. Choose the grain of the fact table

   - Balance of each account by month

3. Choose the dimensions

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hkzoa8frj30iu0fj3zx.jpg){width=50%}

4. Choose the measured facts

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hl18gz1aj30iu0fjgn3.jpg){width=50%}

5. Complete the dimension tables

   ![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8hl3be78oj30iu0fjq57.jpg){width=50%}
