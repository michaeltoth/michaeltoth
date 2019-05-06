---
title: 10 Steps to Better Graphs in R
author: Michael Toth
date: 2019-05-07 6:00
category: R
tags: R, graphs
output: html_document
summary: 
status: draft
---

One of the tricky things with getting graphs right is that you use graphs for a variety of purposes. I generally will start graphing exploratory data to get a sense for what's going on in an underlying dataset. This is mostly for myself, so I can get a deeper understanding of the underlying data.

The problem is when you simply use those exploratory graphs in a final report, website, or presentation without giving further thought to what you're showing.

Think about it this way.

You just spent days, weeks, or sometimes months working on a particular data analysis project. You've found some interesting results, and now you're ready to share those results, either with your team, or perhaps with your company's clients.

You're trying to convey the value of the weeks worth of work you just put in. Why would you not put in at least a bit of time to make sure your graphs convey the information?

You're often so deep in the weeds of your own analysis that things you think are simple and obvious are anything but to your end reader. 

I once spent a few months working on a project to predict prepayment and default rates on loan portfolios. This was going to be a big win to our clients, and blah. 

After that, I knew I needed to do something different. 

So I spent a lot of time researching and gathering opinions on data visualization, communication, etc. 

Here's what I came up with. It's my 10-step checklist to ensure that any graphs I produce are compelling and get the story across that I'm trying to tell.

Are you ready? Let's go!

## Before you graph

#### 1. Decide who this graph is for

In order to create an effective graph, you need to know who will be using this information. Many of your design decisions stem from this key point. If you understand your audience’s background, goals, and challenges, you’ll be far more effective in creating a graph to help them make a decision, which is what this is all about! In particular, remember that this graph is not for you. You have all kinds of specialized knowledge that your audience likely does not have. You need your graph to appeal to them.

#### 2. Structure your graph to answer a question

Your graphs should answer an important question that your audience has. “How have our revenue numbers changed over time?” or “Which of our services has the lowest level of customer satisfaction?” Design your graph to answer their question, not just to explore data. This serves two purposes.

1. It gives people a reason to pay attention. If you're answering a big question they have, they're going to listen to you.
2. It provides a clear path from **data** to **action**, which is ultimately what you want. Remember: the entire point of this field is to extract insights from data to **help businesses make better decisions!**

#### 3. Decide which type of graph to use

The graph you use will depend on the data and the question you are answering.

* **[Line Graph](https://michaeltoth.me/a-detailed-guide-to-plotting-line-graphs-in-r-using-ggplot-geom_line.html)**: Use line graphs to track trends over time or show the relationship between two variables.
* **[Bar Charts](https://michaeltoth.me/detailed-guide-to-the-bar-chart-in-r-with-ggplot.html)**: Use bar charts to compare quantitative data across multiple categories.
* **[Scatter Plots](https://michaeltoth.me/a-detailed-guide-to-the-ggplot-scatter-plot-in-r.html)**: Use scatter plots to assess the relationship between two variables.
* **Pie Charts**: Use pie charts to show parts of a whole. I personally do not use pie charts, and I advise you to be very careful with them. If you must use them, limit the number of categories, as more than 3 or 4 makes them unreadable.

#### 4. Decide how to handle outliers

Outliers are an inevitability. You need to decide how to handle this. Sometimes, the outlier itself can be a point of focus in your graph that you want to highlight. Other times, it can be a distraction from your message that you would prefer to remove. Before removing an outlier, think critically about why the outlier exists and make a judgment call as to whether removing it helps to clarify your point without being misleading.

## Building Your Graph

#### 5. Remove unnecessary data

Your audience should be able to clearly understand the point of your graph. Excessive and unnecessary data can distract from this goal. Decide what is necessary to answer your question and cut the rest. 

#### 6. Don't be misleading 

There are many ways that graphs can be misleading, either intentionally or unintentionally. These two seem to come up most frequently:

If you’re using a bar chart, the baseline for the y-axis must start at 0. Otherwise, your graph will be misleading by amplifying the actual differences across the categories.

Your titles and captions should accurately describe your data. Titles and captions are a great way to bring salience to your graph, but you need to ensure the text reinforces what the data says, rather than changing the message.

## Styling Your Graph

#### 7. Decide on an appropriate color palette

Color is an important and often-neglected aspect of graphs. For single-color graphs, choose a color that’s related to your organization’s brand or thematically related to the graph (for example, green for forestry data). For multicolor graphs, use Color Picker for Data, an excellent tool for building visually pleasing color palettes.

#### 8. Make all of your axis titles and labels horizontal

All of the axis titles and labels in your graph should be horizontal. [Horizontal labels](https://michaeltoth.me/one-step-to-quickly-improve-the-readability-and-visual-appeal-of-ggplot-graphs.html) greatly improve the readability and visual appeal of a graph. 

#### 9. Adjust your titles, labels, and legend text

Give your graph a compelling title, and add descriptive and well formatted names to the axis titles and legend. A good choice for your graph title is to simply state the question you’re trying to answer. I also like to use a subtitle that drives home the message you want people to take away. You can use the labs function in ggplot to modify these labels.

#### BONUS: Add your company logo and branding

If you’re sharing this graph with clients or the public, [adding your company logo and branding](https://michaeltoth.me/you-need-to-start-branding-your-graphs-heres-how-with-ggplot.html) elements can help your graph to stand out and to build credibility for your organization. This is great for you, because it will help you to grow your own influence and visibility within the company. Read my guide on this subject for more details on how to implement this tip.

## Exporting Your Graph

#### 10. Save your graph in a readable high-resolution format

Think about how your graph is going to be read. Will it be online, printed, or in a slide for a presentation? Each format may require different adjustments to text and graph sizing to be readable. Be sure to test for yourself to ensure you can read your graph in its final format. This will avoid frustrating reworks or--even worse--sharing an unreadable graph! Use the ggsave function to save your graph and modify the resolution. Then, adjust sizes until you’re satisfied with the final result.
