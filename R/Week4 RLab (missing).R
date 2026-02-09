

library(ggplot2)
library(readxl)

AnthoPlot<-ggplot(AnemoneFieldTripData, aes(x = AnemoneSpecies, y = Abundance)) +
#To be able to export the plot, you have to turn it into an object. You do that by putting an arrow in front of your ggplot call and specifying the name of the object. 
  
  geom_boxplot(fill = "seagreen3", outlier.colour = "orchid3", outlier.size = 3) +
#The `fill` argument makes the inside of the box green. If instead of `fill`, you just wrote `color`, the border of the box would be green, and the inside would be white. 
  
  labs(x = "Anemone Species",
    y = expression("Abundance (individuals /m"^2*")"))+
#Coding for superscripts is a bit clunky. You have to use that expression argument. What you want to be as a superscript then goes in quotes in between a carrot and an asterisk. 
   
  
  theme_bw()
#There are multiple theme options you can choose. I did theme_bw, but you can do others like theme_minimal and theme_dark

AnthoPlot

