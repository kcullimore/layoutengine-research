##devtools::install_github("https://github.com/pmur002/DOM")
##devtools::install_github("https://github.com/pmur002/layoutenginedom")






##----------------------------------------------------------------------------80
html <- c('<div style="width: 350px; border-width: 1px; border-style: solid">',
          '<div style="background-color: #7db9e8;
                       width: 200px; height: 200px;
                       float: right; shape-outside: circle()"/>',
          '<p>This text flows around a circle! Try doing that
              in R!</p>',
          '</div>')


## DOM package only 
##-------------------------------------##--------------------------------------##
library(DOM)

p <- htmlPage(html)





## layoutEngine with DOM backend
##-------------------------------------##--------------------------------------##
library(layoutEngine)
library(layoutEngineDOM)
options(layoutEngine.backend=DOMEngine)

p <- grid.html(html)



##-------------------------------------##--------------------------------------##
Rfonts <- c("sans", "serif", "mono", "Carlito")


cssFontFamily(Rfonts)

cssFontFamily(Rfonts, device="pdf")

cssFontFamily(Rfonts, device="cairo_pdf")

CSSfonts <- cssFontFamily(Rfonts)



grid.html(paste0('<p><span style="font-family: ', CSSfonts["sans"],
                     '">sans</span>, ',
                 '   <span style="font-family: ', CSSfonts["serif"],
                     '">serif</span>, ',
                 '   <span style="font-family: ', CSSfonts["mono"],
                     '">mono</span>, and ',
                 '   <span style="font-family: ', CSSfonts["Carlito"],
                     '">Carlito</span>.'),
          fonts=Rfonts)
