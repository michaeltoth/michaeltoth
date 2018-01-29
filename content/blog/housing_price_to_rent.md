---
title: Price to Rent Ratios Around the Country
author: Michael Toth
date: 2017-06-26
category: R
tags: R, Housing, Mortgage, Economics
summary: An analysis of price-to-rent ratios, typically used to assess the buy-vs-rent tradeoff, around the United States
output: html_document
status: draft
---




```r
prices <- read_csv('~/Downloads/Metro_Zhvi_AllHomes.csv')
```

```
## Parsed with column specification:
## cols(
##   .default = col_integer(),
##   RegionName = col_character()
## )
```

```
## See spec(...) for full column specifications.
```

```r
rents <- read_csv('~/Downloads/Metro_Zri_AllHomesPlusMultifamily.csv')
```

```
## Parsed with column specification:
## cols(
##   .default = col_integer(),
##   RegionName = col_character()
## )
## See spec(...) for full column specifications.
```

```r
# The SizeRank field is slightly different across datasets, though still valuable. I'm going to arbitrarily select the SizeRank from the prices data to keep
prices <- prices %>% gather(Month, Price, c(4:ncol(prices)))
rents <- rents %>% gather(Month, Rent, c(4:ncol(rents)))

# Remove any entries where we do not have both pricing and rent data
housing <- merge(prices, rents, sort = F) %>% filter(!is.na(Price), !is.na(Rent)) %>% mutate(PriceToRent = Price / (Rent * 12))

housing_201612 <- filter(housing, Month == '2016-12', SizeRank <= 500) 

ggplot(housing_201612, aes(x = Price, y = Rent)) + geom_point()
```

![center](/figures/housing_price_to_rent/load-1.png)

```r
filter(housing_201612, Price <= 250000, PriceToRent < 10)
```

```
##   RegionID       RegionName SizeRank   Month  Price Rent PriceToRent
## 1   394692      Houston, TX        6 2016-12 175800 1555    9.421222
## 2   394532      Detroit, MI       12 2016-12 135700 1169    9.673510
## 3   395055  San Antonio, TX       26 2016-12 156800 1324    9.869084
## 4   394466   Cincinnati, OH       28 2016-12 148800 1249    9.927942
## 5   394475    Cleveland, OH       29 2016-12 130800 1143    9.536308
## 6   394705 Indianapolis, IN       33 2016-12 134800 1185    9.479606
## 7   394849      Memphis, TN       41 2016-12 117600 1052    9.315589
```

```r
p1 <- ggplot(housing, aes(x = Price, y = Rent, frame = Month)) + 
  geom_point() +
  scale_y_continuous(name = 'Median Monthly Rent', labels = dollar) +
  scale_x_continuous(name = 'Median Home Price', labels = dollar) +
  labs(title = 'Relationship between Home Price 
and Monthly Rent: ',
       caption = 'Source: michaeltoth.me
       Data: Zillow Research Home Value Index and Zillow Rental Index Time Series Data
       https://www.zillow.com/research/data/') +
  theme_ipsum()
gganimate(p1, interval = 0.2)
```

![center](/figures/housing_price_to_rent/load-2.png)![center](/figures/housing_price_to_rent/load-3.png)![center](/figures/housing_price_to_rent/load-4.png)![center](/figures/housing_price_to_rent/load-5.png)![center](/figures/housing_price_to_rent/load-6.png)![center](/figures/housing_price_to_rent/load-7.png)![center](/figures/housing_price_to_rent/load-8.png)![center](/figures/housing_price_to_rent/load-9.png)![center](/figures/housing_price_to_rent/load-10.png)![center](/figures/housing_price_to_rent/load-11.png)![center](/figures/housing_price_to_rent/load-12.png)![center](/figures/housing_price_to_rent/load-13.png)![center](/figures/housing_price_to_rent/load-14.png)![center](/figures/housing_price_to_rent/load-15.png)![center](/figures/housing_price_to_rent/load-16.png)![center](/figures/housing_price_to_rent/load-17.png)![center](/figures/housing_price_to_rent/load-18.png)![center](/figures/housing_price_to_rent/load-19.png)![center](/figures/housing_price_to_rent/load-20.png)![center](/figures/housing_price_to_rent/load-21.png)![center](/figures/housing_price_to_rent/load-22.png)![center](/figures/housing_price_to_rent/load-23.png)![center](/figures/housing_price_to_rent/load-24.png)![center](/figures/housing_price_to_rent/load-25.png)![center](/figures/housing_price_to_rent/load-26.png)![center](/figures/housing_price_to_rent/load-27.png)![center](/figures/housing_price_to_rent/load-28.png)![center](/figures/housing_price_to_rent/load-29.png)![center](/figures/housing_price_to_rent/load-30.png)![center](/figures/housing_price_to_rent/load-31.png)![center](/figures/housing_price_to_rent/load-32.png)![center](/figures/housing_price_to_rent/load-33.png)![center](/figures/housing_price_to_rent/load-34.png)![center](/figures/housing_price_to_rent/load-35.png)![center](/figures/housing_price_to_rent/load-36.png)![center](/figures/housing_price_to_rent/load-37.png)![center](/figures/housing_price_to_rent/load-38.png)![center](/figures/housing_price_to_rent/load-39.png)![center](/figures/housing_price_to_rent/load-40.png)![center](/figures/housing_price_to_rent/load-41.png)![center](/figures/housing_price_to_rent/load-42.png)![center](/figures/housing_price_to_rent/load-43.png)![center](/figures/housing_price_to_rent/load-44.png)![center](/figures/housing_price_to_rent/load-45.png)![center](/figures/housing_price_to_rent/load-46.png)![center](/figures/housing_price_to_rent/load-47.png)![center](/figures/housing_price_to_rent/load-48.png)![center](/figures/housing_price_to_rent/load-49.png)![center](/figures/housing_price_to_rent/load-50.png)![center](/figures/housing_price_to_rent/load-51.png)![center](/figures/housing_price_to_rent/load-52.png)![center](/figures/housing_price_to_rent/load-53.png)![center](/figures/housing_price_to_rent/load-54.png)![center](/figures/housing_price_to_rent/load-55.png)![center](/figures/housing_price_to_rent/load-56.png)![center](/figures/housing_price_to_rent/load-57.png)![center](/figures/housing_price_to_rent/load-58.png)![center](/figures/housing_price_to_rent/load-59.png)![center](/figures/housing_price_to_rent/load-60.png)![center](/figures/housing_price_to_rent/load-61.png)![center](/figures/housing_price_to_rent/load-62.png)![center](/figures/housing_price_to_rent/load-63.png)![center](/figures/housing_price_to_rent/load-64.png)![center](/figures/housing_price_to_rent/load-65.png)![center](/figures/housing_price_to_rent/load-66.png)![center](/figures/housing_price_to_rent/load-67.png)![center](/figures/housing_price_to_rent/load-68.png)![center](/figures/housing_price_to_rent/load-69.png)![center](/figures/housing_price_to_rent/load-70.png)![center](/figures/housing_price_to_rent/load-71.png)![center](/figures/housing_price_to_rent/load-72.png)![center](/figures/housing_price_to_rent/load-73.png)![center](/figures/housing_price_to_rent/load-74.png)![center](/figures/housing_price_to_rent/load-75.png)![center](/figures/housing_price_to_rent/load-76.png)![center](/figures/housing_price_to_rent/load-77.png)![center](/figures/housing_price_to_rent/load-78.png)![center](/figures/housing_price_to_rent/load-79.png)

```r
gganimate(p1, "price-versus-rent.gif", interval = 0.2)
```

```
## Executing: 
## convert -loop 0 -delay 20 Rplot1.png Rplot2.png Rplot3.png
##     Rplot4.png Rplot5.png Rplot6.png Rplot7.png Rplot8.png
##     Rplot9.png Rplot10.png Rplot11.png Rplot12.png Rplot13.png
##     Rplot14.png Rplot15.png Rplot16.png Rplot17.png Rplot18.png
##     Rplot19.png Rplot20.png Rplot21.png Rplot22.png Rplot23.png
##     Rplot24.png Rplot25.png Rplot26.png Rplot27.png Rplot28.png
##     Rplot29.png Rplot30.png Rplot31.png Rplot32.png Rplot33.png
##     Rplot34.png Rplot35.png Rplot36.png Rplot37.png Rplot38.png
##     Rplot39.png Rplot40.png Rplot41.png Rplot42.png Rplot43.png
##     Rplot44.png Rplot45.png Rplot46.png Rplot47.png Rplot48.png
##     Rplot49.png Rplot50.png Rplot51.png Rplot52.png Rplot53.png
##     Rplot54.png Rplot55.png Rplot56.png Rplot57.png Rplot58.png
##     Rplot59.png Rplot60.png Rplot61.png Rplot62.png Rplot63.png
##     Rplot64.png Rplot65.png Rplot66.png Rplot67.png Rplot68.png
##     Rplot69.png Rplot70.png Rplot71.png Rplot72.png Rplot73.png
##     Rplot74.png Rplot75.png Rplot76.png Rplot77.png Rplot78.png
##     'price-versus-rent.gif'
```

```
## Output at: price-versus-rent.gif
```

```r
p2 <- ggplot(housing, aes(x = Price, y = PriceToRent, frame = Month)) + 
  geom_point() +
  scale_y_continuous(name = 'Price-to-Annual-Rent Ratio') +
  scale_x_continuous(name = 'Median Home Price', labels = dollar) +
  labs(title = 'Relationship between Home Price 
and Price-to-Rent Ratio:',
       caption = 'Source: michaeltoth.me
       Data: Zillow Research Home Value Index and Zillow Rental Index Time Series Data
       https://www.zillow.com/research/data/') +
  theme_ipsum()
gganimate(p2, 'price-versus-ptr.gif', interval = 0.2)
```

```
## Executing: 
## convert -loop 0 -delay 20 Rplot1.png Rplot2.png Rplot3.png
##     Rplot4.png Rplot5.png Rplot6.png Rplot7.png Rplot8.png
##     Rplot9.png Rplot10.png Rplot11.png Rplot12.png Rplot13.png
##     Rplot14.png Rplot15.png Rplot16.png Rplot17.png Rplot18.png
##     Rplot19.png Rplot20.png Rplot21.png Rplot22.png Rplot23.png
##     Rplot24.png Rplot25.png Rplot26.png Rplot27.png Rplot28.png
##     Rplot29.png Rplot30.png Rplot31.png Rplot32.png Rplot33.png
##     Rplot34.png Rplot35.png Rplot36.png Rplot37.png Rplot38.png
##     Rplot39.png Rplot40.png Rplot41.png Rplot42.png Rplot43.png
##     Rplot44.png Rplot45.png Rplot46.png Rplot47.png Rplot48.png
##     Rplot49.png Rplot50.png Rplot51.png Rplot52.png Rplot53.png
##     Rplot54.png Rplot55.png Rplot56.png Rplot57.png Rplot58.png
##     Rplot59.png Rplot60.png Rplot61.png Rplot62.png Rplot63.png
##     Rplot64.png Rplot65.png Rplot66.png Rplot67.png Rplot68.png
##     Rplot69.png Rplot70.png Rplot71.png Rplot72.png Rplot73.png
##     Rplot74.png Rplot75.png Rplot76.png Rplot77.png Rplot78.png
##     'price-versus-ptr.gif'
```

```
## Output at: price-versus-ptr.gif
```


```r
# Split out by BEA Region
```
