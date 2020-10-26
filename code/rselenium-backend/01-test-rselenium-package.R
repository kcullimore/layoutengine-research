
library(RSelenium)

## Identify Firefox Selenium docker image to test from
## https://hub.docker.com/r/selenium/standalone-firefox-debug/tags
firefox_build <- "3.141.59-20200525"
firefox_image <- paste0("selenium/standalone-firefox-debug:", firefox_build)


## Identify Firefox Selenium docker image to test from
## https://hub.docker.com/r/selenium/standalone-chrome-debug/tags
chrome_build <- "3.141.59-20200525"
chrome_image <- paste0("selenium/standalone-chrome-debug:", chrome_build)


## Select which browser to test
test <- list(name="firefox", image=firefox_image)
test <- list(name="chrome", image=chrome_image)

## Pull docker image
system(paste("docker pull", test$image))

## Run Selenium server on host machine
container <- system(paste0("docker run -d --rm ",
                           "--network bridge ",
                           "-p  4444:4444 ",
                           "--env DISPLAY=unix$DISPLAY ",
                           "--volume /tmp/.X11-unix:/tmp/.X11-unix ",
                           "--name rselenium-container ",
                           test$image), intern=TRUE)

hostname <- system("hostname", intern=TRUE)

info <- system(paste("docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'",
                     container), intern=TRUE)

info <- system(paste("docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'",
                     hostname), intern=TRUE)

## Connect to Selenium server within R session using RSelenium library
remDr <- remoteDriver(remoteServerAddr = "0.0.0.0",
                      port = 4444,
                      browserName=test$name)

remDr <- remoteDriver(remoteServerAddr = "172.17.0.1",
                      port = 4444)

remDr$open()
remDr$navigate("https://www.auckland.ac.nz/en/science/about-the-faculty/department-of-statistics.html")
remDr$getSessions()
remDr$getStatus()
remDr$close()

## Remove running docker container
system(paste("docker stop rselenium-container"))


## Run Selenium server on host machine
container <- system(paste0("docker run -d --rm ",
                           "--network bridge ",
                           "-p  4444:4444 ",
                           "--env DISPLAY=unix$DISPLAY ",
                           "--volume /tmp/.X11-unix:/tmp/.X11-unix ",
                           "--name rselenium-container ",
                           test$image), intern=TRUE)
