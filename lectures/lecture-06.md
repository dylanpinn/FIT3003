# Lecture 6: ETL and Data Quality

## Agenda

1. The extract, transform, and load (ETL) process in data warehousing.
2. Data quality for data warehousing.

## The ETL Process

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8jset4cymj30jf0fytbj.jpg)

### The Many Flavours of ETL

- ETL - Extract, Transform, Load
- ELT - Extract, Load, Transform
- EII - Enterprise Information Integration
- ELTL - Extract, Load, Transform, Load
- All fundamentally do the same thing:
  - **extract** data from various source systems;
  - **transform** the data as required, fixing data quality and data structure
    issues, and;
  - **load** the data into the data warehouse database.

### Why is it Important?

- ETL design, development and maintenance can be up to 70% of the DW project
  time and budget.
- ETL tools are a major software market segment.
  - US\$1.67 billion in 2011
  - Increasing yearly
- The most challenging technical component of the DW development and operations.

### Evolution of ETL Tools

- Hand-coded Scripts and Applications
  - Perl, PL/SQL, C, C++
- Frameworks
  - Essentially re-usable scripts and libraries.
- Code Generators
  - e.g. Warehouse Bailer, Talend
- Data Integration Engines
  - Pentaho Data Integration (Kettle), informatica, Microsoft's SQL Server
    Integration Services (SSIS).
- Model-driven Architectures
  - e.g. Kalido, Wherescape Red, Mist / BIML.

### ETL Planning and Design Process

#### Requirements and realities issues:

- Business needs
- Compliance requirements
- Data profiling
- Security requirements
- Data latency
- Archiving and lineage
- End user delivery systems
- Development skills
- Management skills
- Software licenses
- Legacy DBMS platforms

#### Architecture Issues:

- Hand-coded vs ETL tool
- Batch versus streaming data flow (real time DW)
- Horizontal vs. vertical task dependency
- Change data capture
- Scheduler automation
- Exception handling
- Quality handling
- Recovery and restart
- Metadata management
- Security

##### Architectural challenges

- Factors affecting the 'batch' window for an ETL process

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8jtjejbbpj30lw0e3go8.jpg)

#### System Implementation Issues

- Hardware
- Software
- Coding practices
- Documentation practices
- Specific quality checks

#### Test & Release Issues

- Development systems
- Test systems
- Production systems
- Handoff procedures
- Update propagation
- System snapshots and rollback
- Performance tuning

## Data Quality for Data Warehouses

### Data Quality

- Data quality is a critical issue in data warehousing.
- Data sourcing and cleansing is the largest task in most data warehousing
  projects and key function of the ETL process.
- Data quality is defined as "fitness for purpose" or the degree to which the
  data is useful to a decision maker.

### Source System Data Quality

- Legacy systems contain data with significant error rates

> "Between 1 and 10 percent of data in critical organisational databases are
> estimated to be inaccurate" Klein, Goodhue and Davis (1996).

> "Huge databases are mined to find sales prospects.. Just one problem. Those
> huge databases may be full of junk" Wall Street Journal (1992).

### Examples of Poor Data Quality

- 96,000 tax refund cheques in the US in 1992 were undeliverable to due bad
  addresses.
- 1 in 6 voters on the US electoral roll is either dead or their address is
  wrong.

### Results of Poor Data Quality

- Poor quality work
- Bad decisions
- Cost of corrective action to take to recover from a bad decision
- Time take to check poor quality data
- Hunting for extra data to check quality
- Work to be redone
- Loss of customers
- Brand damage
- Missed business opportunities
- Miscommunication with important stakeholders

### What is Data Quality?

> "Data quality is the measure of agreement between the data values presented by
> a [data warehouse] and the same data in the real world" Adapted from Orr
> (1996)

- Data quality in the data warehouse is a function of its use.

### Motivating Factors for Data Quality

- Improved decision making
- Raising product and service quality
- Reducing risks
- Reducing major clean ups

### Key Issues in Data Cleansing

- Identity integrity
- Population integrity
- Referential integrity
- Synchronisation issues
- Black-flush issues

#### Identity Integrity

- Does the data which has been sourced actually describe the information the
  user wants?
- For example, a user wants sales volume, but "sales volume" in the legacy
  system was adjusted for returns and stated in retail dollars.
- The analyst must investigate and rectify problems of identity integrity.

#### Population Integrity

- Although the data is appropriate to the user's needs, it is inaccurate or
  incorrectly stored in legacy systems.
- Common problems are
  - Data format problems
    - Either fix or delete
  - Incomplete sets of data
    - Merge many files and/or reconcile deficiencies with needs of new system.

#### Referential Integrity

- The integrity of a given data element in relation to other data elements
  - Utilisation integrity
    - Conversion or reformat required (e.g. numbers to 2 decimal places or
      rounded to whole numbers)
  - Population standardisation
    - Values stored are accurate but in different format (e.g. state is "Vic" or
      "Victoria")
  - Interfile standardisation
    - Check that data in different files has referential integrity.

#### Synchronisation Issues

- Key synchronisation
  - Redundant identification
    - Several keys might be used in a system to identity customers.
  - Keys reflecting hierarchies are error prone as hierarchies change frequently
  - Cross-system alignment
    - Different systems use different key structures
- Timing and history issues
  - Need to synchronise data coming from different systems with different timing
    characteristics.

#### Back-Flush Issues

- Back-flush is the use of cleansed data from the data warehouse to be loaded
  back into the legacy systems.
- Steps in the back-flush process are:
  - Identity back-flush requirements
    - Responsibility of the people responsible for legacy systems
  - Develop back-flush mechanisms
    - Same issues as loading data warehouse: timing, synchronisation, keys...

### Fix the Source Systems

- Fixing data quality in the ETL process is OK and helps but is not the best or
  most efficient approach
  - Fixing the source systems is best.
- ...But it is not easy
  - Re-development
    - Optional data fields, data validation
  - Organisational culture
    - Data entry staff are often paid per entry not per correct entry
  - Organisational finances
    - Funding available for the data warehouse cannot be diverted to fixing
      source system because source system is not in scope, despite it being the
      better place to fix the problem.

### Data Quality Dimensions

Data quality may be understood by defining a number of quality dimensions

- Correctness
- Completeness
- Precision
- Timeliness
- Usability
- Comprehensibility

#### Correctness

The data item captured in the data warehouse reflects the real world state it is
intended to represent.

#### Completeness

- When **all** real-world states that one wishes to model are captured in the
  data warehouse
- When **all** values for a certain data element are recorded

#### Precision

- A single state of the data warehouse should map onto a single state in the
  real world.
- Problems occur when multiple real-world states are mapped to a single data
  warehouse state
  - a special case of ambiguity

#### Timeliness

- When the recorded values are not out of date
- Currency
  - Age of data
- Volatility
  - The rate at which data becomes obsolete

#### Usability

- the usefulness of data for the particular application at hand
- Usability will be relative to the application at hand and is therefore
  subjective

#### Comprehensibility

- The ease with which users of the data can comprehend its meaning
- Comprehensibility will be relative to the users world-view and background
  knowledge

## Data Quality

Data quality becomes dependent on attributes of the user, rather than attributes
of the data.

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8jy0wfxi5j30su04s0ta.jpg)

### Improving Data Quality

- Cleanse 100%
  - Is this possible?
- Use a risk management approach
- Develop techniques for dealing with imperfect data

### Data Quality Management

> "Data quality management involves the specification of policies,
> identification of techniques, and the use of procedures to ensure that the
> organisational data resources posses a level of quality commensurate with the
> various current of potential uses of the data." Ballou and Tayi (1996)

- Information gathering
- Analysis of the impact of data deficiencies
- Ascertain the nature of the data deficiencies
- Determine the appropriate level of data quality
- Choose procedures to ensure data quality
- Select data quality enhancement projects

### Why is Ensuring Data Quality Difficult?

- Inadequate documentation of data,
- PLUS:
  - Uncertainty regarding what constitutes the data resource
  - Perceived lack of importance
  - Multiplicity of potential problems with data
  - Uncertainty regarding the seriousness of deficiencies

### Tools for Data Quality

- Various tools are available to support data sourcing and cleansing
  - Prism
  - Microsoft Data Quality Services
- These typically support transformation from various file formats and some data
  validation
- But they can't do lots of things,...
  - Know where somebody lives, what their name is, etc.
- DM tools often turn up common, already understood patterns.
  - Can be used, through, to identify exceptions to the patterns
  - Outliers are probable candidates for data quality errors

## Summary

- Extract, Transform and Lead (ETL)
  - The process of moving data from source system, preparing it for and loading
    into a data warehouse.
  - ETL is the most significant and complex part of a data warehouse project.
- Data Quality
  - Data quality is defined as the degree to which the data is useful to a
    decision maker.
  - Objective and subjective dimensions of quality shows that data quality
    depends on the user of the task.
  - Data quality management is an ongoing process not a one-off project.
