library(layoutEngine)
library(layoutEngineRSelenium)
options(layoutEngine.backend=RSeleniumEngine)
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



## Basic Demo: layoutEngine with RSelenium backend
##----------------------------------------------------------------------------80
HTML <- c('<div class="container">',
          '<div class="shape"></div>',
          '<h1>This text flows around a circle! Try doing that in R!</h1>',
          '</div>')

CSS <- '
.container {
width: 350px;
border-width: 1px;
border-style: solid;
}
.shape {
background-color: #7db9e8;
width: 200px;
height: 200px;
float: right;               
shape-outside: circle();
clip-path: circle();
}'

## Call layoutEngine
p <- grid.html(html=HTML, css=CSS)

## Shut down R display
dev.off()


## Demo 2: Show word wrap around transparent PNG 
##----------------------------------------------------------------------------80
## Create transparent PNG of NZ map
library(maps)
png(filename="nz.png", width=600, height=800, units="px", bg="transparent", type="cairo-png")
map('nz', fill=TRUE, col="#0f9960")
dev.off()

ASSETS <- c("nz.png")

## Create HTML & CSS
CSSfonts <- cssFontFamily("Montserrat")

ipsumText <- '<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>'

HTML <- c('<div class="container">',
          '<div id="fig01"><img class="image" src="assets/nz.png/"></div>',
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
font-family: Montserrat;
}
')

library(png)
mapNZ <- readPNG("nz.png")
flowedhtml <- flow(html=HTML, css=CSS, assets=ASSETS, fonts=CSSfonts)
grid.html(flowedhtml, viewports=TRUE)
figvps <- grid.grep("fig", grep=TRUE, global=TRUE,
                    grobs=FALSE, viewports=TRUE)
downViewport(figvps[[1]])
grid.raster(mapNZ, width=0.6, vjust=1, hjust=0.17)
upViewport(0)

dev.off()



## Demo 3: Showing CSS-Grid
##----------------------------------------------------------------------------80

library(lattice)

png(filename="cars.png", width=800, height=600, units="px", bg="transparent", type="cairo-png")
xyplot(mpg ~ disp, mtcars) 
dev.off()

ASSETS <- c("cars.png")

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
background: url("assets/cars.png") no-repeat;
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

library(png)
carsPNG <- readPNG("cars.png")
flowedhtml <- flow(html=HTML, css=CSS, assets=ASSETS, fonts=CSSfonts)
grid.html(flowedhtml, viewports=TRUE)
figvps <- grid.grep("fig", grep=TRUE, global=TRUE,
                    grobs=FALSE, viewports=TRUE)
downViewport(figvps[[1]])
grid.raster(carsPNG)
upViewport(0)

dev.off()
    
