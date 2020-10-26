(TeX-add-style-hook
 "layoutengine-research-paper"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "10pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("geometry" "a4paper" "top=2.5cm" "bottom=2cm" "left=1.75cm" "right=1.5cm")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref"
    "geometry"
    "fancyhdr"
    "setspace"
    "fontspec"
    "bold-extra"
    "unicode-math"
    "graphbox"
    "minted"
    "enumitem"
    "xcolor")
   (LaTeX-add-labels
    "sec:org6306027"
    "sec:org7d8e66a"
    "sec:org37292ee"
    "sec:orgf201a03"
    "sec:org4a6d6c1"
    "sec:orgdc627a7"
    "sec:org130e654"
    "sec:org4d36358"
    "sec:orgebaa4f2"
    "sec:orgddb3e51"
    "sec:org8db2c2c"
    "sec:org23389f6"
    "sec:orgc7fecb6"
    "sec:org270ebe0"
    "sec:org0a9dea6"
    "sec:org43fbf1e"
    "sec:org2873cc8"
    "sec:orgaaf5d4f"
    "sec:org7b04945"
    "sec:org0ad39ac"
    "sec:org93b90fb"
    "sec:org6961a90"
    "sec:orgde32fef"
    "sec:org6f2e03a"
    "sec:org1f17adf"
    "sec:orgdc7e62d"
    "sec:org5bc1ed4"
    "sec:org5f4846f"
    "sec:orgebdf3ce"
    "sec:orgac7d0b4"
    "sec:org64ec4dc"
    "sec:orgd01d303"
    "sec:org8bb2a0f"
    "sec:org2b74a01"
    "sec:org398fa04"
    "sec:org37e5ff0"
    "sec:org52be4fa"
    "sec:org8b1232b"
    "sec:org70f56d0"
    "sec:orge2896ca"
    "sec:orgca1254e"
    "sec:orgd073654"
    "sec:org7cadd42"
    "sec:orgc2ed5fb"
    "sec:org085b40e"
    "sec:org140f690"
    "sec:orgd119b53"
    "sec:org09212aa"
    "sec:orgfcdb6e5"
    "sec:orgda22545"
    "sec:org96f7fd5"
    "sec:org361456a"
    "sec:orgf8dd1b8")
   (LaTeX-add-bibitems
    "type01"
    "type02")
   (LaTeX-add-xcolor-definecolors
    "shadecolor"))
 :latex)

