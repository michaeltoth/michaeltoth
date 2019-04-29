# STATUS: IN PROGRESS, DO NOT USE

# This workbook is built to help you master the scatter plot in ggplot
# It is designed to accompany this guide on my website:
# https://michaeltoth.me/a-detailed-guide-to-the-ggplot-scatter-plot-in-r.html


################################################################################
##################### Loading Packages & Investigating Data ####################
################################################################################

# 1. Load your packages

library(tidyverse)



# 2. Investigate the dataset

head(mtcars)
str(mtcars)

# QUESTION: What variables are in the data, and what values do you see?



################################################################################
############################ Creating Scatter Plots ############################
################################################################################

# 3. Create your first scatter plot

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg))

# QUESTION: What can you say about the relationship between weight and mpg for a car?



# 4. Changing point color in a ggplot scatter plot

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg), color = 'blue')

# EXERCISE: Try changing the color to see how that affects your plot.
# HINT: You can try colors like 'red', 'green', or 'yellow'
# HINT: You can also try hex color codes if you have a specific color to match. 
# HINT: Try: '#0FA173' for the color above. Don't forget the #
# HINT: Look up your own hex color codes here: https://htmlcolorcodes.com/color-picker/



# 5. Map the variable am (automatic / manual transmission) to a color
mtcars$am <- factor(mtcars$am)

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, color = am))

# EXERCISE: Run the two blocks of code below and compare their output
# HINT: Look at the color scale in the legend!
# QUESTION: Why did we map the variable am above to a factor? 

# Code block 1
data(mtcars)
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, color = am))

# Code block 2
mtcars$am <- factor(mtcars$am)
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, color = am))



# 6. Changing point shapes in a ggplot scatter plot
mtcars$am <- factor(mtcars$am)
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, shape = am))

# QUESTION: When might you choose to use shape instead of color?



# 7. Changing the size aesthetic mapping in a ggplot scatter plot

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, size = cyl))

# QUESTION: How does modifying the size in this scatter plot affect readability?



# 8. Changing transparency in a ggplot scatter plot with the alpha aesthetic
    
ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, alpha = cyl))

# QUESTION: Do you think this transparency makes this graph easier or harder to understand? Why?



# 9. Changing transparency for all points in the graph

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, size = cyl), alpha = 0.3)

# QUESTION: How does this transparency improve the legibility of the points in the bottom right?
# QUESTION: Does this solve the readability issues you identified before?


# 10. Aesthetic mappings vs. parameters in ggplot

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg), shape = 18)

ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, shape = am))

# QUESTION: What difference do you see in the code above? Why do you think the plots are different?
# HINT: It's related to including shape either INSIDE or OUTSIDE the aes()!


################################################################################
############# Common Errors with Aesthetic Mappings and Parameters #############
################################################################################

# 11. Error: Trying to include aesthetic mappings *outside* your `aes()` call

ggplot(mtcars) + geom_point(geom_point(aes(x = wt, y = mpg), shape = cyl))

# EXERCISE: Why do you think this code returns an error? 
# HINT: Are we including our call to 'shape' in the right place?
# QUESTION: How can you fix this error?



# 12. Error: Trying to specify parameters *inside* your `aes()` call

ggplot(mtcars) + 
    geom_point(aes(x = wt, y = mpg, color = 'blue'))

# EXERCISE: Why do you think this code returns an error? 
# HINT: Are we including our call to 'color' in the right place?
# QUESTION: How can you fix this error?







## Investigating our dataset
# Add some exploratory code

# Our first bar chart
library(tidyverse)

ggplot(mpg) +
geom_bar(aes(x = class))

# Fill in blue
ggplot(mpg) +
    geom_bar(aes(x = class), fill = 'blue')

# Stacked bar with fill = drv
ggplot(mpg) +
geom_bar(aes(x = class, fill = drv))

# CYL Stacked bar with 4 segments
# Note we convert the cyl variable to a factor to fill properly
ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)))

# Dodged bar chart
# Note we convert the cyl variable to a factor here in order to fill by cylinder
ggplot(mpg) + 
    geom_bar(aes(x = class, fill = factor(cyl)), position = position_dodge(preserve = 'single'))

## Scaling bar size to a variable in your data

# Introduce stat identity
# Use dplyr to calculate the average hwy_mpg by class
by_hwy_mpg <- mpg %>% group_by(class) %>% summarise(hwy_mpg = mean(hwy))

ggplot(by_hwy_mpg) + 
geom_bar(aes(x = class, y = hwy_mpg), stat = 'identity')
    
# Demonstrate geom_col
# Use dplyr to calculate the average hwy_mpg by class
by_hwy_mpg <- mpg %>% group_by(class) %>% summarise(hwy_mpg = mean(hwy))

ggplot(by_hwy_mpg) + 
    geom_col(aes(x = class, y = hwy_mpg))

# color
ggplot(mpg) +
    geom_bar(aes(x = class), color = 'blue')

# color_and_fill
ggplot(mpg) +
    geom_bar(aes(x = class), fill = '#003366', color = '#add8e6')

##### Details of other aesthetics, x, y, fill, color, group, linetype, alpha

##### Trying to include aesthetic mappings *outside* your `aes()` call

ggplot(mpg) + geom_bar(aes(x = class), fill = drv)

##### Trying to specify parameters *inside* your `aes()` call
ggplot(mpg) + 
    geom_bar(aes(x = class, fill = 'blue'))