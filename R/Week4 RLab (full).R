

library(ggplot2)
library(readxl)
AnemoneFieldTripData <- read_excel("Desktop/AnemoneFieldTripData.xlsx")
View(AnemoneFieldTripData)
#Although not necessary, the above three lines of code are how you code in reading an Excel file from a specific directory, in this case my desktop. 
#Alternatively, rather than running the above three lines of code, you can simply use the Import Dataset button to the right. 

AnthoPlot<-ggplot(AnemoneFieldTripData, aes(x = AnemoneSpecies, y = Abundance)) +
#To be able to export the plot, you have to turn it into an object. You do that by putting an arrow in front of your ggplot call and specifying the name of the object. 
  
  geom_boxplot(fill = "seagreen3", outlier.colour = "orchid3", outlier.size = 3) +
#The `fill` argument makes the inside of the box green. If instead of `fill`, you just wrote `color`, the border of the box would be green, and the inside would be white. 
  
  facet_wrap(~ Habitat) +
#This makes separate panels for the two different habitat types. 
  
  labs(x = "Anemone Species",
    y = expression("Abundance (individuals /m"^2*")"),
#Coding for superscripts is a bit clunky. You have to use that expression argument. What you want to be as a superscript then goes in quotes in between a carrot and an asterisk. 
    title = "Anemone Abundance by Species and Habitat")+
  
  theme_bw()+
#There are multiple theme options you can choose. I did theme_bw, but you can do others like theme_minimal and theme_dark
  
  theme(axis.text.x = element_text(face = "italic"))
#There are multiple ways to get text in italics. When you want all of the x-axis text to be in italics, this is the least clunky way. 

AnthoPlot

ggsave("AnthoPlot.png",AnthoPlot, dpi = 250, bg = "white",
       width = 1800,
       height = 1400,
       units = "px")
#The ggsave function allows you to save/export a high-resolution version of the plot where you can specify the dimensions, the number of pixels, the file type. 


