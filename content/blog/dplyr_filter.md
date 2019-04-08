---
title: How to Filter in R: A Detailed Introduction to the dplyr Filter Function
author: Michael Toth
date: 2019-04-08
category: R
tags: R, dplyr, filter, How To
output: html_document
---

Data wrangling. It's the process of getting your raw data transformed into a format that's easier to work with for analysis. 

It's not the sexiest or the most exciting work. 

In our dreams, all datasets come to us perfectly formatted and ready for all kinds of sophisticated analysis! In real life, not so much. 

It's estimated that as much as 75% of a data scientist's time is spent data wrangling. To be an effective data scientist, you need to be good at this, and you need to be FAST.

One of the most basic data wrangling tasks is filtering data. Starting from a large dataset, and reducing it to a smaller, more manageable dataset, based on some criteria. 

Think of filtering your sock drawer by color, and pulling out only the black socks. 

Whenever I need to filter in R, I turn to the `dplyr filter` function.

As is often the case in programming, there are many ways to filter in R. But the `dplyr filter` function is by far my favorite, and it's the method I use the vast majority of the time.

Why do I like it so much? It has a user-friendly syntax, is easy to work with, and it plays very nicely with the other dplyr functions.


## A brief introduction to dplyr

Before I go into detail on the `dplyr filter` function, I want to briefly introduce dplyr as a whole to give you some context. 

dplyr is a cohesive set of data manipulation functions that will help make your data wrangling as painless as possible. 

dplyr, at its core, consists of 5 functions, all serving a distinct data wrangling purpose:

* `filter()` selects rows based on their values
* `mutate()` creates new variables
* `select()` picks columns by name
* `summarise()` calculates summary statistics
* `arrange()` sorts the rows

The beauty of dplyr is that the syntax of all of these functions is very similar, and they all work together nicely. 

If you master these 5 functions, you'll be able to handle nearly any data wrangling task that comes your way. But we need to tackle them one at a time, so now: let's learn to filter in R using dplyr!


## Loading Our Data

In this post, I'll be using the `diamonds` dataset, a dataset built into the ggplot package, to illustrate the best use of the `dplyr filter` function. To start, let's take a look at the data:




```r
library(dplyr)
library(ggplot2)

diamonds
```

```
## # A tibble: 53,940 x 10
##    carat cut       color clarity depth table price     x     y     z
##    <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
##  2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
##  3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
##  4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
##  5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
##  6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
##  7 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47
##  8 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53
##  9 0.22  Fair      E     VS2      65.1    61   337  3.87  3.78  2.49
## 10 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39
## # … with 53,930 more rows
```

We can see that the dataset gives characteristics of individual diamonds, including their carat, cut, color, clarity, and price. 


## Our First dplyr Filter Operation

I'm a big fan of learning by doing, so we're going to dive in right now with our first `dplyr filter` operation.

From our `diamonds` dataset, we're going to filter only those rows where the diamond cut is 'Ideal':


```r
filter(diamonds, cut == 'Ideal')
```

```
## # A tibble: 21,551 x 10
##    carat cut   color clarity depth table price     x     y     z
##    <dbl> <ord> <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1  0.23 Ideal E     SI2      61.5    55   326  3.95  3.98  2.43
##  2  0.23 Ideal J     VS1      62.8    56   340  3.93  3.9   2.46
##  3  0.31 Ideal J     SI2      62.2    54   344  4.35  4.37  2.71
##  4  0.3  Ideal I     SI2      62      54   348  4.31  4.34  2.68
##  5  0.33 Ideal I     SI2      61.8    55   403  4.49  4.51  2.78
##  6  0.33 Ideal I     SI2      61.2    56   403  4.49  4.5   2.75
##  7  0.33 Ideal J     SI1      61.1    56   403  4.49  4.55  2.76
##  8  0.23 Ideal G     VS1      61.9    54   404  3.93  3.95  2.44
##  9  0.32 Ideal I     SI1      60.9    55   404  4.45  4.48  2.72
## 10  0.3  Ideal I     SI2      61      59   405  4.3   4.33  2.63
## # … with 21,541 more rows
```

As you can see, every diamond in the returned data frame is showing a cut of 'Ideal'. It worked! We'll cover exactly what's happening here in more detail, but first let's briefly review how R works with logical and relational operators, and how we can use those to efficiently filter in R.


## A brief aside on logical and relational operators in R and dplyr

In dplyr, filter takes in 2 arguments:  

* The dataframe you are operating on  
* A conditional expression that evaluates to `TRUE` or `FALSE`  

In the example above, we specified `diamonds` as the dataframe, and `cut == 'Ideal'` as the conditional expression

Conditional expression? What am I talking about?

Under the hood, `dplyr filter` works by testing each row against your conditional expression and mapping the results to `TRUE` and `FALSE`. It then selects all rows that evaluate to `TRUE`. 

In our first example above, we checked that the diamond cut was Ideal with the conditional expression `cut == 'Ideal'`. For each row in our data frame, dplyr checked whether the column `cut` was set to `'Ideal'`, and returned only those rows where `cut == 'Ideal'` evaluated to `TRUE`. 

In our first filter, we used the operator `==` to test for equality. That's not the only way we can use dplyr to filter our data frame, however. We can use a number of different **relational operators** to filter in R.

**Relational operators** are used to compare values. In R generally (and in dplyr specifically), those are:

* `==` (Equal to)
* `!=` (Not equal to)
* `<`  (Less than)
* `<=` (Less than or equal to)
* `>`  (Greater than)
* `>=` (Greater than or equal to)

These are standard mathematical operators you're used to, and they work as you'd expect. One quick note: make sure you use the double equals sign (`==`) for comparisons! By convention, a single equals sign (`=`) is used to assign a value to a variable, and a double equals sign (`==`) is used to check whether two values are equal. Using a single equals sign will often give an error message that is not intuitive, so make sure you check for this common error!

dplyr can also make use of the following **logical operators** to string together multiple different conditions in a single `dplyr filter` call!

* `!` (logical NOT)
* `&` (logical AND)
* `|` (logical OR)

There are two additional operators that will often be useful when working with dplyr to filter:

* `%in%`    (Checks if a value is in an array of multiple values)
* `is.na()` (Checks whether a value is NA)

In our first example above, we tested for equality when we said `cut == 'Ideal'`. Now, let's expand our capabilities with different relational parameters in our filter:


```r
filter(diamonds, price > 2000)
```

```
## # A tibble: 29,733 x 10
##    carat cut       color clarity depth table price     x     y     z
##    <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1  0.7  Ideal     E     SI1      62.5    57  2757  5.7   5.72  3.57
##  2  0.86 Fair      E     SI2      55.1    69  2757  6.45  6.33  3.52
##  3  0.7  Ideal     G     VS2      61.6    56  2757  5.7   5.67  3.5 
##  4  0.71 Very Good E     VS2      62.4    57  2759  5.68  5.73  3.56
##  5  0.78 Very Good G     SI2      63.8    56  2759  5.81  5.85  3.72
##  6  0.7  Good      E     VS2      57.5    58  2759  5.85  5.9   3.38
##  7  0.7  Good      F     VS1      59.4    62  2759  5.71  5.76  3.4 
##  8  0.96 Fair      F     SI2      66.3    62  2759  6.27  5.95  4.07
##  9  0.73 Very Good E     SI1      61.6    59  2760  5.77  5.78  3.56
## 10  0.8  Premium   H     SI1      61.5    58  2760  5.97  5.93  3.66
## # … with 29,723 more rows
```

Here, we select only the diamonds where the price is greater than 2000.


```r
filter(diamonds, cut != 'Ideal')
```

```
## # A tibble: 32,389 x 10
##    carat cut       color clarity depth table price     x     y     z
##    <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
##  2 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
##  3 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
##  4 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
##  5 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
##  6 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47
##  7 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53
##  8 0.22  Fair      E     VS2      65.1    61   337  3.87  3.78  2.49
##  9 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39
## 10 0.3   Good      J     SI1      64      55   339  4.25  4.28  2.73
## # … with 32,379 more rows
```

And here, we select all the diamonds whose cut is NOT equal to 'Ideal'. Note that this is the exact opposite of what we filtered before. 

You can use `<`, `>`, `<=`, `>=`, `==`, and `!=` in similar ways to filter your data. Try a few examples on your own to get comfortable with the different filtering options!


## A note on storing your results

By default, dplyr filter will perform the operation you ask and then print the result to the screen. If you prefer to store the result in a variable, you'll need to assign it as follows:


```r
e_diamonds <- filter(diamonds, color == 'E')
```

Note that you can also overwrite the dataset (that is, assign the result back to the `diamonds` data frame) if you don't want to retain the unfiltered data. In this case I want to keep it, so I'll store this result in `e_diamonds`. In any case, it's always a good idea to preview your `dplyr filter` results before you overwrite any data!


## Filtering Numeric Variables

Numeric variables are the quantitative variables in a dataset. In the diamonds dataset, this includes the variables carat and price, among others. When working with numeric variables, it is easy to filter based on ranges of values. For example, if we wanted to get any diamonds priced between 1000 and 1500, we could easily filter as follows:


```r
filter(diamonds, price >= 1000 & price <= 1500)
```

```
## # A tibble: 5,511 x 10
##    carat cut       color clarity depth table price     x     y     z
##    <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1 0.38  Very Good E     VVS2     61.8    56  1000  4.66  4.68  2.88
##  2 0.39  Very Good F     VS1      57.1    61  1000  4.86  4.91  2.79
##  3 0.38  Very Good E     VS1      61.5    58  1000  4.64  4.69  2.87
##  4 0.38  Premium   E     VS1      60.7    59  1000  4.65  4.7   2.84
##  5 0.38  Ideal     E     VS1      61.6    56  1000  4.65  4.67  2.87
##  6 0.53  Very Good G     SI2      62.5    55  1000  5.14  5.19  3.23
##  7 0.570 Very Good I     SI2      62.1    57  1000  5.29  5.33  3.3 
##  8 0.38  Ideal     E     VS1      61.9    56  1000  4.63  4.67  2.88
##  9 0.5   Good      E     SI2      63.2    61  1000  5.02  5.05  3.18
## 10 0.3   Ideal     D     VVS1     61.3    57  1000  4.29  4.32  2.64
## # … with 5,501 more rows
```

In general, when working with numeric variables, you'll most often make use of the inequality operators, `>`, `<`, `>=`, and `<=`. While it is possible to use the `==` and `!=` operators with numeric variables, I generally recommend against it. 

The issue with using `==` is that it will only return true of the value is exactly equal to what you're testing for. If the dataset you're testing against consists of integers, this is possible, but if you're dealing with decimals, this will often break down. For example, `1.0100000001 == 1.01` will evaluate to `FALSE`. This is technically true, but it's easy to get into trouble with decimal precision. I never use `==` when working with numerical variables unless the data I am working with consists of integers only!


## Filtering Categorical Variables

Categorical variables are non-quantitative variables. In our example dataset, the columns cut, color, and clarity are categorical variables. In contrast to numerical variables, the inequalities `>`, `<`, `>=` and `<=` have no meaning here. Instead, you'll make frequent use of the `==`, `!=`, and `%in%` operators when filtering categorical variables. 

Above, we filtered the dataset to include only the diamonds whose cut was Ideal using the `==` operator. Let's say that we wanted to expand this filter to also include diamonds where the cut is Premium. To accomplish this, we would use the `%in%` operator:


```r
filter(diamonds, cut %in% c('Ideal', 'Premium'))
```

```
## # A tibble: 35,342 x 10
##    carat cut     color clarity depth table price     x     y     z
##    <dbl> <ord>   <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1 0.23  Ideal   E     SI2      61.5    55   326  3.95  3.98  2.43
##  2 0.21  Premium E     SI1      59.8    61   326  3.89  3.84  2.31
##  3 0.290 Premium I     VS2      62.4    58   334  4.2   4.23  2.63
##  4 0.23  Ideal   J     VS1      62.8    56   340  3.93  3.9   2.46
##  5 0.22  Premium F     SI1      60.4    61   342  3.88  3.84  2.33
##  6 0.31  Ideal   J     SI2      62.2    54   344  4.35  4.37  2.71
##  7 0.2   Premium E     SI2      60.2    62   345  3.79  3.75  2.27
##  8 0.32  Premium E     I1       60.9    58   345  4.38  4.42  2.68
##  9 0.3   Ideal   I     SI2      62      54   348  4.31  4.34  2.68
## 10 0.24  Premium I     VS1      62.5    57   355  3.97  3.94  2.47
## # … with 35,332 more rows
```

How does this work? First, we create a vector of our desired cut options, `c('Ideal', 'Premium')`. Then, we use %in% to filter only those diamonds whose cut is in that vector. dplyr will filter out BOTH those diamonds whose cut is Ideal AND those diamonds whose cut is Premium. The vector you check against for the %in% function can be arbitrarily long, which can be very useful when working with categorical data. 

It's also important to note that the vector can be defined before you perform the dplyr filter operation:


```r
cuts_to_include <- c('Good', 'Very Good', 'Ideal', 'Premium')
filter(diamonds, cut %in% cuts_to_include)
```

```
## # A tibble: 52,330 x 10
##    carat cut       color clarity depth table price     x     y     z
##    <dbl> <ord>     <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1 0.23  Ideal     E     SI2      61.5    55   326  3.95  3.98  2.43
##  2 0.21  Premium   E     SI1      59.8    61   326  3.89  3.84  2.31
##  3 0.23  Good      E     VS1      56.9    65   327  4.05  4.07  2.31
##  4 0.290 Premium   I     VS2      62.4    58   334  4.2   4.23  2.63
##  5 0.31  Good      J     SI2      63.3    58   335  4.34  4.35  2.75
##  6 0.24  Very Good J     VVS2     62.8    57   336  3.94  3.96  2.48
##  7 0.24  Very Good I     VVS1     62.3    57   336  3.95  3.98  2.47
##  8 0.26  Very Good H     SI1      61.9    55   337  4.07  4.11  2.53
##  9 0.23  Very Good H     VS1      59.4    61   338  4     4.05  2.39
## 10 0.3   Good      J     SI1      64      55   339  4.25  4.28  2.73
## # … with 52,320 more rows
```

This helps to increase the readability of your code when you're filtering against a larger set of potential options. This also means that if you have an existing vector of options from another source, you can use this to filter your dataset. This can come in very useful as you start working with multiple datasets in a single analysis!

## Chaining together multiple filtering operations with logical operators

The real power of the dplyr filter function is in its flexibility. Using the logical operators &, |, and !, we can group many filtering operations in a single command to get the exact dataset we want!

Let's say we want to select all diamonds where the cut is Ideal and the carat is greater than 1:


```r
filter(diamonds, cut == 'Ideal' & carat > 1)
```

```
## # A tibble: 5,662 x 10
##    carat cut   color clarity depth table price     x     y     z
##    <dbl> <ord> <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1  1.01 Ideal I     I1       61.5    57  2844  6.45  6.46  3.97
##  2  1.02 Ideal H     SI2      61.6    55  2856  6.49  6.43  3.98
##  3  1.02 Ideal I     I1       61.7    56  2872  6.44  6.49  3.99
##  4  1.02 Ideal J     SI2      60.3    54  2879  6.53  6.5   3.93
##  5  1.01 Ideal I     I1       61.5    57  2896  6.46  6.45  3.97
##  6  1.02 Ideal I     I1       61.7    56  2925  6.49  6.44  3.99
##  7  1.14 Ideal J     SI1      60.2    57  3045  6.81  6.71  4.07
##  8  1.02 Ideal H     SI2      58.8    57  3142  6.61  6.55  3.87
##  9  1.06 Ideal I     SI2      62.8    55  3146  6.51  6.46  4.07
## 10  1.02 Ideal I     VS2      62.8    57  3148  6.45  6.39  4.03
## # … with 5,652 more rows
```

BOTH conditions must evaluate to `TRUE` for the data to be selected. That is, the cut must be Ideal, and the carat must be greater than 1. 

You don't need to limit yourself to two conditions either. You can have as many as you want! Let's say we also wanted to make sure the color of the diamond was E. We can extend our example:


```r
filter(diamonds, cut == 'Ideal' & carat > 1 & color == 'E')
```

```
## # A tibble: 531 x 10
##    carat cut   color clarity depth table price     x     y     z
##    <dbl> <ord> <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1  1.25 Ideal E     I1       60.9    56  3276  6.95  6.91  4.22
##  2  1.01 Ideal E     I1       62      57  3388  6.37  6.41  3.96
##  3  1.01 Ideal E     I1       62      57  3450  6.41  6.37  3.96
##  4  1.02 Ideal E     SI2      62.3    56  3455  6.42  6.37  3.98
##  5  1.04 Ideal E     SI2      59      57  3588  6.65  6.6   3.91
##  6  1.13 Ideal E     I1       62      55  3729  6.66  6.7   4.14
##  7  1.09 Ideal E     SI2      59.4    57  3760  6.74  6.65  3.98
##  8  1.13 Ideal E     I1       62      55  3797  6.7   6.66  4.14
##  9  1.12 Ideal E     SI2      60.9    57  3864  6.66  6.6   4.04
## 10  1.1  Ideal E     I1       61.9    56  3872  6.59  6.63  4.09
## # … with 521 more rows
```

What if we wanted to select rows where the cut is ideal OR the carat is greater than 1? Then we'd use the | operator!


```r
filter(diamonds, cut == 'Ideal' | carat > 1)
```

```
## # A tibble: 33,391 x 10
##    carat cut   color clarity depth table price     x     y     z
##    <dbl> <ord> <ord> <ord>   <dbl> <dbl> <int> <dbl> <dbl> <dbl>
##  1  0.23 Ideal E     SI2      61.5    55   326  3.95  3.98  2.43
##  2  0.23 Ideal J     VS1      62.8    56   340  3.93  3.9   2.46
##  3  0.31 Ideal J     SI2      62.2    54   344  4.35  4.37  2.71
##  4  0.3  Ideal I     SI2      62      54   348  4.31  4.34  2.68
##  5  0.33 Ideal I     SI2      61.8    55   403  4.49  4.51  2.78
##  6  0.33 Ideal I     SI2      61.2    56   403  4.49  4.5   2.75
##  7  0.33 Ideal J     SI1      61.1    56   403  4.49  4.55  2.76
##  8  0.23 Ideal G     VS1      61.9    54   404  3.93  3.95  2.44
##  9  0.32 Ideal I     SI1      60.9    55   404  4.45  4.48  2.72
## 10  0.3  Ideal I     SI2      61      59   405  4.3   4.33  2.63
## # … with 33,381 more rows
```

Any time you want to filter your dataset based on some combination of logical statements, this is possibly using the `dplyr filter` function and R's built-in logical parameters. You just need to figure out how to combine your logical expressions to get exactly what you want!

## Conclusion

`dplyr filter` is one of my most-used functions in R in general, and especially when I am looking to filter in R. With this article you should have a solid overview of how to filter a dataset, whether your variables are numerical, categorical, or a mix of both. Practice what you learned right now to make sure you cement your understanding of how to effectively filter in R using dplyr!

------

Did you find this post useful? I frequently write tutorials like this one to help you learn new skills and improve your data science. If you want to be notified of new tutorials, [sign up here!](http://eepurl.com/gmYioz)

----- 

I help technology companies to leverage their data to produce branded, influential content to share with their clients. I work on everything from investor newsletters to blog posts to research papers. If you enjoy the work I do and are interested in working together, you can visit my <a href="https://www.michaeltothanalytics.com" target="_blank">consulting website</a> or contact me at <a href="mailto:michael@michaeltothanalytics.com">michael@michaeltothanalytics.com</a>!
