# Lecture 1: Understanding Business Intelligence and Data Warehousing

## Unit Overview

### Unit aim

- The aim of this unit to **provide a framework for understanding business
  intelligence and data warehousing** in organisations, including their:
  - Purpose
  - Design
  - Development
  - Management
  - Governance

## Business Intelligence and Data Warehousing Systems

### Why study BI and DW systems?

- Broadly, two categories of information systems in enterprise IT:
  1. Systems for collecting and recording information about business activities:
     **_transaction processing systems_**
     - e.g. ERP systems, payroll systems, point-of-sale systems, inventory
       management systems, etc.
  2. Systems for **_collating and analysing_** information (typically collected
     from transaction processing systems) to support organisational
     decision-making.
- No IT professional can claim to understand enterprise IT without undersanding
  both kinds of systems.
- The approaches that work well for developing transaction proxcessing systems
  often don't work for decision support systems.
  - IT industry often tries to use transaction processing approaches: leads to
    high failure rate
  - Industry needs people to understand BI.
- Business Intelligence is a key IT priority for organisations

## Common Features in BI

- Data from lots of different souyrces, internal and external.
- 'Dashboards' provide overview and monitoring of performance.
- Ability to navigate from one report to another for investigation:
  - 'slice and dice'
  - 'drill down'
- Visualisation of data
  - Graphical
  - Textual

## Data and Business Intelligence

- BI systems have to:
  1. Acquire data
  2. Present it
- Where does the data come from?
  - Lots of different systems
    - Internal
    - External
    - Different data formats
    - Different database management approaches
    - Structured data
    - Unstructured data
- A Data Warehouse
  - Large, centralised database for storign data from transaction processing
    systems
- Provides a data storage layer that provides:
  > "...a **subject-oriented, integrated, time-variant, and non-volatile**
  > collection of data in **support of managment's decisions**" Inmon and
  > Hackathorn (1994)

## Motivations for data warehousing

- Data in sources systems is frequently inconsistent, of poor quality and stored
  in different formats.
- Query processing on transaction-processing systems is not a good option.
- DW is custom-designed for efficient data retrieval
- DW reduces complexity and consts
  - BI systems can source their data from a single system with a known and
    consistent data structure and format.

## Data Warehouse

### Subject Oriented

- A data warehouse is organised by "data subjects" that are relevant to the
  organisation.
  - Customer, claim, shipment, product, etc.
- This may be contrasted with the process orientation of many
  transaction-processing systems.

### Integrated

- Data in the warehouse is structured based on a corporate-wide model, spanning
  the functional boundaries of source systems.
- This includes naming standards, units of measurement and periodicity.
- Compare with transaction processing sytems:
  - Highly normalised.
  - Lack of consistency between systems.

### Time Variant

- Data in the warehouse is characterised by the time-series nature of historical
  data.
- The data consists of a **series** of "snapshots" which are time-stamped and
  record values at a moment in time.
- This supports trend analysis of the data.

### Non volatile

- The data warehouse is **not** continuously updated (inserts, deletes and
  changes) like data in a transaction-processing system.
- Data in a data warehouse is periodically up-loaded at a scheduled time
  intervals (daily, etc.) - "upserting"
- When updated, earlier versions of the data is maintained.
- Transaction processing systems usually don't maintain history:
  - Edits, deletions overwrite data

## Why learn about BI/DW?

- Three key aspects of BI/DW systems make them different to other information
  systems:
  - The **task** supported
  - The **users**
  - The **development process** required.

### The Task - Decision Making

- Decision making underpins all deliberate human action
- Humans are notioiously bad at it
  - Herbert Simon, bounded rationality - Nobel Prize in economics, 1978
  - Daniel Kahneman, cognitive biases - Nobel Prize in economics, 2002
- People often make decisions that are irrational
  - Limited memory, cognitive processing abilities, time, resources (bounded
    rationality).
  - Systemic errors in judgment (cognitive biases)

_All of this even when all of the relevant information for a decision is
available_

#### Human Decision Making

- Subject to congitive overload
- Subject to systemic biases
- Subject to personal preference
- Inherently **ambiguous**, especially for strageic decisions
  - No single 'right' answer
  - Possibly no single 'right' way to make a decision.

#### Compare to transaction processing systems

- Task is typically a well-defined business workflow:
  - Clear responsibilities
  - Explicit information requirements.
  - Explicit rules for using the information to perform an action.
- This allows us to develop a requirements specification for the information
  system design.
- BI systems deal with a much more complex and ambiguously defined task than
  most transaction proessing systems.

### The Users

- Organisational decision makers
  - Knowledge workers
  - Managers
  - Executives
  - Directors
- Impossible to specify what these people do from moment to moment
  - Compare with a sales clerk: very specific actions, reptitive task.
  - Managers: many different actions, sometimes unique one-off tasks
- Organisationally powerful
  - If they don't want to use the BI system, they won't.
  - Not the case for sales clerks.

#### The development processes

The traditional approact to the SDLC:

1. Gather information requirements.
2. Produce a requirements specification document, with sign-off from the client.
3. Develop the system - database, software, hardware.
4. Test the system to make sure the system matches the requirements
   specification.
5. Client signs-off and takes acceptance of the system.
6. Project is closed.

#### But for BI/DW

- The purpose of the system is to help users **understand** the decision problem
  so they can make a better decision.
- The information needed to make a good decision depends on the decision
  problem.
- Catch 22!
  - You don't know what information you'll need until you start using the
    system.
  - You can't use the system until it's designed.
  - It can't be designed until the designer has gathered the information
    requirements.

#### BI/DW Development

- Any system designed to support decision making **must**:
  - Be closely developed with co-operation between the users and the developers.
  - Be developed in an adaptive manner - as the user uses the system, their
    understanding and requirements change and teh system design has to change
    too.
- Evolutionary/Adaptaive development
  - Significantly different to traditional project-based development where there
    is a clear end-date and specific deliverable (and budget)
- High profile projects
  - Significant organisational impact, affects multiple business areas
- As a result - high risk

## Summary

- Business Intelligence is the current approach to organisational decision
  support.
- Data Warehousing provides the data infrastrcture to develop various decision
  support and business intelligence initiatives in an organisation.
- BI is a significant aspect of enterprise IT, important to understand properly.
- BI and DW are fundamentally different from more typical information systems:
  - Different nature of the _task_ supported.
  - Different, discretionary and powerful _users_.
  - Different, 'chaotic' development _process_
