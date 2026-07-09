# Special R coding wintry surprise!!!
# Run the following code in R or RStudio for a special surprise.
# Run it line by line so you can see the comments as you go. To do that, press ctrl+enter repeatedly (cmd+enter on a Mac).
# To earn an oatmeal peanut butter chocolate chip cookie, email Gina your surprise after you save it to your hard drive.
# To earn ANOTHER cookie, send Gina a customized version of the surprise! (e.g., change some colors, e.g., the hat or scarf, or maybe the arms or face parts IDK!!)

# Load packages
library(tidyverse) # if you get an error message saying the package "tidyverse" doesn't exist, run the following code first: install.packages('tidyverse')
library(ggforce)

#### Body ####
snowman <- tibble(
  x = 0,
  r = 3:1
) %>% 
  mutate(y =  (r^2) *-1)

# Face 
face <- tibble(
  x = c(-0.5, 0.5, 0),
  y = c(.75, .75, 1)*-1,
  type = c("eye", "eye", "nose"),
  colour = c("black","black", "coral2")
)

# Arms 
arms <- tibble(
  x = c(-3.5, -2, -3, -3.4, -3, -3.2,
        2, 3.6, 3.1, 3.5, 3.1, 3.3),
  y = c(-3, -3.7, -3.2, -3.5, -3.2, -2.8,
        -3.7, -3, -3.2, -3.4, -3.1, -2.5),
  side = c(
    rep("left arm", 2),
    rep("left finger1", 2),
    rep("left finger2", 2),
    rep("right arm", 2),
    rep("right finger1", 2),
    rep("right finger2", 2)
  )
)

#### Accessories ####
# Hat
tophat <- tibble(
  x = c(-1, -0.9, -0.3, -0.4, 1.1, 0.8, 1.5, 1.4),
  y = c(0, .25, .15, 1, .75, -0.04, -.25, -.5),
  id = 1
)

# Scarf
scarf <- tibble(
  x = c(-0.5, 0.3, 0.4, 0.3, 0.5), 
  y = c(-2, -2, -3, -2, -2)
)

#### Scene ####
plot_window <- tibble(
  x = c(-5, 5),
  y = c(3, -12)
)

snow <- tibble(
  x = sample(seq(plot_window$x[1],plot_window$x[2], length.out = 1000), 
             200, replace = F),
  y = sample(seq(plot_window$y[1],plot_window$y[2], length.out = 1000), 
             200, replace = F),
  id = 1:200
)

# Background color
background <- expand_grid(
  x = seq(plot_window$x[1], 
          plot_window$x[2]),
  y = seq(plot_window$y[2], 
          plot_window$y[1], 
          length.out = 50)
) %>% 
  group_by(x) %>%
  mutate(id = row_number()) %>% 
  ungroup()

#### Final surprise ####

surprise <- ggplot() +
  
  # gradient background
  geom_tile(data = background,
            show.legend = FALSE,
            aes(fill = id, x = x, y = y)) +
  scale_fill_gradientn(
    colours = c("#463f94", "#2e2960")
  ) +
  
  # body
  geom_circle(data = snowman,
              aes(x0 = x, y0 = y, r = r),
              fill = "white", 
              colour = "lightgrey") + 
  
  # face
  geom_point(data = face, 
             show.legend = FALSE,
             size=2,
             aes(x = x, y = y, 
                 shape = type, 
                 colour = I(colour))
  ) +
  
  # mouth
  geom_arc(
    aes(x0 = snowman$x[nrow(snowman)], 
        y0 = snowman$y[nrow(snowman)], 
        start = 2.2, end = 4, r=.6)
  ) +
  
  # buttons
  geom_point(aes(x = 0, y = -3:-5), 
             size = 4) +
  
  # arms
  geom_line(data = arms, linewidth = 1.5, 
            lineend = "round",
            aes(x = x, y = y, group = side)) +
  
  # hat
  geom_polygon(data = tophat, colour = "grey70",
               aes(x = x, y = y, group = id)
  ) +
  
  # scarf
  geom_line(data = scarf,
            linewidth = 3, lineend="round",
            colour = "firebrick4",
            aes(x = x, y = y)) +
  
  # snow
  geom_point(data=snow, 
             aes(group=id, x = x, y = y), 
             colour="#e5efff", 
             shape=8, size=1) +
  
  # Fix coordinates for aspect ratio preservation
  coord_fixed() +
  
  # Remove theme stuff (grey background, axes etc)
  theme_void() 

surprise 

#### Saving ####
# To save the image, you can either use the "Export" button in the plotting section of the RStudio console,
# or use the following code to save it to a folder on your hard drive:
jpeg(file="surprise.jpeg",
    width=300, height=550)
surprise
dev.off()
# Then run the following code to figure out which folder it saved your surprise in:
getwd()
# It's probably your downloads folder.

# Email Gina if you have trouble! Happy holidays!!
