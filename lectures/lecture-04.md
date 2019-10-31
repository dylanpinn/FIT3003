---
title: 'FIT3003 - Lecture 4'
subtitle: 'Dimensional Modelling for BI Applications'
---

# Lecture 4: Dimensional Modelling for BI Applications

## Agenda

1. Understanding what a multi-dimension model is
2. Conceptual dimensional modelling with 'Thomsen Diagrams'
3. Data Warehouses

## Multi-Dimensional Modelling: Designing data models for decision support

### What is Multi-Dimensional Data?

- The concept of "Information 'space'"
- The concept of "dimensions"
- An approach to structuring a view of data that provides an easy to understand
  and navigate database
- The aim is to encourage understanding, exploration and learning
- 'Subject'-oriented

### Multi-Dimensionality

- Each number has a set of associated attributes
  - What it measures
  - At what point of time it was created
  - What location it is from
  - What product it is associated with
  - What promotion it is associated with
- Often talk about information spaces as cubes, hyper cubes or n-cubes.

### Dimensional Models

- A one-dimensional informational space:

  ![](https://i.loli.net/2019/10/29/La68xb7gOwK39WB.png)

- A two-dimensional information space:

  ![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyss7xlrj30sg0fe0vf.jpg)

- A three-dimensional information space:

  ![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eytu8p0aj30sg0d7n1h.jpg)

### Extracting Data: Slicing and Dicing

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyudyoy4j30sg0h2n1g.jpg)

### What is a Dimension?

- Different for different parts of the BI system
  - A dimensional data warehouse structure vs. dimensional view presented to
    different users
- Is a design issue
  - They aren't 'natural'
- Should make sense to end users
  - Users understand when they see a detailed report based on dimensions
- Should we even use the term 'dimension' with end users?

## Dimensions, hierarchies and aggregates

### Design Constraints

- The 'Business'
  - The reports that are required
- The 'Data'
  - The data that is available

### Relational to Dimensional: A Mindset Shift

- Standard data modelling
  - Entities
  - Attributes
  - Relationships
  - Cardinalities
- Dimensional modelling
  - Facts
  - Measures
  - Dimensions
  - Members
  - Hierarchies

### Dimensional Hierarchy - example

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyutxl4rj30my0nqwh8.jpg)

### Dimensions with Multiple Hierarchies

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyv42t5yj30sg0g40vc.jpg)

### Dimension Hierarchies

- Vital aspect of the design for 'drill-down'
- Important to identify additive and non-additive facts
- Each level in the hierarchy is an aggregate of the level below
  - Each time data at one level in the hierarchy is shown, the level below has
    to be processed (usually summed).
  - Some tools provide caching, but not all
  - Aggregates can be stored in the data warehouse if designed well.

Option 1

: Calculate aggregates as needed

Option 2

: Pre-calculate aggregates

### Modelling Issues

- Continuous vs. discrete
- Additive, semi-additive and non-additive
- Calculations run across dimensions and can cause conflict.
- Time dimension
  - There is always a time dimension.
  - Multiple hierarchies (e.g. calendar and financial years)
    - Multiple approaches to design.
- Some dimensions are large
  - E.g. a customer dimension for a large Telco - millions of members.
- Dimensions change over time
  - Customer addresses, product code, etc.
  - We cannot update records, only add -> need to cater for changes.
- Dimensions that aren't clean
  - Uneven, jagged, unlevelled.

## Conceptual modelling with Thomsen Diagrams

### Multi-Dimensional Domain Structure

- Each dimension -> a vertical line
  - Each dimension is described independently
- Every member of a dimension -> a unit interval on the line
- A special 'dimension' for the measured facts.
- A multi-dimension model is built by combining the 'lines' for the involved
  dimensions.

### Example Time Dimension

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyvix9w8j309u0nq3zq.jpg){width=50%}

### A Simple Three Dimensional Model

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyvsp7vbj30sg0ft0v3.jpg)

### A Six Dimensional Model

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyw3iq6xj30qu0nqq55.jpg)

### Conceptual Modelling

- Rather than showing every single value you show each type in the hierarchy
- Not easy to show multiple hierarchies

  ![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eywolugoj30f50i8757.jpg){width=25%}

#### An example of conceptual modelling\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyx558ukj30sg0g8goa.jpg)

#### Example of a multiple hierarchy\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8eyxfeu98j30sg0g8wgi.jpg)

## Data Warehouses

- Designed to provide the 'data infrastructure' for business intelligence and
  decision support.

- Lots of different approaches to technology, architecture and design.

### Transaction Processing Systems vs. Data Warehouses

- OLTP (online transaction processing)
  - Data entry, update and deletion
  - High frequency but small volume transactions
  - Usually focussed on one business area
  - Normalised data structures
- DW
  - Data most commonly read
  - Low frequency of transactions, but often large volumes of data
  - Integrates data from systems across multiple business areas
  - Normalised data structures.

## Data Modelling for DW

### The Design of databases using a traditional E-R approach

- Entities and relationships
- Rules of normalisation
  - 3NF is common
  - Protection of integrity of database by avoiding anomalies
  - Every logical thing is represented once only
- Separate consideration logical and physical
  - Normalisation for logical, followed by de-normalisation for the physical
    model to improve performance.

### Traditional database design

- Large numbers of tables
- Commonly used
- Research shows that they are not easily understood by non IT people
- Optimised for efficient data processing: `INSERT`, `UPDATE`, `DELETE` instead
  of `SELECT`
- Complexity hidden form the end user with user interfaces designed around
  workflows/business processes.

## Summary

- Multi-dimensional data structures area. Common and possibly the best way that
  business users interact with data in a BI system.
- Multi-dimensional data is an information space that is defined by its facts
  and dimensions.
- Dimensions consist of members and one or more hierarchies. Dimensions provide
  the navigation paths with the information space.
- Facts consist of one or more measures. A measure is a numeric value exists at
  the intersection of a set of dimension members.
- The design of a multi-dimensional data structure should be based on the
  decision support requirements NOT on what data is available.
- Multi-dimension domain structure (Thomsen) diagrams are one method of
  conceptually presenting the design of multi-dimensional data.
