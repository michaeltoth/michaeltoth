---
title: 10 Steps to Better Graphs in R
author: Michael Toth
date: 2019-05-07 10:30
category: R
tags: R, graph, ggplot
output: html_document
summary: Over the last 5 years, I have created **a LOT** of graphs. And let me tell you, they haven't all been pretty. But with each new graph that I've created, I've improved my knowledge of what works and what doesn't. In this post, I share the 10-step graphing checklist I've developed to increase my impact and ability to drive change in an organization.
status: draft
---

Over the last 5 years, I have created **a LOT** of graphs. And let me tell you, they haven't all been pretty. But with each new graph that I've created, I've improved my knowledge of what works and what doesn't. 

And I've used that knowledge to develop a set of best practices that I follow every time I'm working on a new project that involves communicating results or information with graphs. 

You see, when I'm making a graph, I'm not doing it just to explore some data or show something "interesting". No. I want my graphs to speak to my audience and help them to *understand* and *take action* based on what they learn. 

A good data scientist needs to be able to not only analyze data, but also to convey the insights hidden in that data in a way that convinces people to take appropriate action. 

If you can use your data analysis skills to consistently drive change in your organization, you will quickly find yourself on a path toward promotion, increased responsibility, and greater control over your own work. 

In my own experience, learning to graph effectively was the single biggest thing that helped me increase my impact and ability to drive change at work. That's why I think it's so important for you to learn to graph effectively, and that's why I'm sharing this checklist with you today.

This is the exact checklist I go through when I'm working on graphs for big consulting projects with my clients. I keep a printed copy on my desk and I refer to it every time I'm working on a new graph. It helps me, and I think it will help you too. Be sure to get a copy of the checklist for yourself so you'll always have it handy when you need it!

[Get Your Free 10-Step ggplot Graphing Checklist](https://mailchi.mp/114dc86f2f2b/graphing-checklist)


## Why Do You Need a Checklist

Graphs are a versatile tool that can be used for a variety of different goals. That's one of the reasons why I think learning to graph effectively is one of the highest priorities for data scientists. 

But I also think that leads to a lot of problems with graphs. You see, you can use graphs for exploratory data analysis, and you can also use graphs for presentation and sharing results. The problem that I see **ALL THE TIME** is that people try to use the same graphs for both of these things. Ahhh! 

Look, I've been there. It's tempting and easy to throw a few quick graphs together and call it a day. 

I used to work in finance, and I was once tasked with building a model to predict of how likely borrowers were to default on loans they had taken out. 

It was a challenging problem, and I spent around 6 weeks creating a sophisticated model that predicted defaults based on all kinds of data about the borrower's income level, where they lived, how big their loan was, and what their interest rate was.

I was pretty pleased that the model I created worked really well! I knew our clients would find a lot of value in this model once we got it implemented into our platform.

Before that, I needed to summarize my results and share them with the rest of the company. At the time, I didn't see this as an opportunity to advocate for my work and its benefits to our clients. Instead, I saw it as an annoying obligation that I had to do on top of my already extensive analysis.

I knew my analysis was good and that this change was valuable. I was sure other people understood that as well. 

So I threw some graphs together, gave a quick presentation on the topic to a room full of glazed-over eyes, and went back to my desk.

It took weeks for us to build this into the platform, when it could have been done in a matter of days if there was sufficient motivation.

Whose fault was that? At the time, it was easy for me to blame the engineering team for the slow implementation. But the reality is, **it was my fault!**

Everybody else is busy with their own work, and for the most part, they don't really know what it is you do all day. You're often so deep in the weeds of your own analysis that things you think are simple and obvious aren't even on the minds of everybody else. That's why it's important to treat every presentation and every graph you share as an opportunity to educate others and inspire them to move forward with an action.

I'd love to say that I immediately changed my presentation and graphing style after that experience, but I didn't. It took me years to develop the knowledge and skills to do this effectively.

But it doesn't have to take years! I'm here to help you learn *today* how to effectively use graphs to communicate ideas and drive change. 

If you implement these ideas consistently, you **will** see improvements in the impact of your work and your influence in the organization.

Now, let's get into the checklist. And remember, if you want to keep a copy of this for yourself so you'll always have it to refer back to, you can get that here:

[Get Your Free 10-Step Checklist to Graphing for Impact](https://mailchi.mp/114dc86f2f2b/graphing-checklist)

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

## Conclusion

Some of these tips may have been obvious, and others may have seemed like revelations. The important thing is to think through these steps and apply them *consistently* with every graph you produce. I promise you that if you incorporate this checklist into your workflow, you're going to see a big change in how people respond to your analysis at work.

Remember to get a copy of this graphing checklist so you can be sure to go through it every time!

[Get Your Free 10-Step Checklist to Graphing for Impact](https://mailchi.mp/114dc86f2f2b/graphing-checklist)
