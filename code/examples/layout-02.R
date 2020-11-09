

## Test 1:
## layoutEngine example
##-------------------------------------##--------------------------------------##
## Libraries & Dataset
##-------------------------------------##--------------------------------------##

library(grid)
library(gridGraphics)
library(gridSVG)
library(layoutEngine)
library(layoutEngineDOM)
##library(layoutEngineRSelenium)
library(DOM)
library(XML)
library(xml2)
library(htmltidy)

library(lattice)



dev.off()


xyplot(mpg ~ disp, mtcars) 

svg01 <- grid.export(NULL)$svg

grid.html(svgNode(saveXML(svg01)), client=testClient, port=5000, timeout=30)



png("test-01.png", width=800, height=600, units="px")
xyplot(mpg ~ disp, mtcars) 
dev.off()

library(base64enc)
dataURI(data, mime = "", encoding = "base64", file="test-01.png")



CSS <- '
* {
  box-sizing: border-box;
}
body {
  width: 100vw;
  max-width: 100%;
  padding: 0;
  margin: 0;
  background: #e1e8ed;
}
.graphic {
  display: grid;
  position: relative;
  z-index: 0;
  grid-template-areas:
    " . A A A A "
    " . B B B . "
    " C . . . . "
    " C . . . . "
    " . D D D . ";
  grid-template-rows: 100px 1fr 0.75fr 0.75fr 1fr;
  grid-template-columns: 40px 0.5fr 1fr 1fr 40px;
  grid-gap: 0px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  width: 1000px;
  height: 800px;
  background-color: #ced9e0;
}
.A {
grid-area: A;
background-color: red;
}
.B {
grid-area: B;
background-color: blue;
}
.C {
grid-area: C;
background-color: green;
}
.D {
grid-area: D;
background-color: purple;
}
'

HTML <- '
<div class="graphic">
<div class="A"></div>
<div class="B"></div>
<div class="C"></div>
<div class="D"></div>
</div>
'

ASSETS = 'test-01.png'
html <- htmlElement(HTML, CSS, ASSETS)
grid.html(html)



CSS <- '
body {
  padding: 0;
  margin: 0;
}
.graphic {
  display: grid;
  grid-template-areas:
    " . A A A A "
    " . B B B . "
    " C . . . . "
    " C . . . . "
    " . D D D . ";
  grid-template-rows: rep(1fr, 5);
  grid-template-columns: rep(1fr, 5);;
  grid-gap: 0px;
  width: 1000px;
  height: 800px;
  background-color: #ced9e0;
}
.A {
grid-area: A;
background-color: red;
border: solid;
border-color: grey;
}
.B {
grid-area: B;
background-color: blue;
}
.C {
grid-area: C;
background-color: green;
}
.D {
grid-area: D;
background-color: purple;
}
'

HTML <- '
<div class="graphic">
<div class="A"></div>
<div class="B"></div>
<div class="C"></div>
<div class="D"></div>
</div>
'


CSS <- '
body {
  padding: 0;
  margin: 0;
}
.graphic {
  display: grid;
  grid-template-areas:
    " . A A A A "
    " . B B B . "
    " C . . . . "
    " C . . . . "
    " . D D D . ";
  grid-template-rows: rep(1fr, 5);
  grid-template-columns: rep(1fr, 5);;
  grid-gap: 0px;
  width: 1000px;
  height: 800px;
  background-color: #ced9e0;
}
.A {
grid-area: A;
background-color: red;
border: solid;
border-color: grey;
  z-index: 2;
}
.B {
grid-area: B;
background-color: blue;
  z-index: 3;
}
.C {
grid-area: C;
background-color: green;
  z-index: 4;
}
.D {
grid-area: D;
background-color: purple;
  z-index: 5;
}
.plot {
  grid-area: plot;
  position: absolute;
  z-index: 1;
  width: 800px;
  left: 20%;
  top: 10%;
}
'

HTML <- paste0('
<div class="graphic">
<div class="A"><h1>A Plot Title</h1></div>
<div class="B"></div>
<div class="C"></div>
<div class="D"></div>
<div class="plot"><img src="assets/', ASSETS,
'"/></div>
</div>
')

options(DOM.limit=10)

html <- htmlElement(HTML, CSS, ASSETS)
flowedHTML <- flow(html=HTML, css=CSS, assets=ASSETS)
grid.html(flowedHTML, viewports=TRUE)

