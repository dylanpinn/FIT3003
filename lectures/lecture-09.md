# Lecture 9: Data Warehousing Architectures

## Dimensional Modelling

### Conceptual

- Focus on understanding the decision-problem
- Identification of:
  1. Model's fact (subject of analysis)
  2. Dimensions
  3. Measures
  4. Hierarchies
- Lots of different ways to document the conceptual model, e.g., 'Thomesen'
  diagrams.

### Logical

- Star Schemas a common option
  - Directly maps conceptual model to a relational data model schema.
- Tips for Star Schema design:
  - Attributes in dimensions are important for supporting fact table analysis
  - Often add in more attributes that needed just for dimensional hierarchies.

### Physical

- Optimisation of the model for analytical performance.
- Most techniques depend on an understanding of usage patterns
  - Granularity/historical duration decisions
  - Pre-calculating aggregate values
  - Mini-dimensions
  - Slowly changing dimension strategy
  - ETL strategy - how frequently to update the warehouse?

### Dimensional Modelling

- Not all data warehousing practitioners adhere to a dimensional approach.
  Divided opinion in industry.
- Key lesson is pragmatism, don't be ideological
  - This applies to 3NF advocates as well as dimensional advocates
  - Both approaches have been shown to work
  - Success comes from being focused on improving decision support, not
    engineering.
  - **Decision support design requirements exceed all other design
    considerations.**

## Technical Architectures for Data Warehouses

### Data Warehouse Architecture Options

- Major options:
  - Enterprise data warehouse
  - Dependent data mart
  - Independent data mart
  - Federated or 'Bus' architecture

#### Enterprise Data Warehouse

- Single central data source
- Large in scope and often size
- Optimise the extract process
- Maximised the benefits of integration
- Often 3NF ER, but with customised user views to simulate dimensional
  'experience'
  - Difficult to meet the requirements of different user groups
- Projects as EDW often fail

#### Independent Data Mart

- Many small, isolated data warehouses/marts all over the place.
- Usually follow dimensional (star schema) approach
- Lack of integration
  - Data inconsistency
- Duplication of data sourcing
  - Major project cost
- They work! Tend to be successful. But...
  - ...there are medium to long term issues with scalability and integration.

#### Dependent Data Mart

- Subsets of data are taken from enterprise data warehouse and organised to fit
  requirements of a business unit or application.
- Commonly the enterprise DW is in 3NF
- The data marts are de-normalised/star-schema
- In practice hard to get all the data required from enterprise data store
- Very common approach (in theory)

#### Federated Data Mart

- Like independent data marts and that there are lots of them all over the
  place, but, ...
- Shared data staging area
  - Better management of ETL process
- Key is **meta-data management**
- This is Kimball's preference
  - "Bus" architecture

### Confirmed Dimensions

- Common, standardised, master dimensions that are managed once in the extract,
  transform, and load (ETL) system and then reused by multiple fact tables.
- Consistent descriptive attributes across dimensional models.
- Support the ability to drill across and integrate data from multiple business
  processes.
- Reusing conformed dimensions shortens the time-to-market by eliminating
  redundant design and development efforts.

## Modern Data Storage

### Data Lakes

#### Benefits of data lakes

- Ability to handle structured and unstructured data
- Extreme speed in clustering data
- Democratisation of data
- Real-time analytical reporting
- Scalability
- Low cost of ownership

#### Tools for managing data lakes

- **Cloud infrastructure** (like AWS, Azure, Google) - key component of a data
  lake.
- **Apache Hadoop** is an open source file system to handle data ingestion in
  the lake.
- **Apache HBase** is an open source distributed columnar database.
- **Apache Hive** is an open source data warehousing tool for query,
  summarisation and analysis.
- **Apache Pig** executes Hadoop jobs for ETL processing.
- **Apache Spark** is a cluster for computing framework used for processing
  large chunk of data.
- **Talend** is a data integration and quality tool.
- Analytical reporting tools like **Tableau**, **Power BI** and **Oracle
  OBIEE**.

## DW Development Methodologies

### Typical Definition

Methodology

> "A recommended collection of philosophies, phases, procedures, rules,
> techniques, tools, documentation, management and training for developers of
> information systems" (Maddison, 1983)

### What do they do?

They determine:

- The way a project is divided into stages.
- What tasks and activities are to be performed.
- What tools and techniques should be used.
- What the outputs or each task (etc.) are.
- When each task should be performed.
- Who is involved.
- How the project should be managed.

### Key Requirements for DW Methods

- Change management
  - Evolution of user requirements
  - Evolution of technology
  - Evolutionary triggers come from multiple sources, must be captured to
    facilitate adaptation.
- Struck between a rock and a hard place:
  - Evolution in the 'delivery' system (the BI tool) drives evolution in the
    data warehouse.
  - Changes in the source systems also drive evolution.

#### Inmon's (1994) approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8codwv1j30s5093abx.jpg)

- Strengths
  - Integration
  - Iterative
    - Concentration of piece-wise development of architecture
- Weaknesses
  - Difficulty and cost of designing corporate data model.
  - Understanding ER models (in 3NF)
  - Feedback from usage?

#### Ives' (1995) approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8egzlthj30s5093gnm.jpg)

- Strengths
  - Techniques for requirements acquisition
  - Integration
  - Multiple representation techniques
- Weaknesses
  - Complexity and potential high cost
  - Time for completion
  - Adaptability
  - What if the business strategy changes?
  - User feedback?

#### Kimball's (1996) approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8g6cb8cj30s5093gn1.jpg)

- Strengths
  - Dimensional modelling
  - Easily understood
- Weaknesses
  - Integration
  - Mapping from dimensional modelling to legacy systems

#### Kimball, Reeves, Ross and Thornwaite's (1998) approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8hljr89j30s50eigog.jpg)

- Strengths
  - As before +
  - New activities
    - Attention to end user applications
    - Product selection
- Weaknesses
  - As before +
  - Advocate federated or "Bus" architecture
    - Sounds great, they do it, but rarely implemented.
    - This relies on meta-data but that isn't recognised in the explicit
      activities.

#### McFadden's (1996) approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8jvo22xj30s5050ab8.jpg)

- Strengths
  - User participation
  - Focus on data sourcing
- Weaknesses
  - Partitioning large data warehouses
  - No guidelines for physical design

#### Teradata's approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8l3i17tj30uh0g8n1c.jpg)

- Similar to Inmon
- 3NF and corporate model
  - Emphasis on normalisation and standard DBMS.
- Emphasis on architecture
- Used in some very large systems.

#### SAS Institute\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8ml8ws5j30r2095jsm.jpg)

- Employ a time-box technique
  - Rapid data warehousing!
- 3 month (90 day) engagements
  - 2 months of prototyping + 1 month of 'solid' development
  - Start again
- Heavy use of prototyping and workshops with users
- Relies on the abilities of good systems analysts.

#### Microsoft's (1996) approach\

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8l8ohlfm3j30r20es0w2.jpg)

- Strengths
  - Pay attention to user's explicitly
  - But what is this about bugs!
  - Cyclic
  - Relates to a specific set of tools that integrate RDBMS and OLAP
- Weaknesses
  - Relates to a specific set of tools that many don't trust (although this is
    changing)
  - Mapping to source systems

## Summary

- **Data warehousing needs to be pragmatic:**
  - Break the rules of schema design if needed. Key is to ensure **easily
    navigable information structure for end users.**
  - **Decision support requirements are priority.**
  - Avoid the need for users to call the IT department to get access to data.
  - **Mixed approaches** (3NF / Star Schema) are fine they get the job done.
  - Sometimes need to sacrifice methodological purity.
- Technical architectures often match organisational control
  - Decentralised versus centralised.
- Life cycle management is problematic
  - Dynamic nature of the process
- No 'perfect' methodology
- The approaches are maturing as the field matures.
- People are the most important thing to the successful management of the
  process.
