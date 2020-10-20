(TeX-add-style-hook
 "layoutengine-research-paper"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "10pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem") ("geometry" "a4paper" "top=2.5cm" "bottom=2cm" "left=1.75cm" "right=1.5cm")))
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
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
    "sec:org508c422"
    "sec:org13137f2"
    "sec:orgcfffbb6"
    "sec:org2c87c5b"
    "sec:org40324e9"
    "sec:orge4556ca"
    "sec:org3eb6189"
    "sec:org67ba8a5"
    "sec:org04b2a16"
    "sec:orgd58f2de"
    "sec:org4b3cd06"
    "sec:org8497c8d"
    "sec:org998b06a"
    "sec:org77495ee"
    "sec:org046feeb"
    "sec:orgb5249d2"
    "sec:org5e7f279"
    "sec:org1ab17c8"
    "sec:orgc393eff"
    "sec:org5e9af82"
    "sec:org49f4ec4"
    "sec:org99ca2d4"
    "sec:org8c7ee3d"
    "sec:orga0391a1"
    "sec:org18e63c8"
    "sec:orgffd71e7"
    "sec:orgea58e66"
    "sec:org9ecf1f4"
    "sec:org4231062"
    "sec:org8b4fd7f"
    "sec:org9284974"
    "sec:orge89886a"
    "sec:orgb99ad48"
    "sec:org564fceb"
    "sec:org29a73d3"
    "sec:orgd1bfa31"
    "sec:orgef48976"
    "sec:org7af9eb2"
    "sec:org83e9110"
    "sec:org9328e6b"
    "sec:orgc79843a"
    "sec:org6162cd6"
    "sec:org7fa1438"
    "sec:org439c73c"
    "sec:org2ea2401"
    "sec:org58f069b"
    "sec:orgf590731"
    "sec:orgdbdddda"
    "sec:org8879954"
    "sec:orgefcef01"
    "sec:org5441bae")
   (LaTeX-add-bibitems
    "type01"
    "type02")
   (LaTeX-add-xcolor-definecolors
    "shadecolor"))
 :latex)

