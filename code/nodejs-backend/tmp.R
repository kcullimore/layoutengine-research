## 
##-------------------------------------##--------------------------------------##


## websocket client --------------------------------------##
## The client ws connection can occur with same or secondary R session 
## Connect to httpuv websocket using the "websocket" package

host <- "0.0.0.0"
port <- "8080"
html <- "<div><p>Hello world!!!Ye</p></div>"


ws <- websocket::WebSocket$new(paste0("ws://", host, ":", port),
                               maxMessageSize=1e6)

## ws$onOpen(function(event) {
##     cat(jsonlite::fromJSON(event$data))
## })


ws$onMessage(function(event) {
    msg <- invisible(jsonlite::fromJSON(event$data))
    ID <- getOption("layoutEngine.wsID")
    if (msg$event == "receipt") {
        options(layoutEngine.wsID=msg$id)    
    } else if (msg$event == "message") {
        options(layoutEngine.wsMessage=msg$message)            
    }
})


## Wait for a moment before running next line
ws$send(html)

getOption("layoutEngine.wsID")
getOption("layoutEngine.wsMessage")



html <- c('<div style="width: 350px; border-width: 1px; border-style: solid;">',
          '<div style="background-color: #7db9e8;
                       width: 200px; height: 200px;
                       float: right;
                       shape-outside: circle();
                       clip-path: circle();">',
          '</div>',
          '<h1>This text flows arosadfsdafund a circle! Try doing that in R!</h1>',
          '</div>')

ws$send(paste(html, collapse=""))

getOption("layoutEngine.wsID")
getOption("layoutEngine.wsMessage")




## Return message
layoutCSV <- getOption("layoutEngine.wsMessage")
layoutCSV

layoutDF <- read.csv(text=layoutCSV, header=FALSE,
                       stringsAsFactors=FALSE, quote="'\"")

## Close client
ws$close()




## layoutEngineRSelenium
setwd("../../../layoutEngineRepos")
system("rm layoutEngineExpress_0.1-0.tar.gz")
system("R CMD build layoutengineexpress")
devtools::install_local("layoutEngineExpress_0.1-0.tar.gz")
setwd("../DOM_research/code/experiments/07")

## Load packages
library(layoutEngine)

library(layoutEngineExpress)
options(layoutEngine.backend=ExpressEngine)



settings <- list(url="0.0.0.0", portServer=8080, portClient="8080",
                 network="host", fresh_pull=FALSE)

settings <- list(url="0.0.0.0", portServer="8080", portClient="8080",
                 network="host", fresh_pull=FALSE)

## docker container
##-------------------------------------##--------------------------------------## 
container <- dockerContainer(settings)

container$run()
container$getInfo()
container$close()

system("docker ps")

## RSelenium Server
##-------------------------------------##--------------------------------------## 
webSocket <- webSocket(settings)

webSocket$getStatus()
webSocket$ws$readyState()


## Browser Session
##-------------------------------------##--------------------------------------## 
WSSession <- WSSession(url="0.0.0.0", portServer=8080, portClient="8080",
                 network="host", fresh_pull=FALSE)

WSSes <- WSSession()
WSSes$close()














## tests - SeleniumLayout()
## Takes HTML and returns layout information
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



## Load packages
library(layoutEngine)

library(layoutEngineExpress)
options(layoutEngine.backend=ExpressEngine)




html <- "<div><p>Hello world!!!Ye</p></div>"


grid.html(html)


dev.off()
system("docker stop $(docker ps -q)")


html_in <- paste0(html, collapse="")[1]
length(html_in)
grid.html(html)


## Wait for a moment before running next line
ws$send(html_in)


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
html_in <- paste(html, collapse="")[1]
p <- grid.html(html_in)

ws$send(html_in)

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
