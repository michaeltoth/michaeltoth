---
title: A Detailed Guide to the ggplot Scatter Plot in R
author: Michael Toth
date: 2019-04-24 8:05
category: R
tags: R, ggplot, scatter plot, geom_point
output: html_document
summary: A simple scatter plot can be one of the most powerful ways to convey graphical information. This detailed guide to the scatter plot in R will teach you how to create a ggplot scatter plot using the geom_point function
---



When it comes to data visualization, flashy graphs can be fun. But if you're trying to convey information, especially to a broad audience, flashy isn't always the way to go. 

Last week I showed how to work with [line graphs](https://michaeltoth.me/a-detailed-guide-to-plotting-line-graphs-in-r-using-ggplot-geom_line.html) in R. 

In this article, I'm going to talk about creating a scatter plot in R. Specifically, we'll be creating a `ggplot` scatter plot using `ggplot`'s `geom_point` function. 

A scatter plot is a two-dimensional data visualization that uses points to graph the values of two different variables - one along the x-axis and the other along the y-axis. Scatter plots are often used when you want to assess the relationship (or lack of relationship) between the two variables being plotted.

##### Scatter Plot of Adam Sandler Movies from FiveThirtyEight

<center>
![FiveThirtyEight Scatter Plot of Adam Sandler Movies](../images/20190422_geom_point/sandler.png){width=600px}
</center>


For example, in this graph, FiveThirtyEight uses Rotten Tomatoes ratings and Box Office gross for a series of Adam Sandler movies to create this scatter plot. They've additionally grouped the movies into 3 categories, highlighted in different colors.

##### The Famous Gapminder Scatter Plot of Life Expectancy vs. Income by Country

<center>
![Gapminder Scatter Plot of Life Expectancy vs. Income by Country](../images/20190422_geom_point/gapminder.png){width=600px}
</center>


This scatter plot, initially created by Hans Rosling, is famous among data visualization practitioners. It graphs the life expectancy vs. income for countries around the world. It also uses the size of the points to map country population and the color of the points to map continents, adding 2 additional variables to the traditional scatter plot. 

Hans Rosling used a famously provocative and animated presentation style to make this data come alive. He used his presentations to advocate for sustainable global development through the Gapminder Foundation. 

Hans Rosling's example shows how simple graphic styles can be powerful tools for communication and change when used properly! Convinced? Let's dive into this guide to creating a ggplot scatter plot in R!

## Follow Along With the Workbook

I've created a [free workbook](https://mailchi.mp/213333232fb2/workbook-ggplot-scatter-plot) to help you apply what you're learning as you read. 

The workbook is an R file that contains all the code shown in this post as well as additional questions and exercises to help you understand the topic even deeper.

If you want to really learn how to create a scatter plot in R so that you'll still remember weeks or even months from now, you need to practice. 

So [Download the workbook now](https://mailchi.mp/213333232fb2/workbook-ggplot-scatter-plot) and practice as you read this post!


## Introduction to ggplot

Before we get into the ggplot code to create a scatter plot in R, I want to briefly touch on `ggplot` and why I think it's the best choice for plotting graphs in R. 

`ggplot` is a package for creating graphs in R, but it's also a method of thinking about and decomposing complex graphs into logical subunits. 

`ggplot` takes each component of a graph--axes, scales, colors, objects, etc--and allows you to build graphs up sequentially one component at a time. You can then modify each of those components in a way that's both flexible and user-friendly. When components are unspecified, `ggplot` uses sensible defaults. This makes `ggplot` a powerful and flexible tool for creating all kinds of graphs in R. It's the tool I use to create nearly every graph I make these days, and I think you should use it too!


## Investigating our dataset

Throughout this post, we'll be using the `mtcars` dataset that's built into R. This dataset contains details of design and performance for 32 cars. Let's take a look to see what it looks like:

<center>
![A snippet of the mtcars dataset](../images/20190422_geom_point/mtcars.png){width=400px}
</center>

The mtcars dataset contains 11 columns: 

* `mpg`:	Miles/(US) gallon
* `cyl`:	Number of cylinders
* `disp`:	Displacement (cu.in.)
* `hp`:     Gross horsepower
* `drat`:   Rear axle ratio
* `wt`:	    Weight (1000 lbs)
* `qsec`:	1/4 mile time
* `vs`:	    Engine (0 = V-shaped, 1 = straight)
* `am`:	    Transmission (0 = automatic, 1 = manual)
* `gear`:	Number of forward gears
* `carb`:	Number of carburetors


## How to create a simple scatter plot in R using geom_point()

`ggplot` uses geoms, or geometric objects, to form the basis of different types of graphs. Previously I talked about [geom_line](https://michaeltoth.me/a-detailed-guide-to-plotting-line-graphs-in-r-using-ggplot-geom_line.html), which is used to produce line graphs. Today I'll be focusing on `geom_point`, which is used to create scatter plots in R. 


```r
library(tidyverse)

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg))
```

<img src="/figures/20190422_ggplot_geom_point/simple_scatter_plot-1.png" title="center" alt="center" style="display: block; margin: auto;" />

Here we are starting with the simplest possible `ggplot` scatter plot we can create using `geom_point`. Let's review this in more detail:

First, I call `ggplot`, which creates a new `ggplot` graph. It's essentially a blank canvas on which we'll add our data and graphics. In this case, I passed mtcars to `ggplot` to indicate that we'll be using the mtcars data for this particular `ggplot` scatter plot.

Next, I added my `geom_point` call to the base `ggplot` graph in order to create this scatter plot. In `ggplot`, you use the `+` symbol to add new layers to an existing graph. In this second layer, I told `ggplot` to use `wt` as the x-axis variable and `mpg` as the y-axis variable. 

And that's it, we have our scatter plot! It shows that, on average, as the weight of cars increase, the miles-per-gallon tends to fall. 


## Changing point color in a ggplot scatter plot

Expanding on this example, we can now play with colors in our scatter plot.


```r
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg), color = 'blue')
```

<img src="/figures/20190422_ggplot_geom_point/color-1.png" title="center" alt="center" style="display: block; margin: auto;" />

You'll note that this `geom_point` call is identical to the one before, except that we've added the modifier `color = 'blue'` to to end of the line. Experiment a bit with different colors to see how this works on your machine. You can use most color names you can think of, or you can use specific hex colors codes to get more granular.

Now, let's try something a little different. Compare the `ggplot` code below to the code we just executed above. There are 3 differences. See if you can find them and guess what will happen, then scroll down to take a look at the result. If you've read my previous `ggplot` guides, this bit should look familiar!


```r
mtcars$am <- factor(mtcars$am)

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, color = am))
```

<img src="/figures/20190422_ggplot_geom_point/color_aes-1.png" title="center" alt="center" style="display: block; margin: auto;" />

This graph shows the same data as before, but now there are two different colors! The red dots correspond to automatic transmission vehicles, while the blue dots represent manual transmission vehicles. Did you catch the 3 changes we used to change the graph? They were:

1. First, we converted the `am` variable to a factor. What do you think happens if we don't do this? Give it a try!
2. Instead of specifying `color = 'blue'`, we specified `color = am`
3. We moved the color parameter inside of the `aes()` parentheses

Let's review each of these changes:


##### Converting the `am` variable to a factor

In the dataset, `am` was initially a numeric variable. You can check this by running `class(mtcars$am)`. When you pass a numeric variable to a color scale in `ggplot`, it creates a continuous color scale. 

In this case, however, there are only 2 values for the `am` field, corresponding to automatic and manual transmission. So it makes our graph more clear to use a discrete color scale, with 2 color options for the two values of `am`. We can accomplish this by converting the `am` field from a numeric value to a factor, as we did above. 

On your own, try graphing both with and without this conversion to factor. If you've already converted to factor, you can reload the dataset by running `data(mtcars)` to try graphing as numeric! 

This point is a bit tricky. Check out [my workbook for this post](https://mailchi.mp/213333232fb2/workbook-ggplot-scatter-plot) for a guided exploration of this issue in more detail!


##### Specifying `color = am` and moving it within the `aes()` parentheses

I'm combining these because these two changes work together. 

Before, we told `ggplot` to change the color of the points to blue by adding `color = 'blue'` to our `geom_point()` call. 

What we're doing here is a bit more complex. Instead of specifying a single color for our points, we're telling `ggplot` to *map* the data in the `am` column to the `color` aesthetic. 

This means we are telling `ggplot` to use a different color for each value of `am` in our data! This mapping also lets `ggplot` know that it also needs to create a legend to identify the transmission types, and it places it there automatically!


## Changing point shapes in a ggplot scatter plot

Let's look at a related example. This time, instead of changing the color of the points in our scatter plot, we will change the shape of the points:


```r
mtcars$am <- factor(mtcars$am)

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, shape = am))
```

<img src="/figures/20190422_ggplot_geom_point/shape_aes-1.png" title="center" alt="center" style="display: block; margin: auto;" />

The code for this `ggplot` scatter plot is identical to the code we just reviewed, except we've substituted `shape` for `color`. The graph produced is quite similar, but it uses different shapes (triangles and circles) instead of different colors in the graph. You might consider using something like this when printing in black and white, for example.


## A deeper review of `aes()` (aesthetic) mappings in ggplot

We just saw how we can create graphs in `ggplot` that map the `am` variable to color or shape in a scatter plot. `ggplot` refers to these mappings as *aesthetic* mappings, and they include everything you see within the `aes()` in ggplot.

Aesthetic mappings are a way of mapping *variables in your data* to particular *visual properties* (aesthetics) of a graph. 

I know this can sound a bit theoretical, so let's review the specific aesthetic mappings you've already seen as well as the other mappings available within geom_point.


##### Reviewing the list of geom_point aesthetic mappings

The main aesthetic mappings for a ggplot scatter plot include:

* `x`: Map a variable to a position on the x-axis
* `y`: Map a variable to a position on the y-axis
* `color`: Map a variable to a point color
* `shape`: Map a variable to a point shape
* `size`: Map a variable to a point size
* `alpha`: Map a variable to a point transparency

From the list above, we've already seen the `x`, `y`, `color`, and `shape` aesthetic mappings. 

`x` and `y` are what we used in our first `ggplot` scatter plot example where we mapped the variables `wt` and `mpg` to x-axis and y-axis values. Then, we experimented with using `color` and `shape` to map the `am` variable to different colored points or shapes. 

In addition to those, there are 2 other aesthetic mappings commonly used with `geom_point`. We can use the `alpha` aesthetic to change the transparency of the points in our graph. Finally, the `size` aesthetic can be used to change the size of the points in our scatter plot.

Note there are two additional aesthetic mappings for ggplot scatter plots, `stroke`, and `fill`, but I'm not going to cover them here. They're only used for particular `shapes`, and have very specific use cases beyond the scope of this guide. 


##### Changing the `size` aesthetic mapping in a ggplot scatter plot


```r
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, size = cyl))
```

<img src="/figures/20190422_ggplot_geom_point/size_aes-1.png" title="center" alt="center" style="display: block; margin: auto;" />

In the code above, we map the number of cylinders (`cyl`), to the size aesthetic in ggplot. Cars with more cylinders display as larger points in this graph. 

Note: A scatter plot where the size of the points vary based on a variable in the data is sometimes called a bubble chart. The scatter plot above could be considered a bubble chart!

In general, we see that cars with more cylinders tend to be clustered in the bottom right of the graph, with larger weights and lower miles per gallon, while those with fewer cylinders are on the top left. That said, it's a bit hard to make out all the points in the bottom right corner. How can we solve that issue? Let's learn more about the alpha aesthetic to find out!


##### Changing transparency in a ggplot scatter plot with the `alpha` aesthetic


```r
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, alpha = cyl))
```

<img src="/figures/20190422_ggplot_geom_point/alpha_aes-1.png" title="center" alt="center" style="display: block; margin: auto;" />

In this code we've mapped the alpha aesthetic to the variable `cyl`. Cars with fewer cylinders appear more transparent, while those with more cylinders are more opaque. But in this case, I don't think this helps us to understand relationships in the data any better. Instead, it just seems to highlight the points on the bottom right. I think this is a bad graph!

How else can we use the alpha aesthetic to improve the readability of our graph? Let's turn back to our code from above where we mapped the cylinders to the size variable, creating what I called a bubble chart. Remember how it was difficult to make out all of the cars in the bottom right? What if we made all of the points in the graph semi-transparent so that we can see through the bubbles that are overlapping? Let's try!


```r
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, size = cyl), alpha = 0.3)
```

<img src="/figures/20190422_ggplot_geom_point/size_and_alpha_aes-1.png" title="center" alt="center" style="display: block; margin: auto;" />

This makes it much easier to see the clustering of larger cars in the bottom right while not reducing the importance of those points in the top left! This is my favorite use of the alpha aesthetic in ggplot: adding transparency to get more insight into dense regions of points. 


## Aesthetic mappings vs. parameters in ggplot

Above, we saw that we are able to use `color` in two different ways with geom_point. First, we were able to set the color of our points to blue by specifying `color = 'blue'` *outside* of our `aes()` mappings. Then, we were able to *map* the variable `am` to color by specifying `color = am` *inside* of our `aes()` mappings. 

Similarly, we saw two different ways to use the `alpha` aesthetic as well. First, we *mapped* the variable `cyl` to alpha by specifying `alpha = cyl` *inside* of our `aes()` mappings. Then, we set the alpha of all points to 0.3 by specifying `alpha = 0.3` *outside* of our `aes()` mappings. 

What is the difference between these two ways of dealing with the aesthetic mappings available to us?

Each of the aesthetic mappings you've seen can also be used as a *parameter*, that is, a fixed value defined outside of the `aes()` aesthetic mappings. You saw how to do this with color when we made the scatter plot points blue with `color = 'blue'` above. Then, you saw how to do this with alpha when we set the transparency to 0.3 with `alpha = 0.3`. Now let's look at an example of how to do this with shape in the same manner:


```r
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg), shape = 18)
```

<img src="/figures/20190422_ggplot_geom_point/shape_parameter-1.png" title="center" alt="center" style="display: block; margin: auto;" />

Here, we specify to use shape 18, which corresponds to this diamond shape you see here. Because we specified this *outside* of the `aes()`, this applies to all of the points in this graph!

To review what values `shape`, `size`, and `alpha` accept, just run `?shape`, `?size`, or `?alpha` from your console window! For even more details, check out `vignette("ggplot2-specs")`


## Common errors with aesthetic mappings and parameters in ggplot

When I was first learning R and ggplot, the difference between aesthetic mappings (the values included *inside* your `aes()`), and parameters (the ones *outside* your `aes()`) was constantly confusing me. Luckily, over time, you'll find that this becomes second nature. But in the meantime, I can help you speed along this process with a few common errors that you can keep an eye out for.

##### Trying to include aesthetic mappings *outside* your `aes()` call

If you're trying to map the `cyl` variable to `shape`, you should include `shape = cyl` within the `aes()` of your `geom_point` call. What happens if you include it outside accidentally, and instead run `ggplot(mtcars) + geom_point(aes(x = wt, y = mpg), shape = cyl)`? You'll get an error message that looks like this:

<center>
![ggplot geom_line error message](../images/20190422_geom_point/error_1.png){width=600px}
</center>

Whenever you see this error about object not found, be sure to check that you're including your aesthetic mappings *inside* the `aes()` call!


##### Trying to specify parameters *inside* your `aes()` call

On the other hand, if we try including a specific parameter value (for example, `color = 'blue'`) inside of the `aes()` mapping, the error is a bit less obvious. Take a look:


```r
ggplot(mtcars) + 
    geom_point(aes(x = wt, y = mpg, color = 'blue'))
```

<img src="/figures/20190422_ggplot_geom_point/unnamed-chunk-1-1.png" title="center" alt="center" style="display: block; margin: auto;" />

In this case, `ggplot` actually does produce a scatter plot, but it's not what we intended. 

For starters, the points are all red instead of the blue we were hoping for! Also, there's a legend in the graph that simply says 'blue'. 

What's going on here? Under the hood, `ggplot` has taken the string 'blue' and effectively created a new hidden column of data where every value simple says 'blue'. Then, it's *mapped* that column to the color aesthetic, like we saw before when we specified `color = am`. This results in the legend label and the color of all the points being set, not to blue, but to the default color in `ggplot`.

If this is confusing, that's okay for now. Just remember: when you run into issues like this, double check to make sure you're including the parameters of your graph *outside* your `aes()` call!

You should now have a solid understanding of how to create a scatter plot in R using the `ggplot` scatter plot function, `geom_point`! 

Experiment with the things you've learned to solidify your understanding. You can [download my free workbook](https://mailchi.mp/213333232fb2/workbook-ggplot-scatter-plot) with the code from this article to work through on your own.

I've found that working through code on my own is the best way for me to learn new topics so that I'll actually remember them when I need to do things on my own in the future. 

[Download the workbook now](https://mailchi.mp/213333232fb2/workbook-ggplot-scatter-plot) to practice what you learned!
