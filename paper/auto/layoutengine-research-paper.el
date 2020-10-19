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
    "sec:orgcb4efcc"
    "sec:org87ff59e"
    "sec:org9cc5ea1"
    "sec:org7002d26"
    "sec:org235c3fd"
    "sec:org0430b52"
    "sec:org5022183"
    "sec:org774961e"
    "sec:org9e9a00e"
    "sec:org5f06066"
    "sec:org5bb788c"
    "sec:org90de67c"
    "sec:org7dd6587"
    "sec:org85945fe"
    "sec:org2c9bfcf"
    "sec:org1bb1981"
    "sec:org15f6c5d"
    "sec:org4f8d712"
    "sec:org61b9fe3"
    "sec:org49d2a00"
    "sec:org1c71a03"
    "sec:org9f2996e"
    "sec:orgc8dea5f"
    "sec:org93bd4c9"
    "sec:org794ace6"
    "sec:org00c886d"
    "sec:orgfbe6d70"
    "sec:org5a69dd8"
    "sec:org88847cc"
    "sec:org34464fa"
    "sec:orgeb99d0c"
    "sec:orge67c87c"
    "sec:org257d4d7"
    "sec:org561a96c"
    "sec:orga5a4d08"
    "sec:org2fb4842"
    "sec:org57681d2"
    "sec:org9b519ef"
    "sec:org01259d7"
    "sec:org5abec62"
    "sec:orgc18f3a3"
    "sec:orgb371416"
    "sec:org2e302c6"
    "sec:org534a4af"
    "sec:orgf48a0e7"
    "sec:org89b8720"
    "sec:org6bc4513"
    "sec:org46d42e4"
    "sec:org07cdf91"
    "sec:org972e1c5"
    "sec:orge6865f7")
   (LaTeX-add-bibitems
    "type01"
    "type02")
   (LaTeX-add-xcolor-definecolors
    "shadecolor"))
 :latex)

