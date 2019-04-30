# This workbook is built to help you master the bar chart in ggplot
# It is designed to accompany this guide on my website:
# https://michaeltoth.me/a-detailed-guide-to-the-ggplot-scatter-plot-in-r.html


################################################################################
##################### Loading Packages & Investigating Data ####################
################################################################################

# 1. Load your packages

library(tidyverse)



# 2. Investigate the dataset

head(mpg)
str(mpg)

# QUESTION: What variables are in the data, and what values do you see?



################################################################################
############################## Creating Bar Charts #############################
################################################################################

# 3. Create your first bar chart

ggplot(mpg) +
    geom_bar(aes(x = class))

# QUESTION: What can you say about the different types of cars in the dataset?



# 4. Changing bar color in a ggplot bar chart

ggplot(mpg) +
    geom_bar(aes(x = class), fill = 'blue')

# EXERCISE: Try changing the color to see how that affects your plot.
# HINT: You can try colors like 'red', 'green', or 'yellow'
# HINT: You can also try hex color codes if you have a specific color to match. 
# HINT: Try: '#0FA173' for the color above. Don't forget the #
# HINT: Look up your own hex color codes here: https://htmlcolorcodes.com/color-picker/



# 5. Stacked Bar Chart: Map the variable drv (front-, back-, 4-wheel drive) to a color

ggplot(mpg) +
    geom_bar(aes(x = class, fill = drv))

# QUESTION: Why does this graph produce multiple colors, when the prior graph produced only one?
# EXERCISE: Try replacing `drv` with a different variable to see what happens
# HINT: Try using a categorical variable like trans



# 6. Stacked Bar Chart: Map the variable cyl (4-, 6-, 8-cylinder engine) to a color

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)))

# EXERCISE: Run the two blocks of code below and compare their output
# HINT: Look at the color scale in the legend!
# QUESTION: Why did we map the variable cyl above to a factor? 
# HINT: Stacked bar charts don't work well with continuous variables
# HINT: A color scale for a categorical variable is a series of discrete colors

# Code block 1

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = cyl))


# Code block 2

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)))



# 7. Dodged Bar Chart: Map the variable cyl (4-, 6-, 8-cylinder engine) to a color

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)), 
             position = position_dodge(preserve = 'single'))

# EXERCISE: Compare this graph with the stacked bar graph from before
# QUESTION: Name a comparison that is easier to make with each type of graph
# HINT: Think about comparisons across vehicle class and across number of cylinders!



################################################################################
################### Creating Bar Charts with a Defined y-axis ##################
################################################################################

# 8. Calculate average highway miles per gallon by class

by_hwy_mpg <- mpg %>% group_by(class) %>% summarise(hwy_mpg = mean(hwy))

# QUESTION: Which car class has the best (highest) highway mpg?



# 9. Graph highway mpg by class: introducing stat = 'identity'

ggplot(by_hwy_mpg) + 
    geom_bar(aes(x = class, y = hwy_mpg), stat = 'identity')

# EXERCISE: Try running this code without stat = 'identity'. 
# QUESTION: What happened?
# QUESTION: What do you think this error message means?
# HINT: Check the blog post for more information!



# 10. Graph highway mpg by class: introducing geom_col

ggplot(by_hwy_mpg) + 
    geom_col(aes(x = class, y = hwy_mpg))

# EXERCISE: Compare this code to the code above from step 8
# QUESTION: Which code changes did you find
# QUESTION: Why are these two graphs the same?
# HINT: Read the description for geom_col by running ?geom_col in your console



################################################################################
################### Aesthetics and Parameters for Bar Charts ###################
################################################################################

# 11. Introducing the color parameter for a bar chart

ggplot(mpg) +
    geom_bar(aes(x = class), color = 'blue')

# QUESTION: When might you use color instead of, or in addition to, fill?



# 12. Applying color and fill parameters to the same chart

ggplot(mpg) +
    geom_bar(aes(x = class), fill = '#003366', color = '#add8e6')



# 13. WORKBOOK BONUS: Mapping drv to the color aesthetic

ggplot(mpg) + 
    geom_bar(aes(x = class, color = drv), fill = 'white')

# QUESTION: Do you prefer this style of stacked bar graph or the filled stacked bar we saw before?



# 14. WORKBOOK BONUS: Mapping drv to the alpha aesthetic to add transparency

ggplot(mpg) + 
    geom_bar(aes(x = class, alpha = drv))

# QUESTION: Does this use of alpha improve or reduce the readability of this graph?



################################################################################
############# Common Errors with Aesthetic Mappings and Parameters #############
################################################################################

# 15. Error: Trying to include aesthetic mappings *outside* your `aes()` call

ggplot(mpg) + geom_bar(aes(x = class), fill = drv)

# EXERCISE: Why do you think this code returns an error? 
# HINT: Are we including our call to 'fill' in the right place?
# QUESTION: How can you fix this error?



# 12. Error: Trying to specify parameters *inside* your `aes()` call

ggplot(mpg) + 
    geom_bar(aes(x = class, fill = 'blue'))

# EXERCISE: Why doesn't this code color our graph in blue?
# HINT: Are we including our call to 'fill' in the right place?
# QUESTION: How can you fix this issue?