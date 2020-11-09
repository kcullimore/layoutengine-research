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

## layoutEngine with RSelenium backend
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

## layoutEngine with RSelenium backend (with fonts)
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


## Shut down RSelenium Session and close/remove docker container
##-------------------------------------##--------------------------------------##
RSSession$close()


## layoutEngine with RSelenium backend
##----------------------------------------------------------------------------80

library(maps)

png(filename="nz.png", width=600, height=800, units="px", bg="transparent", type="cairo-png")
map('nz', fill=TRUE, col="#0f9960")
dev.off()


HTML <- c('<div class="container">',
          '<img class="image" src="assets/nz.png/">',
          ipsumText,
          '</div>')

CSS <- '
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
'
## Call layoutEngine

p <- grid.html(html=HTML, css=CSS, assets="nz.png")

html <- htmlElement(HTML, CSS, ASSETS)
flowedHTML <- flow(html=HTML, css=CSS, assets=ASSETS)
grid.html(flowedHTML, viewports=TRUE)


ipsumText <- '
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>
  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>
  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>
  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Rerum eligendi reiciendis aspernatur eaque fugit commodi doloremque aut soluta dolor, quaerat amet blanditiis quibusdam rem! Nesciunt nostrum dignissimos ad commodi reiciendis.</p>
  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis, esse vel? Dolorem cupiditate sunt dolor nesciunt molestias eligendi aliquid, quae eaque maiores expedita a error, explicabo, id magnam praesentium sit. Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
'


library(png)
mapNZ <- readPNG("nz.png")
grid.raster(mapNZ, x=0.68, width=0.45)

dev.off()

png(filename="tmp.png", width=1000, heigh=800)
p <- grid.html(html=HTML, css=CSS, assets="nz.png")
grid.raster(mapNZ, x=0.67, width=0.45)
dev.off()







library(lattice)
x <- seq(0, 12, 0.1)
y <- sin(x/2)

png(filename="ex02.png", width=1000, heigh=600)
xyplot(y ~ x, type="l", ylim=c(-1.4, 2))
dev.off()


library(grid)
library(gridSVG)
library(XML)
library(xml2)
library(htmltidy)
angle <- seq(0, 2*pi, length=50)
grid.lines(x=seq(0.1, 0.9, length=50), y=0.5 + 0.3*sin(angle))

grid.path(x=seq(0.1, 0.9, length=50), y=0.5 + 0.3*sin(angle))

## Get svg code for plot 
svg01 <- grid.export(NULL)$svg

svgHTML <- saveXML(svg01)
p <- grid.html(html=svgHTML)

HTML <- c(svgHTML,
'<text width="500">
  <textPath xlink:href="#GRID.pathgrob.223.1.1">
    Dangerous Curves Ahead
  </textPath>
 </text>
')

p <- grid.html(html=HTML)

"GRID.pathgrob.212.1.1"




dev.off()

library(grid)
library(gridSVG)
library(lattice)
library(htmltools)
library(XML)
library(xml2)
car_set <- mtcars[1:10, ]
cars <- row.names(car_set)

barchart(cars ~ mpg, data=car_set)
## Get svg code for plot 
svg02 <- grid.export(NULL)$svg

## lab_1 <- xmlElementsByTagName(svg02, "tspan", recursive=TRUE)


svgHTML <- saveXML(svg02)
## write(svgHTML, 'svg_text.txt')

HTML <- c('<div class=container>',
          svgHTML,
          '</div>')

CSSfontsCairo <- cssFontFamily("FreeMono", device="cairo-pdf")

CSS <- paste0('
.container {
}
tspan {
font-family: ', CSSfontsCairo, ';
font: bold;
}')

p <- grid.html(html=HTML, css=CSS, fonts=CSSfontsCairo)
