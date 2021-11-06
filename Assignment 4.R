#Assignment 4 
#Carolina Herrera Figueroa 
#CRIM 250

library(tidyverse)
    #This is to laod the package tidyverse, which is used for data analysis. 

#We want to answer the question: what does the relationship between engine size and fuel efficiency look like? 

ggplot2::mpg
    #the dataframe we are using to answer our question is mpg.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Running the code above helps us create a plot of the variables (displ) on the x-axis and (hwy) on the y-axis
# Plot shows a negative relationship between enginne size (displ) and fuel efficiency (hwy)


ggplot(data = mpg) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

## DOES NOT WORK -- ERROR

ggplot(data = mpg)

#3.2.4 Exercises
#Run ggplot(data = mpg). What do you see?
  
#  How many rows are in mpg? How many columns?
  
 # What does the drv variable describe? Read the help for ?mpg to find out.

#Make a scatterplot of hwy vs cyl.

#What happens if you make a scatterplot of class vs drv? Why is the plot not useful?


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))
    #(geom_point) is used to create scatterplots, (aes) means we want to make an aesthetic, the x and y variables remain the same, but by writing color=class we can map the colors of the points to the class variable to show us the class of each car. ggplot2 automatically assigns a unique color to each unique value (in this case class) of the variable.  

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
    # here we are running the same plot as before, the only difference is that instead of mapping class to the color aesthetic, we are mapping it to the size aesthetic -- thus why we see the different sizes in the points.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
      # here we are now mapping class to the alpha aesthetic -- which controls the transparency of the points 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
      #this plot instead maps class to the shape aesthetic - giving unique values a unique shape
      #important note! only 6 shapes are used at a time, all other groups will be unplotted.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
      #Here we are setting the colors of all the points to blue, just for a visually appealing plot, not for extra information.
      #Note how the last part of the code is written slightly different, with a closed parentheses after the y-variable


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
      #This code would indeed not give us blue points, but instead red points with a label titled "blue" as if the name of the variable was "blue"

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))
      #(color=displ <5) causes color to appear on the scatterplot for values under 5, or whatever number we specify instead of 5



## TROUBLESHOOTING 

# ggplot(data = mpg) 
#   + geom_point(mapping = aes(x = displ, y = hwy))
    #This will not work. The + must be at end of the first line, not at the beginning of the second.


#Facets - we can split our plot into facets which are subplots that display each one subset of the data

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
      #facet_wrap() allows us to plot by a single variable. Inside the parentheses we write ("~" followed by a variable name, in our case "class"). The variable should be discrete. (nrow) allows us to change how many rows of plots we want, if we have 6 plots we can do 2 rows each with 3 plots, or 3 rows each with 2 plots.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
    #facet_grid() allows us to facet the plot on the combination of two variables.There must be two variables separated by a (~)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(.~ cyl)
    #using a period (.) instead of a variable name will not facet among the columns.

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
    #having the variable first and then the (.) means we will not facet among rows.

#Note: when using facet_grid() we should usually put the variable with more unique levels in the column. 

#Note: Geom is the geometrical object that a plot uses to represent data -- can be bar geoms, line geoms, boxplot geoms, point geoms, etc.


ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))
    #geom_smooth gives us a sort of smooth line that is fitted to the data. 

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
    #linetype allows us to set a different type of line for each unique variable that we are plotting. setting (linetype=drv) separates the cars into 3 lines based on their drv value, which describes a car's drivetrain. 


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

      #plotting it like above allows ggplot2 to draw a separate object for each unique value of the grouping variable. We get 3 different plots without a legend.
      #I'm not exactly sure why we would use this though

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
      #Here we are plotting multiple geoms in the same plot, we added the function of geom_point and geom_smooth - meaning that we have both a scatterplot and the smooth line that fits the data.


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()
      #This code is equivalent to the one above but it's very useful because if we want to change the y-axis to display a different variable we'd have to change it into two places, but like this it simplifies the process for us. It reduces the possibility that we will make errors in our code.


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
    #We can display different aesthetic in different layers because ggplot2 treats the place mappings as local mappings for the layer. In this case we are mapping class to the color aesthetic only for the point geom. 



ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
      #We can also specify different data for each layer. The smoothline displays just a subset of the mpg dataset, the subcompact car cars. If we wanted to look only at the minivan cars, we would channge it to (class == "minivan")
      #What does se mean? 

##Statistical Transformations

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
    #geom_bar draws a bar plot, here the x-axis displays the variable "cut" (from the diamonds dataset) and on the y-axis it displays count which is calculated by the bar chart.

# algorithm to calculate new values for a graph is called stat -- geom_bar() uses stat_count()

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))
    # this shows that somoetimes we can use geom_bar() and stat_count() interchangeably 


demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")
    # With this code we can override the default stat, from count to identity. Identity maps the height of the bars to the raw values of a y variable. 


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))
    #y= stat(prop) allows us display a bar chart of proportion, instead of count. 


ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )
      #the stat_summary() function summarises the y values for each unique x value 



ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))
      #The (colour = cut) part code colors the outside of bars, as an outline.

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
      #The (fill = cut) part of the code fills the bars with color. 

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))
      #If we change the variable that we are mapping the fill aesthetic to, in this case "clarity" the bars become automatically stacked. Each colored rectangle represents a combination of cut and clarity. 


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")
# position = "fill" is useful because it makes each set of stacked bars the same height, making it easier to compare proportions across groups. 


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
# position = "dodge" places overlapping objects beside one another -- easier to compare individual values.


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")
    #sometimes points overlap each other and it makes it hard to see where the mass of the data is. By setting (position = "jitter") we can add a small amount of noise to each point and this spreads out the points.


## Coordinate systems


ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot()
      #original, flipped is below
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + 
  geom_boxplot() +
  coord_flip()
      # coord_flip() switches the x and y axes. This gives us horizontal boxplots, and can help prevent labels from overlapping on x-axis.



nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  coord_quickmap()
      #coord_quickmap() sets the correct aspect ratio for maps


bar <- ggplot(data = diamonds) + 
  geom_bar(
    mapping = aes(x = cut, fill = cut), 
    show.legend = FALSE,
    width = 1
  ) + 
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()
      #We can also use coord_polar() which uses polar coordinates to reveal connections between a bar chart and a Coxcomb chart 





## Reading 28 - Graphics for Communication 

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov"
  )
      #labs() allows us to add and change labels to our plot, title = "" adds a title to our plot, subtitle adds text in a smaller font under the title, caption adds text at the bottom right of the plot (often used to describe the source of the data)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  labs(
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    colour = "Car type"
  )
      #here labs() serves to change the axis and legend titles. It helps understand more clearly what the axis represent. 


df <- tibble(
  x = runif(10),
  y = runif(10)
)
ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
  )
      #When needed we can use mathematical equations instead of text. 

##Annotations

best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_text(aes(label = model), data = best_in_class)
      #We can have labels inside the plot for specific observations. geom_text with the label aesthetic is what adds text to a point. 


ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_label(aes(label = model), data = best_in_class, nudge_y = 2, alpha = 0.5)
      #Here we changed geom_text to geom_label which draws a rectangle around the text, and nudge_y moves the labels slightly above the corresponding point (the greater nudge_y is the higher above the point the label will be). However, some of them still overlap. alpha = changes the transparency of our labels, if we increase ist (ex to 2) our labels won't be transparent and we won't be able to see any points etc behind them, the lower the alpha value the more transparent our labels are.

install.packages("ggrepel")
library(ggrepel)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  ggrepel::geom_label_repel(aes(label = model), data = best_in_class)
      #the ggrepel package automaticially adjusts the labels so that they don't overlap. The third line of the code geom_point(size=3, shape=1, data = best_in_class) created a second layer of large hollow points (the black outline that we see around the labelled points). 



class_avg <- mpg %>%
  group_by(class) %>%
  summarise(
    displ = median(displ),
    hwy = median(hwy)
  )
#> `summarise()` ungrouping output (override with `.groups` argument)

ggplot(mpg, aes(displ, hwy, colour = class)) +
  ggrepel::geom_label_repel(aes(label = class),
                            data = class_avg,
                            size = 6,
                            label.size = 0,
                            segment.color = NA
  ) +
  geom_point() +
  theme(legend.position = "none")

      #ggrrepel::geom_label_repel(aes(label=class)) etc. is what replaces the legend with labels on the plot, and theme(legend.position = "none) is what turns the legend off.


label <- mpg %>%
  summarise(
    displ = max(displ),
    hwy = max(hwy),
    label = "Increasing engine size is \nrelated to decreasing fuel economy."
  )
          #The top part of the code allows us to create a single label, and here we are naming it. Using summarise() is also useful because we can compute the max of x and y to help us place the label in the corner.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right")
          #This part of the code is where we write where we want the label to be placed. There are nine different combinations that we can use to control the alignment of the label, by changinng hjust = and vjust= to 'left', 'center' and 'right'.

  
label <- tibble(
  displ = Inf,
  hwy = Inf,
  label = "Increasing engine size is \nrelated to decreasing fuel economy."
)
      # By changing displ = max(displ) and hwy = max(hwy) to displ = Inf, and hwy = Inf the label will be placed exactly in the corner of the plot. \n also breaks up the line, and we can place it whereever we want within the text.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right")


"Increasing engine size is related to decreasing fuel economy." %>%
  stringr::str_wrap(width = 40) %>%
  writeLines()
#> Increasing engine size is related to
#> decreasing fuel economy.
      #this is another way to break up the lines, where (width=40) represented the number of characters we want per line. 

##Scales

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_colour_discrete()
    # This is the default scale that ggplot2 uses but we can change the parameters according to our data. 



ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(breaks = seq(15, 40, by = 5))
    #The last line of the code indicates that we want to adjust the scale of the y-axis, (breaks) lets us override the default scale. seq(15, 40, by =5) means that we want the y-axis to start at 15, end at 40 and increase in increments of 5. 



ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL)
    #Setting labels=NULL suppresses all of the labels. 

presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y")
    #brakes can also be used to highlight where observations occur. 


##Changing the layout of the legend

base <- ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class))

base + theme(legend.position = "left")
base + theme(legend.position = "top")
base + theme(legend.position = "bottom")
base + theme(legend.position = "right") # the default
  #theme(legend.position = "left") means that the legend will be on the left of the plot, but we can change "left" to top, bottom, or right.


ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 1, override.aes = list(size = 4)))
      #the last line of the code indicates that we only want the legend to use 1 row (nrow = 1) and that the points in the legend should be larger than that in the plot (override.aes = list(size=4)) -- which overrides the previous aesthetics. 



ggplot(diamonds, aes(carat, price)) +
  geom_bin2d()
    #This is the original plot of the variables.

ggplot(diamonds, aes(log10(carat), log10(price))) +
  geom_bin2d()
    #This is the transformed plot of the relationship between carat and price. Log transformation was perforomed on carat, shown by (log10(carat), and log was performed on price as shown by log10(price). This helps us see the relationship more clearly.


ggplot(diamonds, aes(carat, price)) +
  geom_bin2d() + 
  scale_x_log10() + 
  scale_y_log10()
    #This continues to be a plot of the log transformation but aes(carat, price) allows the axes to be labeled with their original names. But now with scale_x_log10 the scale of the x-axis is being tranformed, and the same with the y-axis. 



ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv)) +
  scale_colour_brewer(palette = "Set1")
    #We can choose the color palette we want to use in our plot - which is what the last line of the code does. The shades used are very different from one another. 


ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = drv, shape = drv)) +
  scale_colour_brewer(palette = "Set1")
    #The second line of the code (aes(color = drv, shape = drv)) means that every unique value is being a color and a shape. 


presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id, colour = party)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_colour_manual(values = c(Republican = "red", Democratic = "blue"))
      #scale_color_manual allows us map specific colors and values. For example, here we can map "red" to Republican and "blue" to Democratic.  





df <- tibble(
  x = rnorm(10000),
  y = rnorm(10000)
)
ggplot(df, aes(x, y)) +
  geom_hex() +
  coord_fixed()
    #geom_hex() gives us a plot with hexagon points, and we get a plot with a color gradient. 

install.packages("viridis")

ggplot(df, aes(x, y)) +
  geom_hex() +
  viridis::scale_fill_viridis() +
  coord_fixed()
    #By using the viridis package the vignette changess color, rather than being a gradient of a single color. 



## Zooming 

ggplot(mpg, mapping = aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth() +
  coord_cartesian(xlim = c(5, 7), ylim = c(10, 30))
    #The last line of the code allows us to zoom into the plot. xlim = c(5,7) zooms into the points between the values of 5 and 7 on the x-axis. ylim = c(10,30) zooms into the points between 10 and 30 on the y-axis. 

mpg %>%
  filter(displ >= 5, displ <= 7, hwy >= 10, hwy <= 30) %>%
  ggplot(aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth()
    #In this plot we have also changed the limits but the line isn't as smooth as it could be and makes if difficult to interpret patterns. 

suv <- mpg %>% filter(class == "suv")
compact <- mpg %>% filter(class == "compact")

ggplot(suv, aes(displ, hwy, colour = drv)) +
  geom_point()

ggplot(compact, aes(displ, hwy, colour = drv)) +
  geom_point()
  #Here we plotted two classes of cars separately and an issue with this is that it becomes difficult to compare the plots because they are all using different scales.


x_scale <- scale_x_continuous(limits = range(mpg$displ))
y_scale <- scale_y_continuous(limits = range(mpg$hwy))
col_scale <- scale_colour_discrete(limits = unique(mpg$drv))

ggplot(suv, aes(displ, hwy, colour = drv)) +
  geom_point() +
  x_scale +
  y_scale +
  col_scale

ggplot(compact, aes(displ, hwy, colour = drv)) +
  geom_point() +
  x_scale +
  y_scale +
  col_scale

#This creates scales that are shared by multiple plots, which means it will be easier to interpret the plots and compare them. 


ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  theme_bw()
    #The last line of the code customizes the theme of our plot. We can change whether we want grid lines or not, along with the gray-scale of our plot. 


ggsave("my-plot.pdf")
  #This simply saves our plot as a pdf to the disk drive. 




















