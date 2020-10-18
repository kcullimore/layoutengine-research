## Font import
# Using this guide => https://www.zachleat.com/web/css-tricks-web-fonts/
# pyfsubset from  https://github.com/fonttools/fonttools 
pip3 install fonttools brotli
## ---------------------------------------------------------------
# Mono => Inconsolata: Regular 400
# Serif => Taviraj: Light 300, Light Italic 300 & Black 900
# Sans => Montserrat: Regular 400 & Black 900
## ---------------------------------------------------------------
## cd ./myfontdir
cd ./Inconsolata \
  && pyftsubset "Inconsolata-Regular.ttf" --output-file="../woff2/Inconsolata-Regular-kern-latin.woff2" --flavor=woff2 --layout-features=ccmp,locl,mark,mkmk,kern --no-hinting --desubroutinize --unicodes=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD \
  && pyftsubset "Inconsolata-Regular.ttf" --output-file="../woff2/Inconsolata-Regular-hint-all.woff2" --flavor=woff2 --layout-features="*" --unicodes=U+0-10FFFF \
  && cd ../Taviraj \
  && pyftsubset "Taviraj-Light.ttf" --output-file="../woff2/Taviraj-Light-kern-latin.woff2" --flavor=woff2 --layout-features=ccmp,locl,mark,mkmk,kern --no-hinting --desubroutinize --unicodes=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD \
  && pyftsubset "Taviraj-Light.ttf" --output-file="../woff2/Taviraj-Light-hint-all.woff2" --flavor=woff2 --layout-features="*" --unicodes=U+0-10FFFF \
  && pyftsubset "Taviraj-LightItalic.ttf" --output-file="../woff2/Taviraj-LightItalic-kern-latin.woff2" --flavor=woff2 --layout-features=ccmp,locl,mark,mkmk,kern --no-hinting --desubroutinize --unicodes=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD \
  && pyftsubset "Taviraj-LightItalic.ttf" --output-file="../woff2/Taviraj-LightItalic-hint-all.woff2" --flavor=woff2 --layout-features="*" --unicodes=U+0-10FFFF \
  && pyftsubset "Taviraj-Black.ttf" --output-file="../woff2/Taviraj-Black-kern-latin.woff2" --flavor=woff2 --layout-features=ccmp,locl,mark,mkmk,kern --no-hinting --desubroutinize --unicodes=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD \
  && pyftsubset "Taviraj-Black.ttf" --output-file="../woff2/Taviraj-Black-hint-all.woff2" --flavor=woff2 --layout-features="*" --unicodes=U+0-10FFFF \
  && cd ../Montserrat \
  && pyftsubset "Montserrat-Regular.ttf" --output-file="../woff2/Montserrat-Regular-kern-latin.woff2" --flavor=woff2 --layout-features=ccmp,locl,mark,mkmk,kern --no-hinting --desubroutinize --unicodes=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD \
  && pyftsubset "Montserrat-Regular.ttf" --output-file="../woff2/Montserrat-Regular-hint-all.woff2" --flavor=woff2 --layout-features="*" --unicodes=U+0-10FFFF \
  && pyftsubset "Montserrat-Black.ttf" --output-file="../woff2/Montserrat-Black-kern-latin.woff2" --flavor=woff2 --layout-features=ccmp,locl,mark,mkmk,kern --no-hinting --desubroutinize --unicodes=U+0000-00FF,U+0131,U+0152-0153,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-206F,U+2074,U+20AC,U+2122,U+2191,U+2193,U+2212,U+2215,U+FEFF,U+FFFD \
  && pyftsubset "Montserrat-Black.ttf" --output-file="../woff2/Montserrat-Black-hint-all.woff2" --flavor=woff2 --layout-features="*" --unicodes=U+0-10FFFF \
  && cd ../
## ---------------------------------------------------------------
## File output: 
## -- Mono => Inconsolata: Regular 400 -- 
# Inconsolata-Regular-kern-latin.woff2
# Inconsolata-Regular-hint-all.woff2
## -- Serif => Taviraj: Light 300, Light Italic 300 & Black 900 -- 
# Taviraj-Light-kern-latin.woff2
# Taviraj-Light-hint-all.woff2
# Taviraj-LightItalic-kern-latin.woff2
# Taviraj-LightItalic-hint-all.woff2
# Taviraj-Black-kern-latin.woff2
# Taviraj-Black-hint-all.woff2
## -- Sans => Montserrat: Regular 400 & Black 900 -- 
# Montserrat-Regular-kern-latin.woff2
# Montserrat-Regular-hint-all.woff2
# Montserrat-Black-kern-latin.woff2
# Montserrat-Black-hint-all.woff2
## ---------------------------------------------------------------
