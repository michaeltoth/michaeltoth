# This workbook is built to help you practice working with colors and color scales in ggplot
# It is designed to accompany this guide on my website:
# https://michaeltoth.me/a-detailed-guide-to-ggplot-colors.html


################################################################################
##################### Loading Packages & Investigating Data ####################
################################################################################

# 1. Load your packages

library(tidyverse)



# 2. Investigate the dataset

head(iris)
str(iris)

# QUESTION: What variables are in the data?
# QUESTION: Which variables are continuous data, and which are categorical?



################################################################################
############################ Changing Static Colors ############################
################################################################################

# 3. Create a base scatter plot graph with no color specified

ggplot(iris) + 
    geom_point(aes(x = Sepal.Width, y = Sepal.Length))

# QUESTION: If you don't specify a color, what is the default color for points in ggplot?



# 4. Create a base bar graph with no color specified

ggplot(mpg) +
    geom_bar(aes(x = class))

# QUESTION: If you don't specify a color, what is the default color for bars in ggplot?



# 5. Setting a static color for scatter plots

ggplot(iris) + 
    geom_point(aes(x = Sepal.Width, y = Sepal.Length), color = 'red')



# 6. Setting a static color for bar graphs

ggplot(mpg) +
    geom_bar(aes(x = class), fill = 'red')

# QUESTION: Compare the 2 above codes. Why do we use "color = 'red'" for scatter plots 
#           and "fill = 'red" for the bar graph?
# HINT: Change the "fill" to "color" for the bar graph. What happens?



################################################################################
########################## Mapping Variables to Colors #########################
################################################################################

# 7. Generating random data

df <- data.frame(
x = runif(100),       # 100 uniformly distributed random values
y = runif(100),       # 100 uniformly distributed random values
z1 = rnorm(100),      # 100 normally distributed random values
z2 = abs(rnorm(100))  # 100 normally distributed random values mapped to positive
)

# EXERCISE: Use the glimpse, str, min, and max functions to review this random data
# QUESTION: What are the minimum and maximum values in each column?



# 8. Mapping continuous data to the default color gradient in ggplot

ggplot(df, aes(x, y)) +
    geom_point(aes(color = z2))

# EXERCISE: Compare this code to the code from # 5 above. What differences do you see?
# QUESTION: How do you specify a static color and how do you specify a color mapping?
# HINT: It has something to do with the "aes" function!
# QUESTION: What is the default ggplot color scale for continuous data? 
# HINT: It's the scale used in this graph!



# 9. Specifying a custom sequential color scale for continuous data in ggplot

ggplot(df, aes(x, y)) +
    geom_point(aes(color = z2)) +
    scale_color_gradient(low = 'greenyellow', high = 'forestgreen')

# QUESTION: How do we customize the color gradient that ggplot uses?
# QUESTION: What function would you use if you were working with a bar graph?
# HINT: The difference is color vs. fill!
# EXERCISE: Try modifying the colors in the scale_fill_gradient function.
# QUESTION: Which combinations seem to work well and which don't?



# 10. Specifying a custom diverging color scale for continuous data in ggplot

ggplot(df, aes(x, y)) +
    geom_point(aes(colour = z1)) +
    scale_color_gradient2(low = 'blue', mid = 'white', high = 'red')

# QUESTION: When might you prefer to use a diverging scale over a sequential scale?
# QUESTION: What about a sequential scale over a diverging scale?
# EXERCISE: Try modifying the colors in the scale_fill_gradient2 function.
# QUESTION: Which combinations seem to work well and which don't?



# 11. Mapping Categorical Data to Color in ggplot

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(aes(color = factor(cyl)))

# QUESTION: Why do we use factor when mapping the cyl variable to color
# HINT: What happens if you don't use factor? 
# QUESTION: What is the default ggplot color scale for categorical data?



# 12. Specifying a manual color scale for categorical data in ggplot
colors <- c("4" = "#D9717D", "6" = "#4DB6D0", "8" = "#BECA55")

ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point(aes(colour = factor(cyl))) +
    scale_color_manual(values = colors)

# EXERCISE: CREATE YOUR OWN 3-COLOR PALETTE AT http://tristen.ca/hcl-picker/#/hlc/3/1.05/D9717D/BECA55
# EXERCISE: Modify the colors vector above to use your custom palette