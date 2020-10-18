(TeX-add-style-hook
 "paper_working_03"
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
    "graphbox"
    "minted"
    "xcolor")
   (LaTeX-add-labels
    "sec:org6d95d31"
    "sec:org95eda48"
    "sec:orgef682b2"
    "sec:org9f8257d"
    "sec:org1df7cd0"
    "sec:orgb531a73"
    "sec:orgf6e273b"
    "sec:orgcd772d4"
    "sec:org920bea2"
    "sec:org0fbb2c0"
    "sec:org41a4056"
    "sec:orgeb5805e"
    "sec:org7d67aa9"
    "sec:org5ca8738"
    "sec:orgb110df4"
    "sec:org435bd3b"
    "sec:org842389b"
    "sec:orgafe51d3"
    "sec:org05d7899"
    "sec:org197e087"
    "sec:org6949464"
    "sec:orgeb0857f"
    "sec:org56a9145"
    "sec:orgfec9b69"
    "sec:orgc9caaa8"
    "sec:orga4c9088"
    "sec:org9730fc8"
    "sec:orgaf354c1"
    "sec:orge8dd100"
    "sec:org7d91af4"
    "sec:org3724a69"
    "sec:orgfa076b0"
    "sec:orgf74d458"
    "sec:org4b6a2ad"
    "sec:org58cde6a"
    "sec:org972802c"
    "sec:org36dbeab"
    "sec:org19de8af"
    "sec:orga366076"
    "sec:org4e6e918"
    "sec:orgee61524"
    "sec:orgdaf4d3b"
    "sec:org6b625f8"
    "sec:org88ff87f"
    "sec:org0f9f4fe"
    "sec:orgf069019"
    "sec:org30a6625"
    "sec:org6b180f3"
    "sec:org0b98fbe"
    "sec:orgee521bc"
    "sec:orgdf03c33"
    "sec:org921739e"
    "sec:org4391faf"
    "sec:org318e045"
    "sec:org212a92d"
    "sec:org643c8f6"
    "sec:org49ab35f"
    "sec:org0e157fd"
    "sec:org3eb95d2"
    "sec:orgb6a2bcc"
    "sec:org65a8808"
    "sec:org0c02dc0"
    "sec:org9616c3b"
    "sec:org938b51a"
    "sec:org7c13b9a"
    "sec:org571634d"
    "sec:orgc3fdc71"
    "sec:org50e6c9a"
    "sec:org210c6e7"
    "sec:org0b1982b"
    "sec:orga2152a7"
    "sec:orge5fe788"
    "sec:orgef9ecb1"
    "sec:org0c86468"
    "sec:orga68458b"
    "sec:orgdfcc96a"
    "sec:orgdbcf5c7"
    "sec:orgabe2c2f"
    "sec:org3293065"
    "sec:org48a2aee"
    "sec:orgcda0b3f"
    "sec:org5ac6bc6"
    "sec:org906455c"
    "sec:org7c49532"
    "sec:org98639fe")
   (LaTeX-add-bibitems
    "type01")
   (LaTeX-add-bibliographies
    "references")
   (LaTeX-add-xcolor-definecolors
    "shadecolor"))
 :latex)

