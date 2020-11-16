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
    "sec:orgfce715c"
    "sec:org66503ca"
    "sec:orgec04f5c"
    "sec:org4eec99f"
    "sec:org8e27192"
    "sec:org100d764"
    "sec:orgfa78114"
    "sec:org8e8c72e"
    "sec:org0b571ac"
    "sec:orge5a7e71"
    "sec:org7105ac0"
    "sec:orgf3982a4"
    "sec:orgd1f981b"
    "sec:org594e4d3"
    "sec:org85e8e4a"
    "sec:org727c29b"
    "sec:org345bf38"
    "sec:org81c559f"
    "sec:org06b57c7"
    "sec:orgc1cff96"
    "sec:org8322a77"
    "sec:orgae3d28a"
    "sec:orgfe09e25"
    "sec:org71dae37"
    "sec:org32e3c3f"
    "sec:org0c59a09"
    "sec:org09dcc4c"
    "sec:org4582111"
    "sec:org55fd095"
    "sec:orgef94ff9"
    "sec:org6a89efb"
    "sec:org74816a6"
    "sec:org50a408e"
    "sec:org8732c8f"
    "sec:org55e0829"
    "sec:org0fc393d"
    "sec:orgc1e435c"
    "sec:org430efe1"
    "sec:orge6be2ab"
    "sec:org6317cd1"
    "sec:org2a8cba9"
    "sec:org4860028"
    "sec:orgb7598aa"
    "sec:orgf2d702d"
    "sec:orga8b2d85"
    "sec:org36ab29b"
    "sec:org88f4d78"
    "sec:org4a82316"
    "sec:org978bc7f"
    "sec:org0b87dc4"
    "sec:org319fec3"
    "sec:org3489f9c"
    "sec:orgd10129f"
    "sec:org720c9f5"
    "sec:orgf4cbbf7"
    "sec:orge1bd44b"
    "sec:org7cae614"
    "sec:org50c893b"
    "sec:org31e8cbc"
    "sec:org1835c99"
    "sec:org8bdfd72"
    "sec:org9f1e96f"
    "sec:org6536829"
    "sec:org226d40d"
    "sec:org5a7996d"
    "sec:orgef6e674"
    "sec:org84ff9e1"
    "sec:org62d6567"
    "sec:org765a520"
    "sec:org0910b7b"
    "sec:org33a3d17"
    "sec:org11e7c62")
   (LaTeX-add-bibitems
    "type01"
    "type02")
   (LaTeX-add-xcolor-definecolors
    "shadecolor"))
 :latex)

