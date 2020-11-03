
## Dataset
##-------------------------------------##--------------------------------------##

library(datasets)
data(mtcars)

## Test 1: 
##-------------------------------------##--------------------------------------##
pairs(iris[, 1:5], panel = function(...) smoothScatter(...,nrpoints = 0, add = TRUE), gap = 0.2)



data(ozone)
data(iris)
data(USArrests)


USArrests

data(women)

data(nzMapEnv)
nzMapEnv



svg()
install.packages("maps")
library(maps)
map('nz')
map('nz', xlim = c(166, 179), ylim = c(-48, -34))
dev.off()
a
## Create SVG for clip-path

svg()

library(grid)
library(gridGraphics)
library(gridSVG)

grid.echo()


gridPlot <- grid.grab()
mySVG <- gridPlot$svg
grid.newpage()
grid.draw(gridPlot)

## Get svg code for plot 
mySVG <- grid.export(NULL)$svg

dev.off()





## https://cran.r-project.org/web/packages/htmltools/htmltools.pdf
library(htmltools)
svgpath <- plotTag(plot(pressure),
                   "A plot",
                   device = grDevices::svg,
                   width = 375,
                   height = 275,
                   pixelratio = 1/72,
                   mimeType = "image/svg+xml"
                   )


a <- htmlTemplate(text_ = "abc", document_ = TRUE)

class(a)


doc <- tags$html(tags$head(tags$title('My first page')),
                 tags$body(h1('My first heading'),
                           p('My first paragraph, with some', strong('bold'),'text.'),
                           div(id='myDiv',
                               class='simpleDiv',
                               'Here is a div with some attributes.'),
                           as.character(mySVG)
                           )
                 )



p <- grid.html(as.character(doc))

print(doc, browse=is.browsable(doc))
print(doc, browse=TRUE)
print(doc)
as.character(doc)


dev.off()
