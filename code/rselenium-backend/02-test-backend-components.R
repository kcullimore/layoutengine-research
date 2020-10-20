## layoutEngineRSelenium testing component functionality
##-------------------------------------##--------------------------------------## 
library(layoutEngineRSelenium)

## Firefox Selenium docker image
firefox_build <- "3.141.59-20200525"
firefox_image <- paste0("selenium/standalone-firefox-debug:", firefox_build)

## Chrome Selenium docker image
chrome_build <- "3.141.59-20200525"
chrome_image <- paste0("selenium/standalone-chrome-debug:", chrome_build)

## Select which image to test
test <- list(name="firefox", image=firefox_image)
# test <- list(name="chrome", image=chrome_image)

settings <- list(url="127.0.0.1", port=4444L, network="bridge", shm_size="1g",
                 browser_type=test$name, headless=FALSE,
                 image_request=test$image, fresh_pull=FALSE)


## docker container
##-------------------------------------##--------------------------------------## 
container <- dockerContainer(settings)

container$run()
container$getInfo()
container$close()


## RSelenium Server
##-------------------------------------##--------------------------------------## 
RSServer <- rSServer(settings)

RSServer$getStatus()
RSServer$remDr$getStatus()
RSServer$remDr$getSessions()

RSServer$remDr$open()
RSServer$remDr$close()


## Browser Session
##-------------------------------------##--------------------------------------## 
RSSession <- rSSSession(url="127.0.0.1", port=4444L, network="bridge", shm_size="1g",
                        browser_type=test$name, headless=FALSE,
                        image_request=test$image, fresh_pull=FALSE)

RSSession$close()
