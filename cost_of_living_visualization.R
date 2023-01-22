### Importing Libraries
library(tidyverse)
library(tidylog)
library(showtext)
library(ggimage)
library(ggtext)


### adding fonts
font_add_google(name = "Poppins", family = "Poppins")
showtext_auto()
sysfonts::font_add_google(name = "Roboto", family = "Roboto")
sysfonts::font_add_google(name = "Montserrat", family = "Montserrat")


### Importing Data set
df <- read_csv("https://raw.githubusercontent.com/TimileyinSamuel/Cost-of-Living-and-Purchasing-Power/main/cost_of_living.csv")

### Creating title, subtitle and caption
title <- "<p style ='colour:#4E0285;'>COST OF LIVING<span style ='colour:#DADBDD;'> 
          VERSUS<span style ='colour:#CD7EFF;'> PURCHASING POWER </span></p>"
subtitle <- "Countries with the highest cost of living and their local purchasing power in 2022. Indices are Relative to New York City."
caption <- "Data Source: Numbeo | Graphic: @Timmy1Tesla"


### plot
cost_of_living <- 
ggplot(data = df, mapping = aes(y = reorder(country, cost_of_living_index), x = cost_of_living_index)) +
  ## add first column
  geom_col(fill = "#4E0285", width = 0.4) +
  ## add second column
  geom_col(mapping = aes(x = local_purchasing_power_index), fill ="#A662D1", width = 0.2) +
  ## add text figures for cost of living index
  geom_text(mapping=aes(x = cost_of_living_index, label = cost_of_living_index), 
            colour = "#FFFFFF", size = 3.5, hjust = - 0.21) +
  ## add label country label
  geom_text(mapping = aes(x = 0, y = country, label = country), 
            colour = "#FFFFFF", vjust = -2.2, hjust = 0) +
  ## add country flag
  geom_image(mapping = aes(x = -10, image = image)) +
  ## remove axis name for y scale
  scale_y_discrete(name = NULL) +
  ## Rename x scale
  scale_x_continuous(name = "Index") +
  ## add title, subtitle and caption
  labs(title = title,
       subtitle = subtitle,
       caption = caption) +
  theme(
    ## change plot background
    plot.background = element_rect(fill = "#101010", colour = "#101010"),
    ## change panel background
    panel.background = element_rect(fill = "#101010", color = "#101010"),
    ## remove grid lines
    panel.grid = element_blank(),
    ## edit plot subtitle's colour, font type, font size, margin and horizontal adjustment
    plot.subtitle = element_text(color = "#FFFFFF", family = "Montserrat", size = 13, 
                                 margin = margin(t = 13, b = 25), hjust = 0.34),
    ## edit caption's colour, size and font type
    plot.caption = element_text(color = "#DFDFDF", size = 10, family = "Montserrat"),
    ## edit plot title's colour, font type, font size, margin and horizontal adjustment
    plot.title=element_textbox_simple(margin = margin(t = 12.5), 
                                      family = "Poppins", size = 32, halign = 0.10),
    ## edit text colour and font type
    text = element_text(colour = "#FFFFFF", family = "Montserrat"),
    ## change axis' text colour
    axis.text = element_text(colour ="#FFFFFF"),
    ## add margin to x-axis' title
    axis.title.x = element_text(margin = margin(t = 10)),
    ## remove y-axis' text
    axis.text.y = element_blank(),
    ## remove axis ticks
    axis.ticks = element_blank())


### Saving the plot
ggsave(filename ="cost_of_living.png", height = 8.5, width = 11.5, units = "in")


