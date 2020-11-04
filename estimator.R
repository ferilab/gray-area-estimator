

### mnist is a dataset of 60,000 images of handwritten digits (0 to 9).
# The images are all 28 by 28 (784) pixels. As the dataset if roo big (about 220 MB),
# it is not saved in this project. The user needs to load it according to the below code 
# only for the first run of the program.


library(tidyverse)
library(dslabs)
mnist <- read_mnist()

x <- mnist$train$images
y <- mnist$train$labels   
gray_pix <- (50 < x & x < 205) 
tibble(labels = as.factor(y), gray_rate = rowMeans(gray_pix)) %>%
  qplot(labels, gray_rate, data = ., geom = "boxplot") +
  ggsave('fig/digits_gray_area.png') +
  xlab('Digits (lables)') +
  ylab('Gray area rate (of the image)') +
  ggsave('fig/digits_gray_area.png')
  
