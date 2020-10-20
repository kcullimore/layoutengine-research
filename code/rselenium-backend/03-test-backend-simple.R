devtools::install_github("https://github.com/kcullimore/layoutenginerselenium")

library(layoutEngine)
library(layoutEngineRSelenium)
options(layoutEngine.backend=RSeleniumEngine)
## Firefox Selenium docker image
firefox_build <- "3.141.59-20200525"
firefox_image <- paste0("selenium/standalone-firefox-debug:", firefox_build)

## Chrome Selenium docker image
# chrome_build <- "3.141.59-20200525"
# chrome_image <- paste0("selenium/standalone-chrome-debug:", chrome_build)

## Select which image to test
test <- list(name="firefox", image=firefox_image)
# test <- list(name="chrome", image=chrome_image)

## Load custom RSelenium Session 
RSSession <- rSSSession(url="127.0.0.1", port=4444L, network="bridge", shm_size="1g",
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
