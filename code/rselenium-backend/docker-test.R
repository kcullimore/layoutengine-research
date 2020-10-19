

## layoutEngineRSelenium testing the docker container functionality
##-------------------------------------##--------------------------------------##
library(layoutEngineRSelenium)


settings <- list(url="localhost", port=4444L, network="bridge", shm_size="1g",
                 browser_type="firefox", headless=FALSE,
                 image_request=NULL, fresh_pull=FALSE)

container <- dockerContainer(settings)
container$run()
container$getInfo()
container$close()
system("docker ps")

## Default - Firefox browser open and persisting after running
options(layoutEngine.RSelenium=list(
            debug=list(timeout=2),
            browser=list(type="firefox", port=4444L,
                         url="localhost", headless=FALSE),
            docker=list(name="rselenium-container",
                        freshPull=FALSE, imageRequest=NULL)))






p <- grid.html(html)


layoutEngineRSelenium::dockerClose()
dev.off()
