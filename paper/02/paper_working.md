
<div>
  <p style="font-size:5em"> 
  Can web technologies help R generate print quality graphics?
  </p>
</div>


## Introduction 
The **R programming language** is a popular open-source tool used to perform complex statistics. The language has many reliable libraries and methods to perform sophisticated statistical techniques within a relatively short amount of code.
  
Humans working with statistics often benefit from the use of graphical representation of data to better understand and communicate its complexities. The base programming language has long supported rigorous graphical output that is accurate and effective. However, niche use-cases which require additional graphical capabilities are popping up as the language is applied to a wider variety of applications. 



## Print Quality Graphics




## R Graphical Capabilities





## State of Modern Browsers

- Modern browsers are capable graphical display engines
  - Active specification and developer groups
  - Growing improvements in browser capabilities
  - Layout engines that mostly adhere to web standards 
    - Gecko (FireFox)
	- WebKit (Apple Safari)
	- Blink (Google Chromium and Chrome)
	- EdgeHTML (Microsoft)
	- Presto (Opera)
  - Large investment activity due to amount of supported commerce
- Browsers widely available on all user devices
  - PCs and portable devices
  - Users comfortable and familiar within the browser environment
  




![Title Image](/home/krc/linCode/DOM_research/resources/img/soccer_plot.png){ width=40% }





One such use-case is the requirement for a richer document formatting capability to produce highly custom print-quality graphical output. For example, users might want their plots to contain a very specific font type or a color gradient that smoothly transitions across the page. Such work is typically completed in external applications downstream from **R**.  These steps might use Adobe Illustrator or Photoshop or some other means to transfer the R output to a more refined graphic. 

The base graphics package within R does not attempt to cover such needs. 


There are several external packages that have extended its graphical capabilities in a number of ways. R can be used to drive an interactive web-based application with the Shiny package [ref]. A variety of aesthetically pleasing standard plots can be quickly generated with the ggplot2 package [ref]. A number of smaller packages also provide helper methods to enhance color selection [ref] or modify output file formats to make downstream work more smooth [ref - svg, grid?, etc?]. 

Despite these extensions there does not appear to be an smooth workflow to adhere to the most rigid graphical design requirements. The subject research explores whether this hypothesis is indeed true. It is possible that such a workflow may exist with some combination of existing packages which has not gained much attention. 


# Product Definition

## Design & Requirements

- Send HTML, CSS, JS and font description to browser to render/layout 
- After browser has loaded the data some JavaScript calculates and returns layout dimensions to the R session (and perhaps other styling info)
- The browser should have an ability to use the host machine default browser or run in the background on a headless browser


- Easy to use on all major operating systems (Windows, macOS and Linux)
- Minimal installation requirements
- Access via any modern web browser on the host machine
- Lightweight 
- Performant 


