

library(ggplot2)
library(dplyr)

# we're gonna make a new data frame, a simpler data frame, based on calculations from the OG data frame (MCR_LTER_Coral_Cover_Backreef_Wide_20250429) and we're gonna call this new, simpler data frame 'coral_df'
coral_df <- MCR_LTER_Coral_Cover_Backreef_Wide_20250429 %>% # this funky symbol is how the dplyr package knows we want to continue adding to this code chunk
  group_by(year) %>% # we're telling dplyr to calculate the mean for all values within one 'year'
  summarise(avg_coral = mean(coral, na.rm = TRUE)) # here is where we tell R to calculate the mean, and we tell R to calculate the mean for all 'coral' values


CoralPlot<-ggplot(coral_df, aes(x = year, y = avg_coral)) +
  geom_point() + # geom_point tells R to that we want our data to be denoted by dots/points (as opposed to say boxes or bars), here you also specify the size and color of the point
  theme_bw()+
  geom_smooth(se = TRUE, color="aquamarine3") # the simple version here is that geom_smooth (by itself) tells R to make a wiggly/curved line that is 'fit' the points (by fit, I mean captures the general patterns)
                                                # se tells R to added error bars as a shaded grey region around the fitted line, and we can of course specify the color of the line
CoralPlot




