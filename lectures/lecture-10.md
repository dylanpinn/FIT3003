# Lecture 10 - Data Warehousing Alternative Architectures

## Alternatives to Dimensional Modelling

### Customer Relationship Management

- Highlights the pragmatic nature of data warehouse schema design
  - Designs shouldn't be driven by an ideological commitment to any one
    approach - 3NF, Dimensional, or any other approach.
  - Focus on what works in the specific environment. Driven by the business
    questions.

### Understanding Customer Behaviour

- Understanding customer behaviour is at the core of CRM.
- If you understand the needs of your customer
  - You can retain new customers
  - Retain existing customers by satisfying those needs better.

### Three Types of CRM

Operational

: Customer services, marketing sales

Collaborative

: Channels for communication with customers

Analytical

: The processes and technologies for analysis of customer needs.

### Understanding Customers

- Customer segmentation
  - Group similar customers based on demographical data
- Who is buying what
  - Analysing purchasing patterns
- Market basket analysis
  - Looking at what customers (or customer segments) typically purchase together
- Predicting which prospects will be come responders
- Churn modelling
  - Who is about to leave
  - Why is the customer leaving

### Customer Analytics

Customer analytics has three area of focus:

1. **Customer Behaviour** - what customers have done, what customers will do
2. **Customer Circumstances** - attributes of the customer that change over time
   such as martial status, hobbies, income level.
3. **Customer Characteristics** - attributes of the customer that (generally)
   don't change over time: name, nationality, age, gender.

### The limits of dimensional approach

- The customer dimension is critical for effective CRM.
- It is one of the most challenging dimensions for any data warehouse, even
  outside of CRM
  - Depth and Breadth
    - Can have millions or billions of rows (credit card companies, government
      agencies exceed 100 million rows)
    - Hundreds or thousands of attributes (leading marketers maintains 3000
      customer attributes)

### Modelling Customer Behaviour with Dimensional Models

- Dimensional models are behaviour centric
  - The centre of any dimensional model is a fact table
  - Facts are business events
  - Customer behaviour exhibits as a series of business events
- Dimensional models therefore enable comprehensive analysis of behavioural data
  (e.g. purchases, booking, etc.)

### Customer-Circumstance Models

- A CRM data warehouse is **customer-centric**
- The emphasis is shifted from behaviour
  - More value attached to the customer's personal circumstances
  - This enables us to classify customers into segments.

### Modelling Customer Data

- Dimensional modelling or E-R modelling?
- Todman's approach:
  - Use dimensional models in modelling customer behaviour as before
  - But use more conventional approaches when modelling customer's
    circumstances.
  - Combine the two to come up with a customer-centric schema design.

### General Conceptual Model (GCM)

- Todman (2001) proposes a "General Conceptual Model" (GCM) for customer centric
  data warehouses
- Four generalised entities that all relate to a customer
  - Customer characteristic's
  - Customer changing circumstances
  - Customer behaviour
  - Customer derived segment

### General Conceptual Model for a Customer-Centric Data Warehouse

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8lxj50e5wj30l80bvmyq.jpg)

### The Customer Entity

- Contains static customer information
  - Information that does not change, or changes that do not need to be kept
    - Title, name, date of birth, gender, etc.

### Modelling Changing Circumstances

In CRM we need to know, for example:

- What customer circumstances cause customers to churn
- What circumstances cause customers to change their product preferences etc.
  - Customer moves to a different area
  - Customer gets married
  - Starts to play tennis

A set of entities that contain information that changes over time, and which we
want to keep track of (e.g. address, martial status, hobbies, profession,
income, employer, children, spouse).

### Customer Behaviour

Customer table acts as a kind of conformed dimension with behavioural fact
tables.

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8lxnu53gsj30ml0aeq4f.jpg)

#### Example Behavioural Entities

Each one is a _fact table for different star schema_, and would have other
associated dimensional tables

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8lxou5yv5j30hu0c7my7.jpg){width=50%}

### Segmentation

- Customers can be segmented on behaviour and circumstances
- Derived segmentation uses other attributes and patterns to group customers.

#### Customer Derived Segment

- Examples of derived segments:
  - Propensity to churn
  - Estimated life time value (high, medium, low, etc.)
  - Up-sell and cross-sell potential
  - Credit risk
- These types of segments can be derived from data _using data mining, OLAP and
  other analytical methods_.

## The Wine Club Case Study

- The organisation: mail order wine club
- Sells wine and accessories (e.g. glassware, tableware, books)
- Organises trips to special events
- Existing systems: customer administration, stock control, order processing,
  shipments, trip bookings.
- Business requirements:
  - The club is loosing its marketing share. Customers are leaving the club.
  - It is difficult to get answers to strategic questions from existing systems.
  - The directors of the Wine Club want to know:
    - Which product lines are increasing in popularity and which are decreasing?
    - Do customers tend to purchase a particular class of product>
    - Which customers are likely to churn?
    - For special promotions - which customers are likely to buy the product?
    - $\cdots$

### Customer Changing Circumstances

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8lxumpbpdj30nu0h5qb0.jpg)

### Customer Behaviour

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8lxv2p7rsj30p60k7467.jpg)

### Derived Customer Segments

![](https://tva1.sinaimg.cn/large/006y8mN6ly1g8lxvq4yc0j30o40jj11a.jpg)
