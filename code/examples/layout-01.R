## devtools::install_github("https://github.com/pmur002/DOM")
## Libraries & Dataset
##-------------------------------------##--------------------------------------##
library(gridSVG)
library(layoutEngine)
library(layoutEngineDOM)
##library(layoutEngineRSelenium)
library(DOM)
library(XML)
library(xml2)
library(htmltidy)

library(tidyverse)
library(ggtext)
library(glue)

data <- tibble(
  bactname = c("Staphylococcaceae", "Moraxella", "Streptococcus", "Acinetobacter"),
  OTUname = c("OTU 1", "OTU 2", "OTU 3", "OTU 4"),
  value = c(-0.5, 0.5, 2, 3)
)

## Test 1:
## ggtext example
##-------------------------------------##--------------------------------------##


test01 <- data %>% mutate(
  color = c("#009E73", "#D55E00", "#0072B2", "#000000"),
  name = glue("<i style='color:{color}'>{bactname}</i> ({OTUname})"),
  name = fct_reorder(name, value)
)  %>%
  ggplot(aes(value, name, fill = color)) + 
  geom_col(alpha = 0.5) + 
  scale_fill_identity() +
  labs(caption = "Example posted on **stackoverflow.com**<br>(using made-up data)") +
  theme(
    axis.text.y = element_markdown(),
    plot.caption = element_markdown(lineheight = 1.2)
  )

print(test01)


## Test 1:
## layoutEngine example
##-------------------------------------##--------------------------------------##


## Convert to grid system 
grid.echo()


## Get svg code for plot 
svg01 <- grid.export(NULL)$svg


inputHTML <- paste0("<div>", as.character(svg01), "</div>")

## Close down the graphics window
dev.off()
html <- "<div><p>Mello</p></div>"

## Start server and navigate to page within browser  
page <- htmlPage(html="")


## Add the plot to the web page
page_update <- appendChild(page, svgNode(saveXML(svg01)), ns="SVG")

## Get web code from page  
body <- getElementsByTagName(page, "body", response=nodePtr())
newHTML <- body$parentNode$outerHTML
newHTML <- body$innerHTML


## Format the response so its more readable  
opts <- list(TidyDocType="html5",
             TidyMakeClean=TRUE,
             TidyHideComments=TRUE,
             TidyIndentContent=TRUE,
             TidyWrapLen=200)

html <- tidy_html(body$parentNode$outerHTML, options=opts)

newHTML <- toString(svgNode(saveXML(svg01)))
grid.html(newHTML)
grid.html(html)

grid.html(svgNode(saveXML(svg01)), client=testClient, port=5000, timeout=30)


## Close down the graphics window
dev.off()

## Close the server and page
closePage(page)









labels <- c(
  setosa = "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Iris_setosa.JPG/180px-Iris_setosa.JPG'
    width='100' /><br>*I. setosa*",
  virginica = "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/Iris_virginica_-_NRCS.jpg/320px-Iris_virginica_-_NRCS.jpg'
    width='100' /><br>*I. virginica*",
  versicolor = "<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/20140427Iris_versicolor1.jpg/320px-20140427Iris_versicolor1.jpg'
    width='100' /><br>*I. versicolor*"
)

ggplot(iris, aes(Species, Sepal.Width)) +
  geom_boxplot() +
  scale_x_discrete(
    name = NULL,
    labels = labels
  ) +
  theme(
    axis.text.x = element_markdown(color = "black", size = 11)
  )



ggplot(mtcars, aes(disp, mpg)) + 
  geom_point() +
  labs(
    title = "<b>Fuel economy vs. engine displacement</b><br>
    <span style = 'font-size:10pt'>Lorem ipsum *dolor sit amet,*
    consectetur adipiscing elit, **sed do eiusmod tempor incididunt** ut
    labore et dolore magna aliqua. <span style = 'color:red;'>Ut enim
    ad minim veniam,</span> quis nostrud exercitation ullamco laboris nisi
    ut aliquip ex ea commodo consequat.</span>",
    x = "displacement (in<sup>3</sup>)",
    y = "Miles per gallon (mpg)<br><span style = 'font-size:8pt'>A measure of
    the car's fuel efficiency.</span>"
  ) +
  theme(
    plot.title.position = "plot",
    plot.title = element_textbox_simple(
      size = 13,
      lineheight = 1,
      padding = margin(5.5, 5.5, 5.5, 5.5),
      margin = margin(0, 0, 5.5, 0),
      fill = "cornsilk"
    ),
    axis.title.x = element_textbox_simple(
      width = NULL,
      padding = margin(4, 4, 4, 4),
      margin = margin(4, 0, 0, 0),
      linetype = 1,
      r = grid::unit(8, "pt"),
      fill = "azure1"
    ),
    axis.title.y = element_textbox_simple(
      hjust = 0,
      orientation = "left-rotated",
      minwidth = unit(1, "in"),
      maxwidth = unit(2, "in"),
      padding = margin(4, 4, 2, 4),
      margin = margin(0, 0, 2, 0),
      fill = "lightsteelblue1"
    )
  )
