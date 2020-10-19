FROM ubuntu:18.04


MAINTAINER Kane Cullimore <kane@ia.house>


# Used to install specific version of R 
  # dockerfiles => https://github.com/rstudio/r-docker/
  # version list => https://cran.r-project.org/bin/windows/base/old/
ARG R_VERSION=3.6.3
ARG OS_IDENTIFIER=ubuntu-1804


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
  # Set local timezone
    && ln -fs /usr/share/zoneinfo/Pacific/Auckland /etc/localtime \ 
  # && ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \ 
    && apt-get install -y tzdata \ 
    && dpkg-reconfigure tzdata \
  # Install libraries    
    && apt-get install -y --no-install-recommends \
  # General libraries for ubuntu    
      software-properties-common \
      build-essential \
      curl \
      make \ 
      nano \
      xdg-utils \
      iproute2 \ 
      openssh-client \
      libclang-dev \
      openjdk-7-* \
      git \
  # Emacs specific libraries
      fonts-inconsolata \
      texinfo \
      texlive-xetex \
      texlive-full \
      gnupg \
      gpm \
      imagemagick \
      ispell \
      libacl1 \
      libasound2 \
      libcanberra-gtk3-module \
      liblcms2-2 \
      libdbus-1-3 \
      libgif7 \
      libgnutls30 \
      libgtk-3-0 \
      libjansson4 \
      libjpeg8 \
      libm17n-0 \
      libpng16-16 \
      librsvg2-2 \
      libsm6 \
      libtiff5 \
      libx11-xcb1 \
      libxml2 \
      libxpm4 \
  # Python specific libraries
      python3-pip \
      python3-venv \
      python3-setuptools \      
  # Rstudio specific libraries to build R
      gdebi-core \ 
  # R specific libraries
      xsltproc \
      libxml2-dev \
      libcurl4-openssl-dev \
      libssl-dev \
      libv8-dev \
      libavfilter-dev \
      libmagick++-dev \
      cargo \
      libwebp-dev \
      libpoppler-cpp-dev \
      bibtex2html \
      subversion \
      fontforge 

# Install browsers
RUN apt-get update && apt-get install -y \
    firefox


# Install emacs
RUN add-apt-repository ppa:kelleyk/emacs \
    && apt-get update \
    && apt-get install -y emacs27


# Pip install python dependencies
RUN apt-get update \ 
    && pip3 install \
      virtualenv \
      matplotlib \
      numpy \
      scipy \
      elpy \
      jedi \
      flake8 \
      # autopep8 \
      pylint \
      mypy \
      rope \
      yapf \
      Black \
      pygments  \
    && python3 -m venv myenv \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1 \
    && mkdir -p /root/Environments/project_01/myenv


# Install node and npm
#Run apt-get update \ 
#    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
#    && apt-get install -y nodejs


# Install docker cli for docker sibling control
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    gnupg-agent
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
RUN apt-get update && apt-get install -y \
    docker-ce-cli 


# Install R
RUN apt-get update \ 
    && sed -i.bak "/^#.*deb-src.*universe$/s/^# //g" /etc/apt/sources.list \
    && mkdir -p ~/.R/lintr_cache \
    && curl -O https://cdn.rstudio.com/r/${OS_IDENTIFIER}/pkgs/r-${R_VERSION}_1_amd64.deb \
    && gdebi --non-interactive r-${R_VERSION}_1_amd64.deb \
    && ln -s /opt/R/${R_VERSION}/bin/R /usr/bin/R \
    && ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/bin/Rscript \
    && ln -s /opt/R/${R_VERSION}/lib/R /usr/lib/R \
    && rm r-${R_VERSION}_1_amd64.deb 


# Install R packages
RUN R -e "install.packages(c('rmarkdown', 'knitr', 'devtools', 'httpuv', 'xtable', 'gdtools', \
         'extrafont', 'systemfonts', 'formattable', 'gridExtra', 'gridGraphics', 'htmltidy', \
         'RColorBrewer', 'colorspace', 'RSelenium', 'gridxl', 'gridSVG', 'jsonlite', 'httr'), \ 
         dependencies=TRUE, repos='https://cloud.r-project.org')" \
    && R -e "devtools::install_version('XML', '3.98-1.4', repos='https://cloud.r-project.org')" \
    && R -e "devtools::install_github('pmur002/DOM')" \
    && R -e "devtools::install_github('pmur002/layoutengine')" \
    && R -e "devtools::install_github('pmur002/layoutenginedom')" \    
    && R -e "devtools::install_github('kcullimore/layoutenginerselenium')" \
    && R -e "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org'; options(repos=r)"


# Make fonts available to R (and establish font databases and caches)
# locale set up MUST precede this so that font set up uses correct locale
ENV LANG=C.UTF-8
RUN R -e 'gdtools::sys_fonts()'
RUN R -e 'extrafont::font_import(prompt=FALSE)'


# Setup sudo User
RUN apt-get update \
    && apt-get upgrade -y \ 
    && apt-get -y install sudo
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && echo "user:password" | chpasswd \
    && adduser user sudo \ 
    && chown -R user:user $HOME /opt \
    && groupadd --gid 999 docker \
    && usermod -aG docker user
USER user


# Copy Emacs configuration files, GitHub repos and set working directory
COPY --chown=user:user ./.emacs.d $HOME/.emacs.d
RUN git clone https://github.com/pmur002/layoutengine /opt/layoutengine
RUN git clone https://github.com/pmur002/layoutengine /opt/layoutenginedom
RUN git clone https://github.com/kcullimore/layoutenginerselenium /opt/layoutenginerselenium
WORKDIR /project


ENV COLORTERM=gnome-terminal TERM=xterm-256color EDITOR=emacs DEBIAN_FRONTEND=newt NO_AT_BRIDGE=1 
