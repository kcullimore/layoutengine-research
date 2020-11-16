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
RSSession <- rSSSession(url="127.0.0.1", portRS=4444, portClient="4444",
                 network="bridge", shm_size="1g",
                 browser_type=test$name, headless=FALSE,
                 image_request=test$image, fresh_pull=FALSE)
options(layoutEngine.rSSSession=RSSession)



## Load libraries for layoutEngine and Backend and set the Backend
library(layoutEngine)
library(layoutEngineRSelenium)
options(layoutEngine.backend=RSeleniumEngine)
## Basic example supplying HTML, FONTS, CSS, ASSETS
HTML <- c('<div>',
          '<p>This is some simple text</p>',
          '<div><img src="assets/nz.png" /></div>',
          '</div>')
FONTS <- cssFontFamily("FreeMono")
CSS <- 'body {font-family: FreeMono;} img {width: 200px; float: right; shape-outside: url("assets/nz.png")}'
ASSETS <- c("nz.png")
## Call layoutEngine
png("essential-example.png", width=400, height=300)
grid.html(html=HTML, fonts=FONTS, css=CSS, assets=ASSETS)
dev.off()




## Load libraries for layoutEngine and Backend and set the Backend
library(layoutEngine)
library(layoutEngineRSelenium)
options(layoutEngine.backend=RSeleniumEngine)
## Basic example supplying HTML, FONTS, CSS, ASSETS
HTML <- c('<div class="content">',
          '<h1>This is some simple text</h1>',
          '</div>')
FONTS <- cssFontFamily("FreeMono")
CSS <- '.content {font-family: FreeMono; border: solid; width: 800px; height: 100px; display: flex; justify-content: right;}'
## Call layoutEngine
png("essential-example.png", width=800, height=100)
grid.html(html=HTML, fonts=FONTS, css=CSS, assets=ASSETS)
dev.off()
