library(layoutEngine)
library(layoutEngineRSelenium)
options(layoutEngine.backend=RSeleniumEngine)
library(png)
library(lattice)

## Firefox Selenium docker image
firefox_build <- "3.141.59-20200525"
firefox_image <- paste0("selenium/standalone-firefox-debug:", firefox_build)

## Select which image to test
test <- list(name="firefox", image=firefox_image)
# test <- list(name="chrome", image=chrome_image)

## Enable X Server
system("xhost +local:")

## Load custom RSelenium Session 
RSSession <- rSSSession(url="127.0.0.1", portRS=4444, portClient="4444",
                 network="bridge", shm_size="1g",
                 browser_type=test$name, headless=FALSE,
                 image_request=test$image, fresh_pull=FALSE)
options(layoutEngine.rSSSession=RSSession)


## Example 1: Using multiple font types in the same graphical component
##----------------------------------------------------------------------------80

layoutFonts <- c("Montserrat", "Taviraj", "Inconsolata")
CSSfonts <- cssFontFamily(layoutFonts)

ipsumText <- '<p>Lorem ipsum dolor sit amet <span class="text-1">consectetur adipisicing</span> elit. Omnis, esse vel? Dolorem <span class="text-2">cupiditate sunt dolor nesciunt molestias</span> eligendi aliquid, quae <span class="text-3">eaque maiores expedita a error, explicabo </span>, id magnam praesentium sit. <span class="text-4">Lorem ipsum dolor sit amet consectetur</span> adipisicing elit.</p>'

HTML <- paste0('
<div class="text-box">', ipsumText, '</div>
')

CSS <- '
.text-box {
  width: 600px;
  border-style: solid;
  color: #5c7080;
  margin: 20px;
  padding: 40px;
}
.text-1 {
font-family: Montserrat;
color: #0f9960;
}
.text-2 {
font-family: Taviraj;
}
.text-3 {
font-family: Montserrat-Black;
}
.text-4 {
font-family: Inconsolata;
color: #a82a2a;
font-size: 1.5em;
}
.text-5 {
font-family: Taviraj;
color: #0f9960;
}
'

png(filename="ex-1.png", width=600, height=200, units="px", type="cairo-png")
grid.html(html=HTML, css=CSS, fonts=CSSfonts)
dev.off()
    

## Example 2: Embedded tables and text-boxes with wrapped text
##----------------------------------------------------------------------------80
png(filename="cars-plot.png", width=600, height=400, units="px", bg="transparent", type="cairo-png")
plot(mpg ~ disp, data=mtcars, xlim=c(40, 500), ylim=c(10, 35), axes=FALSE, cex=2, pch=2, col="red")
axis(side=1)
axis(side=2)
dev.off()

ASSETS = c("cars-plot.png")

ipsumText <- '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>'

HTML <- c('<div class="container">',
          '<div id="fig"><img class="image" src="assets/cars-plot.png/"></div>',
          ipsumText, 
          '</div>')

CSS <- '
.container {
width: 600px;
height: 400px;
padding: 20px;
border-width: 2px;
border-style: solid;
}
.image {
shape-outside: url("assets/cars-plot.png");
shape-margin: 20px;
float: left;
width: 580px;
}
p {
margin-top: 50px;
font-size: 0.85em; 
}
'

library(png)
carsPlot <- readPNG("cars-plot.png")
png(filename="ex-2.png", width=600, height=400, units="px", type="cairo-png")
flowedhtml <- flow(html=HTML, css=CSS, assets=ASSETS)
grid.html(flowedhtml, viewports=TRUE)
figvps <- grid.grep("fig", grep=TRUE, global=TRUE,
                    grobs=FALSE, viewports=TRUE)
downViewport(figvps[[1]])
grid.raster(carsPlot, vjust=1, hjust=0.5, width=0.9)
upViewport(0)
dev.off()

## Example 3: Complex layouts of text and graph components
##----------------------------------------------------------------------------80

ASSETS = c("ex-2.png")


layoutFonts <- c("Montserrat", "Taviraj", "Inconsolata")
CSSfonts <- cssFontFamily(layoutFonts)

ipsumText <- '<p>Lorem ipsum dolor sit amet <b>consectetur adipisicing</b> elit. Omnis, esse vel? Dolorem <span class="text-4">cupiditate sunt dolor nesciunt molestias</span> eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. <span class="text-5">Lorem ipsum dolor sit amet consectetur</span> adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>'

HTML <- paste0('
<div class="graphic">
<div class="A"><h1>A Large Title for this <span class="text-5">Graphic</span></h1></div>
<div class="B">', ipsumText, '</div>
<div class="C"><h1>This is some side Text...</h1></div>
<div class="D">
<span class="text-1">Montserrat</span>
<span class="text-2">Taviraj</span>
<span class="text-3">Inconsolata</span>
</div>
<div id="fig01" class="E"></div>
<div class="F">', ipsumText, ipsumText, ipsumText, '</div>
</div>
')

CSS <- '
body {
  padding: 0;
  margin: 0;
}
.graphic {
  display: grid;
  grid-gap: 10px;
  width: 1400px;
  grid-template-areas:
    " A A A F "
    " . B B F "
    " C E E F "
    " . D D F ";
  grid-template-columns: 200px 400px 400px 400px;
  grid-template-rows: 100px 1fr 600px 1fr;

}
.A {
grid-area: A;
background-color: #a6a5a5;
color: #293742;
text-align: center;
padding: 20px;
}
.B {
grid-area: B;
background-color: #f1f8ed;
padding: 20px;
}
.C {
grid-area: C;
background-color: #0a6640;
color: #ced9e0;
padding: 20px;
}
.D {
grid-area: D;
font-size: 2em;
background-color: #a7b6c2;
padding: 20px;
}
.E {
grid-area: E;
background: url("assets/cars-plot.png") no-repeat;
}
.F {
grid-area: F;
background-color: #5c7080;
color: #ced9e0;
padding: 20px;
margin-left: 40px;
}
.text-1 {
font-family: Montserrat;
font-weight: bold;
}
.text-2 {
font-family: Taviraj;
font-weight: bold;
}
.text-3 {
font-family: Inconsolata;
font-weight: bold;
}
.text-4 {
font-family: Inconsolata;
color: #a82a2a;
}
.text-5 {
font-family: Taviraj;
color: #0f9960;
}
'


carsPNG <- readPNG("ex-2.png")
png(filename="ex-3.png", width=1200, height=900, units="px", type="cairo-png")
flowedhtml <- flow(html=HTML, css=CSS, assets=ASSETS, fonts=CSSfonts)
grid.html(flowedhtml, viewports=TRUE)
figvps <- grid.grep("fig", grep=TRUE, global=TRUE,
                    grobs=FALSE, viewports=TRUE)
downViewport(figvps[[1]])
grid.raster(carsPNG)
upViewport(0)

dev.off()
    
