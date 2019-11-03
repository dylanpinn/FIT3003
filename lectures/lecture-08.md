# Lecture 8: OLAP Query Processing

## Contents

1. Indexing
2. How to process `SEARCH` and `JOIN`
3. Query Trees

## Indexing

- Single-level Indexes
  - Primary Indexes
  - Secondary Indexes
- Multilevel Indexes

### Single-Level Indexes

#### Primary Index

- Defined on an **_ordered_** data file
- The data field is ordered on a **_key field_**
- Includes one index entry _for each block_ in the data field; the index entry
  has the key field value for the **_first record_** in the block, which is
  called the _block anchor_.
- A primary index is a **_nondense_** (sparse) index, since it includes an entry
  for each disk block of the data field and the keys of its anchor record rather
  than for every search value.

#### Secondary Index

- The secondary index may be on a field which is a candidate key and has a
  unique value in every record, or a non-key with duplicate values.
- The index is an ordered file with two field.
  - The first field is of the same data type as some **_non-ordering field_** of
    the data file that is an indexing field.
  - The second field is either a **_block_** pointer or a record pointer.
  - There can be _many_ secondary indexes (and hence, indexing fields) for the
    same field.
- Includes on entry **_for each record_** in the data field; hence, it is a
  _**dense** index_.

### Multi-Level Indexes

- Because a single-level index is an ordered file, we can create a primary index
  _to the index itself_;
  - In this case, the original index file is called the _first-level index_ and
    the index to the index is called the _second-level index_.
- We can repeat the process, creating a third, fourth,..., top level until all
  entries of the _top level_ fit in one disk block.
- A multi-level index can be created for any type of first-level index (primary
  or secondary) as long as the first-level index consists of _more than one_
  disk block.

### Indexes in SQL

- Primary Keys
  - An index is **automatically created**, in order to ensure that no duplicate
    keys are allowed.
- Other Attributes

  - SQL command to create an index is:

    ```SQL
    CREATE INDEX indexname ON tablename(attribute);
    ```

    - For example

      ```SQL
      CREATE INDEX CustLastName_Idx ON CUSTOMER(LastName);
      ```

## How to process `SEARCH` and `JOIN`

A **search** query:

```SQL
SELECT *
FROM Employee
WHERE Name='David';
```

Search Methods for Simple Selection:

- Linear Search:
  - Retrieve every record in the file, and test whether its attribute values
    satisfy the selection condition.
- Binary Search:
  - If the selection condition involves an equality comparison on a key
    attribute on which the file is ordered, binary search (which is more
    efficient than linear search) can be used.
- Index Search:
  - If the selection condition involves an equality comparison on an non-key
    attribute with a clustering index, use the clustering index to retrieve all
    the records satisfying the selection condition.

A **join** query:

```SQL
SELECT *
FROM R,S
WHERE R.a = S.b
```

Methods for implementing joins:

- Nested-join loop (brute force):
  - For each record `t` in `R` (outer loop), retrieve every record `s` from `S`
    (inner loop) and test whether the two records satisfy the join condition
    `t[A] = s[B]`.
- Sort-merge join:
  - If the records of `R` and `S` are _physically sorted (ordered)_ by value of
    the join attributes `A` and `B`, respectively, we can implement the join in
    the most efficient way possible.
  - Both files are scanned in order of the join attributes, matching the records
    that have the same values for `A` and `B`.
  - In this method, the records of each file are scanned only once each for
    matching with the other file - unless both `A` and `B` are non-key
    attributes.
- Hash-join:
  - The records of files `R` and `S` are both hashed to the _same hash file_,
    using the _same hashing function_ on the join attributes `A` of `R` and `B`
    of `S` as hash keys.
  - A single pass through the file with fewer records (say, `R`) hashes its
    records to the hash file buckets.
  - A single pass through the other file (`S`) then hashes each of its record to
    the appropriate bucket, where the record is combined with all matching
    records from `R`.

## Query Trees

- A query (written in SQL) is normally composed of a number of basic operations
  (e.g., search, join, sort, etc.)
- These operations are executed one after another, in a sequential manner
- The order of these operations is represented as a **Query Tree**.
- A node in a query tree is an operation (e.g., perform a read operation on all
  records from table Employee, perform a join operation from the two tables
  indicated by the child nodes).
- Example:

  - For every project located in 'Stafford', retried the project number, the
    controlling department number and the department manager's last name,
    address and birth date.
  - SQL Query:

    ```SQL
    SELECT P.Number, P.Dnum, E.Lname, E.Address, E.Bdate
    FROM Project P, Department D, Employee E
    WHERE P.Dnum = D.Dnumber
      AND D.Mgrssn = E.Ssn
      AND P.Plocation = 'Stafford';
    ```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l40nzwowj30d80avt9t.jpg)

- Example 2:

  ```SQL
  SELECT Lname
  FROM Employee, Works_On, Project
  WHERE Pname = 'AQUARIUS'
    AND Pnumber = Pno
    AND Essn = Ssn
    AND Bdate > '1957-12-31';
  ```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l420324sj30ho0cj0u2.jpg)
