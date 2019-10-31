---
title: 'FIT3003 - Lecture 3'
subtitle: 'Business Intelligence Interfaces 2'
---

# Lecture 3: Business Intelligence Interfaces 2

## Agenda

1. Key theories and principles of BI UI design
2. Design effective tables, charts and dashboards.

## How do users "see" and "think" about BI UI?

### BI System Model of Communication

![](https://i.loli.net/2019/10/29/qzKB1A4duIWnlto.png)

### Consequences for BI UI design

- For an intuitive, easy to understand visualisation of data
  - Use features 'seen' during pre-attentive processing: shapes, curves, etc. to
    communicate the message of the display.
  - Use white-space to group, sort data to easily identify outliers.
  - Avoid 'wasted' use of these features - 3D effects, irrelevant colours.

### Tufte's Data-Ink Ratio

> "A large share of ink on a graphic should present data-information, the ink
> changing as the data change. Data-ink is the non-erasable core of a graphic,
> the non-redundant ink arranged in response to variation in the numbers
> represented.

> "Maximise the data-ink ratio, within reason. Every bit of ink on a graphic
> requires a reason. And nearly always that reason should be that the ink
> presents new information." (Tufte 1983, p96)

- Data-Ink Ratio = (Ink used to display data)/(total ink to print chart).
- Reduce the non-data ink
  - Remove unnecessary non-data ink
  - De-emphasis and regularise remaining non-data ink
- Enhance the data ink
  - Subtract unnecessary data ink
  - Emphasise the most important data ink

### Cognitive Fit Theory (Vessey 1991)

- Relationship between
  - The decision task,
  - Information presentation, and
  - Task performance
- Two classes of decision task & matching information representations
  - Spatial/"imagistic" -> Charts/Graphs (e.g. trends)
  - Symbolic/"analytic" -> Tables (e.g. specific values)
- Task performance (i.e. accuracy, speed, etc.) increases significantly when
  class of task matches type of information representation
- Ensure you understand the decision task before you choose between using a
  chart or a table.

## How to design effective UI?

### How to: Design Good Tables

- Ehrenberg's "Rudiments of Numeracy"
- Presentation depends upon
  - The data
    - Simple or complex
    - New or repetitive
    - Reliable or uncertain
  - The purpose
    - Analysis
    - To tell a story
    - For the record

#### Ehrenberg's Rule 1

- Round to two significant or effective digits
- Use this selectively. Some users like exact values.

#### Ehrenberg's Rule 2

- Use row and column averages to provide a visual focus.

#### Ehrenberg's Rule 3

- Figures are easier to compare in columns.

#### Ehrenberg's Rule 4

- Ordering rows and columns by size
- Choose the column to sort on based on user needs

#### Ehrenberg's Rule 5

- Spacing and layout
  - Figures which are meant to be compared should be placed close together, and
    gaps used to guide the eye across a table.

#### Ehrenberg's Rule 6\

![](https://i.loli.net/2019/10/29/ZdnfXQTeJ6DN7kI.png)

### How to: Design Good Charts

- Avoid chart junk (i.e. increase data-ink ratio)
- Use small multiples to highlight comparisons and assess changes.
- Use complex graphs to portray complex patterns
- Relate graph size to information content
- Use graphical forms that promote comparisons.
- Integrate graphs and text.
- Demonstrate an important message.
- Allows access to different levels of detail via drill-down or drill-through.

#### Colour Chart Guidelines

- Be consistent
- Use harmonious colours for balance
- Use contrasting colours to highlight
- Colours should enlighten, not dazzle.
- Use colour to emphasize, to prioritize
- Use colour to make new points, e.g. fresh data
- Note personal preferences - option to change?
- Consider colour blindness when choosing colours
  - $\approx 10\%$ of males are red-green colour blind.
- Dark tones come forward, light tones recede.

#### Choosing the correct chart

- Match style of chart to the user's decision task
- Avoid 3D version of charts
- If your not sure refer to chart selection guides.

#### Pie Charts

- Widely used (and abused) in business and media
- Human visual perception is not good at comparing areas and angles
- Interpretation of a pie chart changes with position of segments and "clock
  position" of the chart.
- It is best to avoid them if possible

#### Sparklines

- A sparkline is a small intense, simple, word-sized graphic with typographic
  resolution.
- Originally invented by Edward Tufte in 2004
- Patented (controversially) by Microsoft in 2009
  - Now a standard feature in Excel
- Everywhere a word or number can be used.

### The purpose of a dashboard

- To quickly present data that informs the user of the current status of
  something.
- Avoid:
  - In-depth analysis
  - Long historical comparisons
  - Navigation (tabs)
  - Non-critical information
- Ensure:
  - Visualisations are quick and easy to read
  - Visualisations work together to communicate effectively
  - Users' attention is drawn to urgent problems.

#### Dashboards - Design and Development

- Who is the audience?
- What is the purpose of the dashboard?
- What type of dashboard am I creating?

#### Dashboards - Things to Consider

- Form - Form follows function
- Structure - How will you layout the objects?
- Design Principles - What will guide your design?
- Functionality - What can the user do?

## Summary

- Theories and principles that support good BI interface design
  - The general communication model - reduce biases
  - Visual image processing - reduce cognitive effort
  - Data-ink ratio - reduce unnecessary content
  - Cognitive fit theory - match visualisation to the task
- Guidelines for table, chart, and dashboard design
  - Ehernberg's rules for table layout and structure
  - Choose the correct chart, consider colour, simplify!
  - Avoid pie charts when possible. Use bar charts.
  - Dashboards: consider audience, purpose and type.
