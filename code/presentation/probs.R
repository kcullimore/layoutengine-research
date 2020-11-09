library(layoutEngine)
library(layoutEngineRSelenium)
options(layoutEngine.backend=RSeleniumEngine)
## Firefox Selenium docker image
firefox_build <- "3.141.59-20200525"
firefox_image <- paste0("selenium/standalone-firefox-debug:", firefox_build)

## Select which image to test
test <- list(name="firefox", image=firefox_image)
# test <- list(name="chrome", image=chrome_image)

## Load custom RSelenium Session 
RSSession <- rSSSession(url="127.0.0.1", portRS=4444, portClient="4444",
                 network="research-net", shm_size="1g",
                 browser_type=test$name, headless=FALSE,
                 image_request=test$image, fresh_pull=FALSE)
options(layoutEngine.rSSSession=RSSession)



## Check 1: layoutEngine with RSelenium backend
##----------------------------------------------------------------------------80
html <- c('<div style="width: 350px; border-width: 1px; border-style: solid;">',
          '<div style="background-color: #7db9e8;
                       width: 200px; height: 200px;
                       float: right;
                       shape-outside: circle();
                       clip-path: circle();">',
          '</div>',
          '<h1>This text flows arosadfsdafund a circle! Try doing that in R!</h1>',
          '</div>')
## Call layoutEngine
p <- grid.html(html)

## Shut down R display
dev.off()

## Check 2: layoutEngine with RSelenium backend (with fonts)
##-------------------------------------##--------------------------------------##
CSSfontsCairo <- cssFontFamily("FreeMono", device="cairo-pdf")
html <- c('<div style="width: 350px; border-width: 1px; border-style: solid; font-family: ', CSSfontsCairo, ';">',
          '<div style="background-color: #7db9e8;
                       width: 200px; height: 200px;
                       float: right;
                       shape-outside: circle();
                       clip-path: circle();">',
          '</div>',
          '<h1>This text flows arosadfsdafund a circle! Try doing that in R!</h1>',
          '</div>')
## Call layoutEngine 
p <- grid.html(html, fonts=CSSfontsCairo)

## Shut down R display
dev.off()


## Demo 1: Show word wrap around transparent PNG 
##----------------------------------------------------------------------------80

## QU-1: How to embed PNG in R graphic display directly (opposed to re-importing)
## QU-2: How to properly specify a temporary locally sourced font (as opposed to a system wide font) 


## Create transparent PNG of NZ map
library(maps)
png(filename="nz.png", width=600, height=800, units="px", bg="transparent", type="cairo-png")
map('nz', fill=TRUE, col="#0f9960")
dev.off()

## Create HTML & CSS
CSSfontsCairo <- cssFontFamily("Montserrat-Italic", device="cairo-pdf")
ipsumText <- '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>'

HTML <- c('<div class="container">',
          '<img class="image" src="assets/nz.png/">',
          rep(ipsumText, 5),
          '</div>')

CSS <- paste0('
.container {
width: 1000px;
height: 800px;
padding: 10px;
border-width: 1px;
border-style: solid;
}
.image {
shape-outside: url("assets/nz.png");
float: right;
width: 600px;
}
p {
font-family: Montserrat-Italic;
}
@font-face {
font-family: Montserrat-Italic;
src: url("assets/Montserrat-Italic.ttf")
}
')


## Generate PNG of wrapped text with image
library(png)
mapNZ <- readPNG("nz.png")
png(filename="map-with-text.png", width=1000, heigh=800)
p <- grid.html(html=HTML,
               css=CSS,
               assets=c("nz.png",
                        "../../resources/fonts/Montserrat/Montserrat-Italic.ttf"),
               fonts=CSSfontsCairo)
grid.raster(mapNZ, x=0.67, width=0.45)
dev.off()


## Demo 2: Different fonts within axes (similar to ggtext example)
##----------------------------------------------------------------------------80

## QU-1 (without fonts): Not sure why I can't get the axes labels to plot (I can almost remember this error from days past)
#### > Error => Error in layoutDF$size * 72 : non-numeric argument to binary operator
## QU-2 (with fonts): Not sure why I can't get the axes labels to plot (I can almost remember this error from days past)
#### > Error in if (layout$bold[i]) { : missing value where TRUE/FALSE needed
## QU-3: How could I specify a different font-family for each car label "EASILY" (i.e. within the SVG IDs)

library(grid)
library(gridSVG)
library(lattice)

car_set <- mtcars[1:10, ]
cars <- row.names(car_set)
barchart(cars ~ mpg, data=car_set)
## Get svg code for plot 
svg02 <- grid.export(NULL)$svg
svgHTML <- saveXML(svg02)

HTML <- c('<div class=container>',
          svgHTML,
          '</div>')

## Without specified fonts
p <- grid.html(html=HTML)

## With specified fonts
CSSfontsCairo <- cssFontFamily("FreeMono", device="cairo-pdf")
CSS <- paste0('
.container {
}
tspan {
font-family: ', CSSfontsCairo, ';
}
')
p <- grid.html(html=HTML, css=CSS, fonts=CSSfontsCairo)


## Demo 3: Showing CSS-Grid (incomplete)
## Intent: "Dumb" plot within a grid of other text and images
##----------------------------------------------------------------------------80

library(lattice)

png(filename="cars.png", width=800, height=600, units="px", bg="transparent", type="cairo-png")
xyplot(mpg ~ disp, mtcars) 
dev.off()
ASSETS <- c("cars.png",
            "../../resources/img/duster-360.jpg",
            "../../resources/img/mazda-rx4.jpg",
            "../../resources/img/merc-280.jpg"
            )

ipsumText <- '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>'

HTML <- paste0('
<div class="graphic">
<div class="A"><h1>A Large Title for this Graphic</h1></div>
<div class="B">', rep(ipsumText, 2), '</div>
<div class="C"><h1>C</h1></div>
<div class="D">', rep(ipsumText, 2), '</div>
<div class="E"></div>
<img class="X" src="assets/duster-360.jpg"/>
<img class="Z" src="assets/merc-280.jpg"/>
</div>
')


CSS <- '
body {
  width: 100vw;
  padding: 0;
  margin: 0;
}
.graphic {
  display: grid;
  grid-template-areas:
    " . A A A "
    " . B B B "
    " C E E X "
    " C E E Z "
    " . D D D ";
  grid-template-rows: 100px 1fr 300px 300px 1fr;
  grid-template-columns: 200px 400px 400px 400px;
  grid-gap: 0px;
  width: 1400px;
  height: 800px;
}
.A {
grid-area: A;
background-color: red;
padding: 10px;
}
.B {
grid-area: B;
background-color: blue;
padding: 10px;
}
.C {
grid-area: C;
background-color: green;
padding: 10px;
}
.D {
grid-area: D;
background-color: purple;
padding: 10px;
}
.E {
grid-area: E;
background: url("assets/cars.png") no-repeat;
}
.X {
grid-area: X;
}
.Z {
grid-area: Z;
}
img {
object-fit: cover;
height: 100%;
overflow: hidden;
}
'
p <- grid.html(html=HTML, css=CSS, assets=ASSETS)

## Demo 3: Showing CSS-Grid (incomplete)
## Intent: "Dumb" plot within a grid of other text and images
##----------------------------------------------------------------------------80


library(grid)
library(gridSVG)
library(lattice)

svg01 <- grid.export(NULL)$svg
svgHTML <- saveXML(svg01)
