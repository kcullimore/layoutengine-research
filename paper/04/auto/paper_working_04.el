(TeX-add-style-hook
 "paper_working_04"
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
    "sec:org35ba7ec"
    "sec:org1528b81"
    "sec:orgdc9379c"
    "sec:org1984e58"
    "sec:orgacc7616"
    "sec:orgf66871e"
    "sec:orga5abc74"
    "sec:orgcd81865"
    "sec:org2441be1"
    "sec:orgc666f50"
    "sec:orga546986"
    "sec:org9cccfee"
    "sec:orge199104"
    "sec:orgb994d31"
    "sec:orgf6c35f6"
    "sec:orgc2c77da"
    "sec:org2d05cad"
    "sec:org4e91967"
    "sec:orgc73cf71"
    "sec:org05b266f"
    "sec:orga313e0e"
    "sec:org949d114"
    "sec:org2c431c6"
    "sec:org053f97b"
    "sec:org5993571"
    "sec:org6103b0c"
    "sec:org2aa8bcf"
    "sec:orgc5ba049"
    "sec:orgcab1752"
    "sec:org729507f"
    "sec:org3afee3d"
    "sec:orgc4b71ce"
    "sec:orga21328a"
    "sec:org91641df"
    "sec:org50f2b58"
    "sec:org55b7a8b"
    "sec:org1b2e69e"
    "sec:orgdc6b0ef"
    "sec:orgcae829d"
    "sec:org9814386"
    "sec:orga374626"
    "sec:org8abbc43"
    "sec:org861ff67"
    "sec:org6d2148b"
    "sec:org89ce42c"
    "sec:org5f5876a"
    "sec:orgae9a197"
    "sec:orgdd9ba41"
    "sec:orgd20ee09"
    "sec:org5247c56"
    "sec:org4a2971a")
   (LaTeX-add-bibitems
    "type01")
   (LaTeX-add-xcolor-definecolors
    "shadecolor"))
 :latex)

