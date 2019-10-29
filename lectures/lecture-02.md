---
title: 'FIT3003 - Lecture 2'
subtitle: 'Business Intelligence Interfaces 1'
---

# Lecture 2: Business Intelligence Interfaces 1

## Agenda

1. Why is the BI user interface important?
2. BI user interface components and navigation
3. Useability, user interface design, usability testing

## Why is the BI user interface important?

BI system developers care more about the technology.

BI system users care most about the interface.

### General BI UI Requirements

- Interfacemust not get in the way
  - Allow analysis "at the speed of thought"
  - "Transparent interaction"
- Information presented must beeasy to understand
- It must beclearwhere information comes from
- The interface must beeasy to learnandeasy to remember
  - Managers will not attend long training sessions
  - Some managers only use the system infrequently
- Thefocus most be on thedesignrather thanengineering.

### Mobile BI UI Requirements

- GeneralBI UIrequirements still apply
- Mobile BI applications tend to supportvery specific tasks(e.g. field sales
  representative)
  - Understand decision task and environment very well.
  - Work closely with users to develop the application.
  - Do not limit development and testing to emulators.
- Design BI application interface to confirm withUI conventionsof the target
  platform.
- Choosefont sizesandmenu targetscarefully.
- Mobile application usersexpect "beautiful" apps.

## BI UI Components

### Report

- A document that presents information in an organised format for aspecific
  audienceandspecific purpose.
- Information is usually organised in a combination ofgraphic,
  tabularand/ornarrativeformats.
- Reports output is generated on arecurringschedule, when certainconditions are
  metor asrequired.
- Reports can bestaticorinteractive(e.g. user can enter parameters, sort
  columns, filter content)

### Tables

- Values are arranged in a grid format (i.e. rows and/or columns)
- Values are encoded in text (i.e. words and/or numbers)
- Rows and columns can eb defined by grid lines or whitespace
- Tables are the most appropriate method to:
  - Display information when the user has the need to look up individual values.
  - Display simple relationship between numeric values and categorical values.

### Graphs (a.k.a. Charts)

- Values are displayed within an area bordered by one or more axes
- Values are encoded as visual objects (i.e. shapes and lines) positioned in
  relation to the axes.
- Axes provide scales that are used to label and assign values to the visual
  objects.
- Graphs are the most appropriate method when:
  - The message is contained in the shape of the values.
  - The objective is used to reveal relationships among multiple values.

### Dashboards

#### Overview

- Small, concise, clear, intuitive, andoften interactivedisplay.
- Customised for a specific person, group or function.
- Focus on monitoring and measuring.
- Consists of a combination of charts and tables.

#### Types

##### Strategic

- Used by managers to monitor business health and progress towards meeting
  strategic objectives.
- High-level measures of past and forecast performance.

##### Analytic

- Used by analysts as a way to gain access to a broad range of more detailed
  information.

##### Operational

- Used to monitor the operation of a factory or service.
- Display of information is real-time or near-real-time
- Not only displayed measures but also displays warnings and alerts.

### Dashboards vs. Reports

- Minimal interactivity
- Minimal analysis
- Require minimal cognitive effort
- Focus on quick communication of key data.
- Individual visualisations should work together to communicate effectively.

  - Consider placement for comparisons.
  - Avoid multiple 'screens' (tabs -- horizontal, scrolling - vertical).

- Navigation should not be needed or at least kept to a minimum.
- Click through o reports for more substantial analysis.

## BI UI Navigation Methods

### Drill-Down

- Navigating to a report withmore detailfollowing the levels of a pre-defined
  dimension hierarchy.
- Example:
  - Yearly sales
    - Quarterly sales
      - Monthly sales
        - Daily sales

### Drill-Up (a.k.a. Roll-Up)

- The reverse of "drill-down"
- Navigating to a report withless detailfollowing the levels of a pre-defined
  dimension hierarchy.
- Example:
  - Daily sales
    - Yearly sales
      - Quarterly sales
        - Monthly sales

### Drill-Through

- Navigating from a summary report to report that show the detailed transactions
  that made up the summary.

### Drill-Across

- Navigating from a report based on one set of dimension attributes and
  measure(s) to a new report with the same set of dimension attributes but
  withdifferent measure(s).

## Designing the BI UI

### Key Terms and Concepts

- Usability
  - "The extent to which a product can be used by specified users to achieve
    specified goals with effectiveness, efficiency and satisfaction in a
    specified context of use" (ISO 9241).
- Affordance
  - A capability offered by an artefact to a user. Can be different for
    different users.
- Visibility
  - The features or properties of an object that tells or shows a user how to
    interact with, or the status of, an object.

### UI Design Guidelines

1. Visibility of System Status
2. Match Between System and Real-World
3. User Control and Freedom
4. Consistency and Standards
5. Error Prevention
6. Recognition Rather Than Recall
7. Flexibility and Efficiency of Use
8. Aesthetic and Minimalist Design
9. Help Users Recognise and Recover From Errors
10. Help and Documentation

### Usability Testing

- What is it?
- Why do it?
- When should it be done?

##### Structure

- Identify the scope
- What is the purpose
- Schedule and Location
- Who will participate
- How many participants?
- Choose scenarios
- Identify test metrics
- Conduct the tests
- Compile the results
- Fix the usability problems

## Summary

- The UI is the most important but often most neglected part of a BI system
- The BI UI is made of reports, tables, graphs and dashboards and can be
  navigated in different ways.
- A usable UI -> satisfied users & confident in the information provided.
- Apply usability principles and conduct usability testing.
