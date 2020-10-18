#!/bin/bash
# Used to install specific version of R 
# dockerfiles => https://github.com/rstudio/r-docker/
# version list => https://cran.r-project.org/bin/windows/base/old/
R_VERSION=3.6.1
OS_IDENTIFIER=ubuntu-1804
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update 
# Set local timezone
#&& ln -fs /usr/share/zoneinfo/Pacific/Auckland /etc/localtime  
ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime 
apt-get install -y tzdata 
dpkg-reconfigure tzdata 
# Install libraries
apt-get install -y software-properties-common build-essential curl make xdg-utils iproute2 libclang-dev git
# Rstudio specific libraries to build R
apt-get install -y gdebi-core xsltproc libxml2-dev libcurl4-openssl-dev libssl-dev libv8-dev libavfilter-dev libmagick++-dev cargo libwebp-dev libpoppler-cpp-dev
# Install R and packages
sudo apt-get update 
sudo sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list 
mkdir -p ~/.R/lintr_cache
curl -O "https://cdn.rstudio.com/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb" 
sudo gdebi --non-interactive "r-${R_VERSION}_1_amd64.deb" 
ln -s "/opt/R/${R_VERSION}/bin/R /usr/bin/R" 
ln -s "/opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript" 
ln -s "/opt/R/${R_VERSION}/lib/R /usr/lib/R" 
rm "r-${R_VERSION}_1_amd64.deb" 
R -e "install.packages(c('rmarkdown', 'knitr', 'devtools', 'httpuv', 'tidyverse', 
 'shiny', 'fiery', 'routr', 'Rserve', 'V8', 'reactR', 'gridGraphics', 'htmltidy',  
 'RColorBrewer'),  
 dependencies=TRUE, repos='https://cloud.r-project.org')" 
R -e "devtools::install_version('XML', '3.98-1.4', repos='https://cloud.r-project.org')" 
## Issue with escapeSelector() within docker containerR -e "devtools::install_version('gridSVG', '1.5-0', repos='https://cloud.r-project.org')" 
R -e "devtools::install_github('https://github.com/sachsmc/gridSVG')" 
R -e "devtools::install_github('pmur002/DOM')" 
R -e "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos=r)"

sudo apt-get update 
sudo apt-get upgrade -y  

export COLORTERM=gnome-terminal TERM=xterm-256color DEBIAN_FRONTEND=newt NO_AT_BRIDGE=1 LANG=C.UTF-8 
