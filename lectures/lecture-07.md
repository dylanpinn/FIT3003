# Lecture 7: OLAP Queries (On-line Analytical Processing)

## Contents

1. OLAP: An Overview
2. OLAP Queries
   1. Basic Aggregate Queries (Revision)
   2. Cube and Rollup
   3. Partial Cube and Partial Rollup
   4. Advanced Analysis

## OLAP

The nature of the new Data Warehouse storage structure requires a tool that
supports the retrieval of large number of records from very large data sets and
summarizes them "on the fly" $\implies$ OLAP (On-line Analytical Processing)
tool.

OLAP (On-line Analytical Processing): Data processing that requires complex
queries which typically involve `group-by` and `aggregate` operations.

## OLAP Queries

### Basic Aggregate Functions

Aggregate operations for computation purposes:

- `COUNT([distinct] A)`: the number of (unique) values in the `A` column.

  ```sql
  SELECT COUNT(DISTINCT Dept) as Num_Depts
  FROM Subject;
  ```

- `SUM([distinct] A)`: the sum of all (unique) values in the `A` column.

  ```sql
  SELECT COUNT(*) as hi_sal, SUM(salary)
  FROM Lecturer
  WHERE Salary > 4500;
  ```

- `AVG([distinct] A)`: the average of all (unique) values in the `A` column.

- `MAX(A)`: the maximum value in the `A` column.

- `MIN(A)`: the minimum value in the `A` column.

Use of `GROUP BY` changes the meaning of queries

```sql
SELECT COUNT(SID)
FROM Enrol;
```

```sql
SELECT Course, COUNT(SID)
FROM Enrol
GROUP BY Course;
```

### Cube and Rollup

1. `CUBE` - Extension to the `GROUP BY` clause to generate information in
   **cross-tabulation format** within a single query.
2. `ROLLUP` - Extension to the `GROUP BY` clause to generate aggregations **at
   increasing levels of granularity** from the most detailed to a grand total.
3. `GROUPING` - To be used in conjunction with `SELECT` statement to **display
   information** about the aggregate levels and the relevant subtotals for each
   aggregate level.

#### `CUBE`: query and output

- `CUBE` gets input in a form of a set of attribute names to be grouped and it
  will produce _subtotals_ for all the possible combinations of the specified
  attributes and the _grand total_.

```SQL
SELECT channel_desc, country_id, SUM(amount_sold) as SALES$
FROM sales, customers, times, channels
WHERE sales.time_id = times.time_id
  AND sales.cust_id = customers.cust_id
  AND sales.channel_id = channels.channel_id
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
  AND times.calendar_month_desc = '2000-09'
  AND country_id IN ('UK', 'US')
GROUP BY CUBE(channel_desc, country_id);
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kt5zirslj30ly09vmyj.jpg)

#### `ROLLUP`: query

- `ROLLUP` gets input in a form of a set of attribute names to be grouped and
  produces subtotals of rolling-up aggregate combinations of the specified
  attributes and the grand total.
- The difference with `CUBE` is that in `ROLLUP` only _rolling up aggregates are
  included_, not all possible combinations.

```SQL
SELECT channel_desc, calendar_month_desc AS calendar,
  country_id AS co, SUM(amount_sold) AS SALES$
FROM sales, customers, times, channels
WHERE sales.time_id = times.time_id
  AND sales.cust_id = customers.cust_id
  AND sales.channel_id = channels.channel_id
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
  AND times.calendar_month_desc IN ('2000-09', '2000-10')
  AND country_id IN ('UK', 'US')
GROUP BY ROLLUP(channel_desc, calendar_month_desc, country_id);
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kt6l66imj30rm0in420.jpg)

#### `GROUPING`: query

- It is important to differentiate the aggregate `NULL` values that appear in
  the output when using `CUBE` or `ROLLUP` as opposed to the `NULL` values when
  data is not recorded. _In the result of `CUBE` or `ROLLUP`, the `NULL` values
  represent **all** aggregate combinations._
- `GROUPING` clause displays information about which rows are subtotal and for
  which level of aggregations. It also shows the difference between subtotal
  values and `NULL` values.
- `GROUPING` appears in the `SELECT` statement list.

```SQL
SELECT channel_desc, calendar_month_desc as calendar,
  country_id as co, SUM(amount_sold) as SALES$,
  GROUPING(channel_desc) as Ch,
  GROUPING(calendar_month_desc) AS Mo,
  GROUPING(country_id) AS Cou
FROM sales, customers, times, channels
WHERE sales.time_id = times.time_id
  AND sales.cust_id = customers.cust_id
  AND sales.channel_id = channels.channel_id
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
  AND times.calendar_month_desc IN ('2000-09', '2000-10')
  AND country_id IN ('UK', 'US')
GROUP BY ROLLUP(channel_desc, calendar_month_desc, country_id);
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktcezon1j30te0hmq65.jpg)

#### `GROUPING` and `DECODE`: query

- `DECODE` can be used to display appropriate titles for the subtotals

```SQL
SELECT
  DECODE(GROUPING(channel_desc), 1, 'All Channels', channel_desc) AS Channel,
  DECODE(GROUPING(country_id), 1, 'All Countries', country_id) AS Country,
  SUM(amount_sold) as SALES$
FROM sales, customers, times, channels
WHERE sales.time_id=times.time_id
  AND sales.cust_id=customers.cust_id
  AND sales.channel_id= channels.channel_id
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
  AND times.calendar_month_desc= '2000-09'
  AND country_id IN ('UK', 'US')
GROUP BY CUBE(channel_desc, country_id);
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kte9ubnhj30te0fvdih.jpg)

### Partial Cube and Partial Rollup

#### Partial `ROLLUP`

Rollup to include only some of the subtotals

```SQL
GROUP BY expr1, ROLLUP(expr2, expr3);
```

- First-level subtotals aggregating across `expr3` for each combination of
  `expr2` and `expr1`.
- Second-level subtotals aggregating across `expr2` and `expr3` for each `expr1`
  value.
- No grant total aggregating across all `expr1`, `expr2`, `expr3`.

```SQL
SELECT channel_desc, calendar_month_desc AS calendar,
  country_id AS co, SUM(amount_sold) AS SALES$
FROM sales, customers, times, channels
WHERE sales.time_id = times.time_id
  AND sales.cust_id = customers.cust_id
  AND sales.channel_id = channels.channel_id
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
  AND times.calendar_month_desc IN ('2000-09', '2000-10')
  AND country_id IN ('UK', 'US')
GROUP BY channel_desc, ROLLUP(calendar_month_desc, country_id);
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktl396t7j30te0jen16.jpg)

#### Partial `CUBE`

Partial `CUBE` resembles partial `ROLLUP` in that you can limit it to certain
dimensions and precede it with columns outside the `CUBE` operator.

In this case, subtotals of all possible combinations are limited to the
dimensions within the cube list (in parentheses), and they are combined with the
proceeding items in the `GROUP BY` list.

```SQL
GROUP BY expr1, CUBE(expr2, expr3);
```

```SQL
SELECT channel_desc, calendar_month_desc AS calendar,
  country_id AS co, SUM(amount_sold) AS SALES$
FROM sales, customers, times, channels
WHERE sales.time_id = times.time_id
  AND sales.cust_id = customers.cust_id
  AND sales.channel_id = channels.channel_id
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
  AND times.calendar_month_desc IN ('2000-09', '2000-10')
  AND country_id IN ('UK', 'US')
GROUP BY channel_desc, CUBE(calendar_month_desc, country_id);
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktoje4hqj30te0kcq6m.jpg)

#### Partial `CUBE` vs. Partial `ROLLUP`\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktpb146wj30te0kcae0.jpg)

### Advanced Analysis

#### `RANK`

Computes the **rank** of a record compares to other records in the dataset based
on the values of a set of measures, for example finding the top three items sold
last year.

```SQL
RANK( ) OVER ([query_partition_clause] order_by_clause)

DENSE_RANK( ) OVER ([query_partition_clause] order_by_clause)
```

The difference between `RANK` and `DENSE_RANK` is that `DENSE_RANK` leaves no
gaps in ranking sequence when there are ties.

The `ORDER BY` clause specifies the measures on which ranking is done and
defines the order in which rows are sorted in each group.

Once the data is sorted, ranks are given to each row starting from 1.

```SQL
SELECT channel_desc,
  SUM(amount_sold) as SALES$,
  RANK() OVER (ORDER BY SUM(amount_sold) ) AS default_rank,
  RANK() OVER (ORDER BY SUM(amount_sold) DESC) AS custom_rank
FROM sales, products, customers, times, channels
WHERE sales.prod_id=products.prod_id
  AND sales.cust_id=customers.cust_id
  AND sales.time_id=times.time_id
  AND sales.channel_id=channels.channel_id
  AND times.calendar_month_desc IN ('2000-09', '2000-10')
  AND country_id='US'
GROUP BY channel_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kttg5vgbj30te08ujsl.jpg)

#### `RANK` vs. `DENSE_RANK`

```SQL
SELECT channel_desc,
  SUM(amount_sold) as SALES$,
  RANK() OVER (ORDER BY SUM(amount_sold) DESC) AS custom_rank
FROM ...
WHERE ...
GROUP BY channel_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktvdi7k8j30te08ujsr.jpg)

```SQL
SELECT channel_desc,
  SUM(amount_sold) as SALES$,
  DENSE_RANK() OVER (ORDER BY SUM(amount_sold) DESC) AS custom_rank
FROM ...
WHERE ...
GROUP BY channel_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktuj5ur9j30te08ujsk.jpg)

#### `RANK` per-group using `PARTITION BY`

The previous example shows `RANK` without partitioning the groups, which is
often used when only **one attribute** is selected to display the ranking.

In cases where we need to display rankings of **multiple attributes**, we will
need to **partition** the aggregate so that appropriate ranking can be displayed
for each of the specified attributes.

When displaying a rank with multiple attributes, we have the option of
displaying one rank on one attribute partitioning only, or to display more than
one ranks based on a number of partitioning.

```SQL
SELECT channel_desc, calendar_month_desc AS calendar,
  TO_CHAR(SUM(amount_sold)) AS SALES$,
  RANK() OVER (PARTITION BY channel_desc
  ORDER BY SUM(amount_sold) DESC) AS RANK_BY_CHANNEL
FROM sales, products, customers, times, channels
WHERE sales.prod_id=products.prod_id
  AND sales.cust_id=customers.cust_id
  AND sales.time_id=times.time_id
  AND sales.channel_id=channels.channel_id AND times.calendar_month_desc
  IN ('2000-08', '2000-09', '2000-10', '2000-11') AND channels.channel_desc
  IN ('Direct Sales', 'Internet')
GROUP BY channel_desc, calendar_month_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ktz6tvh7j30te0fn0us.jpg)

#### `RANK` multiple-groups using `PARTITION BY`

The previous example shows `PARTITION BY` one group only, we can also partition
the ranks into more than one group.

```SQL
SELECT channel_desc, calendar_month_desc AS calendar,
  TO_CHAR(SUM(amount_sold)) AS SALES$,
  RANK() OVER (PARTITION BY channel_desc
  ORDER BY SUM(amount_sold) DESC) AS RANK_BY_CHANNEL,
  RANK() OVER (PARTITION BY calendar_month_desc
  ORDER BY SUM(amount_sold) DESC) AS RANK_BY_MONTH
FROM sales, products, customers, times, channels
WHERE sales.prod_id=products.prod_id
  AND sales.cust_id=customers.cust_id
  AND sales.time_id=times.time_id
  AND sales.channel_id=channels.channel_id
  AND times.calendar_month_desc IN
    ('2000-08', '2000-09', '2000-10', '2000-11')
  AND channels.channel_desc IN ('Direct Sales', 'Internet')
GROUP BY channel_desc, calendar_month_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ku1p9oqrj30tx0edq4v.jpg)

#### Top `N RANKING`

Using the `RANK` function, we can not display **Top N** ranking based on a
certain ranking attribute (where `N` is an integer value, e.g. Top 5).

```SQL
SELECT * FROM
  (SELECT country_id, SUM(amount_sold) as SALES$,
  RANK() OVER (ORDER BY SUM(amount_sold) DESC ) AS
  COUNTRY_RANK
FROM sales,products,customers,times,channels
WHERE sales.prod_id=products.prod_id
  AND sales.cust_id=customers.cust_id
  AND sales.time_id=times.time_id
  AND sales.channel_id=channels.channel_id
  AND times.calendar_month_desc='2000-09'
GROUP BY country_id)
WHERE COUNTRY_RANK <= 5;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8ku455yc0j30pm0cpq3r.jpg)

#### Row Number

The `ROW_NUMBER` function assigns a unique number (sequentially, starting from
1, as defined by `ORDER BY`) to each row within the partition.

```SQL
ROW_NUMBER() OVER ([query_partition_clause] order_by_clause);
```

`ROW_NUMBER` is non-deterministic function, so each tied value could have its
row switched. To ensure deterministic results, you must order on a unique key.

```SQL
SELECT channel_desc, calendar_month_desc AS calendar,
  TO_CHAR(SUM(amount_sold)) AS SALES$,
  ROW_NUMBER() OVER (ORDER BY SUM(amount_sold) DESC) AS ROW_NUMBER
FROM sales, products, customers, times, channels
WHERE sales.prod_id=products.prod_id
  AND sales.cust_id=customers.cust_id
  AND sales.time_id=times.time_id
  AND sales.channel_id=channels.channel_id
  AND times.calendar_month_desc IN ('2000-09', '2000-10')
GROUP BY channel_desc, calendar_month_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kuii1gkdj30qu0gawgk.jpg)

#### Percent Rank

`RANK` and `DENSE_RANK` - Computes the **ranking** of a record, and the rank of
the record is an **integer**. The top rank record is rank 1, the second is rank
2, etc. For example, find the top 3 items sold last year.

`PERCENT_RANK` - Also computes the **ranking** for a record, but in a
**percentage** form. For example, find the top 5% items sold last year.

```SQL
SELECT *
FROM (
  SELECT
    t.time_id AS "Time Period",
    SUM(f.revenue) AS "Revenue"
    PERCENT_RANK() over
      (ORDER BY SUM(f.revenue) DESC) AS "Percent Rank"
  FROM dw.TIME t, dw.charter_fact f
  WHERE t.time_id = f.time_id
  GROUP BY t.time_id
)
WHERE "Percent Rank" < 0.1;
```

![](https://i.loli.net/2019/11/03/TXqayrf59FW3s1j.png)

#### Cumulative and Moving Aggregates

Cumulative Aggregate

: Calculate cumulative values within each window partition.

Moving Aggregate

: Calculate moving aggregate values within each window partition.

##### Cumulative Aggregate

```SQL
SELECT c.cust_id, t.calendar_quarter_desc,
  TO_CHAR (SUM(amount_sold), '9,999,999,999') AS Q_SALES,
  TO_CHAR (SUM(SUM(amount_sold)) OVER
    (ORDER BY c.cust_id, t.calendar_quarter_desc
    ROWS UNBOUNDED PRECEDING),
    '9,999,999,999') AS CUM_SALES
FROM sales s, times t, customers c
WHERE s.time_id=t.time_id
  AND s.cust_id=c.cust_id
  AND t.calendar_year=1999
  AND c.cust_id = 6380
GROUP BY c.cust_id, t.calendar_quarter_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kvke837oj30mc061wf8.jpg)

- The analytic function `SUM` defines, for each row, a window that starts at the
  beginning of the partition (`UNBOUNDED PRECEDING`) and ends, by default, at
  the current row.
- Nested `SUM`s are needed in this example since we are performing a `SUM` over
  a value that itself is a `SUM`.
- Nested aggregations are used very often in analytic aggregate functions.

###### Cumulative Aggregate (with Partition)

```SQL
SELECT c.cust_id, t.calendar_quarter_desc,
  TO_CHAR (SUM(amount_sold), '9,999,999,999') AS Q_SALES,
  TO_CHAR (SUM(SUM(amount_sold)) OVER
    (PARTITION BY c.cust_id
    ORDER BY c.cust_id, t.calendar_quarter_desc
    ROWS UNBOUNDED PRECEDING),
    '9,999,999,999') AS CUM_SALES
FROM sales s, times t, customers c
WHERE s.time_id=t.time_id
  AND s.cust_id=c.cust_id
  AND t.calendar_year=1999
  AND c.cust_id IN (6380, 6510)
GROUP BY c.cust_id, t.calendar_quarter_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kvoj7s34j30mc0780u7.jpg)

#### Moving Aggregate

This example of a time-based window shows, for one customer, the moving average
of sales for the current month and preceding two months.

```SQL
SELECT c.cust_id, t.calendar_quarter_desc,
  TO_CHAR (SUM(amount_sold), '9,999,999,999') AS Q_SALES,
  TO_CHAR (AVG(SUM(amount_sold)) OVER
    (ORDER BY c.cust_id, t.calendar_month_desc
    ROWS 2 PRECEDING),
    '9,999,999,999') AS MOVING_3_MONTH_AVG
FROM sales s, times t, customers c
WHERE s.time_id=t.time_id
  AND s.cust_id=c.cust_id
  AND t.calendar_year=1999
  AND c.cust_id IN (6380)
GROUP BY c.cust_id, t.calendar_month_desc;
```

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8kvqff6m1j30mc0eh0uo.jpg)

- Note that the first two rows for the tree month moving average calculate in
  the output data are based on a **smaller interval size** than specified
  because the window calculation cannot reach past the data retrieved by the
  query.
