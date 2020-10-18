(setq calendar-latitude -36.8)
  (setq calendar-longitude 174.8)
  (setq calendar-location-name "Auckland, NZ")
;;  (setq calendar-latitude 37.8)
;;  (setq calendar-longitude -122.4)
;;  (setq calendar-location-name "San Francisco, US")

;;(setq ns-pop-up-frames nil)
;;(setq default-frame-alist '((top . 25) (left . 50) (width . 130) (height . 35)))
(setq krc/default-font-size 12)
(when window-system (scroll-bar-mode -1))
(setq default-directory "/project")

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(set-language-environment 'utf-8)                                                           
(setq locale-coding-system 'utf-8)                                                          
;; set the default encoding system                                                          
(prefer-coding-system 'utf-8)                                                               
(setq default-file-name-coding-system 'utf-8)                                               
(set-default-coding-systems 'utf-8)                                                         
(set-terminal-coding-system 'utf-8)                                                         
(set-keyboard-coding-system 'utf-8)                                                             
;; Treat clipboard input as UTF-8 string first; compound text next, etc.                    
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(require 'package)
(setq package-enable-at-startup nil)
(defvar gnu '("gnu" . "http://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.org/packages/"))
(defvar melpa-stable '("melpa-stable" . "http://stable.melpa.org/packages/"))
(defvar org-elpa '("org" . "http://orgmode.org/elpa/"))

(add-to-list 'package-archives melpa-stable t)
(add-to-list 'package-archives melpa t)
(add-to-list 'package-archives gnu t)
(add-to-list 'package-archives org-elpa t)

(package-initialize)

;; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure and load use-package
(setq use-package-always-ensure t)
(require 'use-package)

(eval-when-compile
  (defvar use-package-verbose t)
  (require 'use-package))

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(tool-bar-mode 0)
(menu-bar-mode 1)
(scroll-bar-mode 0)

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces 
     '(aw-leading-char-face
        ((t (:inherit ace-jump-face-foreground :height 6.0)))))))

(global-prettify-symbols-mode t)

(use-package alect-themes
  :ensure t)
(defun krc/apply-alect-theme ()
  (setq alect-use-variable-pitch nil)
  (setq alect-height-plus-1 1.0)
  (setq alect-height-plus-2 1.0)
  (setq alect-height-plus-3 1.0)
  (setq alect-height-plus-4 1.0)
  (setq alect-high-contrast-mode-line t)
  (load-theme 'alect-dark t))


;; If this code is being evaluated by =emacs --daemon=, ensure that each subsequent
;; frame is themed appropriately.


(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                  (krc/apply-alect-theme)))
  (krc/apply-alect-theme))

(setq ring-bell-function 'ignore)

(use-package unicode-fonts
 :ensure t
 :init)
 (unicode-fonts-setup)

(require 'unicode-fonts)

(setq krc/default-font "Inconsolata")
(setq krc/current-font-size krc/default-font-size)
(setq krc/font-change-increment 1.1)

(defun krc/font-code ()
  "Return a string representing the current font (like \"Inconsolata-14\")."
  (concat krc/default-font "-" (number-to-string krc/current-font-size)))

(defun krc/set-font-size ()
  "Set the font to `krc/default-font' at `krc/current-font-size'.
Set that for the current frame, and also make it the default for
other, future frames."
  (let ((font-code (krc/font-code)))
    (add-to-list 'default-frame-alist (cons 'font font-code))
    (set-frame-font font-code)))

(defun krc/reset-font-size ()
  "Change font size back to `krc/default-font-size'."
  (interactive)
  (setq krc/current-font-size krc/default-font-size)
  (krc/set-font-size))

(defun krc/increase-font-size ()
  "Increase current font size by a factor of `krc/font-change-increment'."
  (interactive)
  (setq krc/current-font-size
        (ceiling (* krc/current-font-size krc/font-change-increment)))
  (krc/set-font-size))

(defun krc/decrease-font-size ()
  "Decrease current font size by a factor of `krc/font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq krc/current-font-size
        (max 1
             (floor (/ krc/current-font-size krc/font-change-increment))))
  (krc/set-font-size))

(define-key global-map (kbd "C-)") 'krc/reset-font-size)
(define-key global-map (kbd "C-+") 'krc/increase-font-size)
(define-key global-map (kbd "C-=") 'krc/increase-font-size)
(define-key global-map (kbd "C-_") 'krc/decrease-font-size)
(define-key global-map (kbd "C--") 'krc/decrease-font-size)

(krc/reset-font-size)

(when window-system
  (global-hl-line-mode))

(use-package diff-hl
  :ensure t) 
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(use-package rainbow-delimiters
    :ensure t)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;  (use-package paren
;;    :ensure t)
;;  (show-paren-mode 1)

(use-package smartparens
  :ensure t
  :init)
  (smartparens-global-mode 1)
  (show-smartparens-global-mode 1)

(use-package diminish
  :ensure t
  :init) 

(defmacro diminish-minor-mode (filename mode &optional abbrev)
  `(eval-after-load (symbol-name ,filename)
    '(diminish ,mode ,abbrev)))
(defmacro diminish-major-mode (mode-hook abbrev)
  `(add-hook ,mode-hook
             (lambda () (setq mode-name ,abbrev))))
(diminish-minor-mode 'simple 'auto-fill-function)
(diminish-minor-mode 'eldoc 'eldoc-mode)
(diminish-minor-mode 'global-whitespace 'global-whitespace-mode)
(diminish-minor-mode 'projectile 'projectile-mode)
(diminish-minor-mode 'ruby-end 'ruby-end-mode)
(diminish-minor-mode 'subword 'subword-mode)
(diminish-minor-mode 'undo-tree 'undo-tree-mode)
(diminish-minor-mode 'yard-mode 'yard-mode)
(diminish-minor-mode 'yasnippet 'yas-minor-mode)
(diminish-minor-mode 'wrap-region 'wrap-region-mode)
(diminish-major-mode 'emacs-lisp-mode-hook "el")
(diminish-major-mode 'haskell-mode-hook "λ=")
(diminish-major-mode 'lisp-interaction-mode-hook "λ")
(diminish-major-mode 'python-mode-hook "Py")

(global-display-line-numbers-mode)

(global-set-key (kbd "M-p") 'scroll-down-command)
(global-set-key (kbd "M-n") 'scroll-up-command)

(use-package smooth-scrolling
  :ensure t 
  :config 
  (setq smooth-scroll-margin 3
        scroll-conservatively 1
        scroll-preserve-screen-position t
        auto-window-vscroll nil
        scroll-margin 3
        smooth-scrooling-mode 1))
  ;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(3 ((shift) . 9))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 3) ;; keyboard scroll 3 line at a time

(use-package ido
    :ensure t
    :init)
  (use-package ido-vertical-mode
    :ensure t
    :init)
  (use-package flx-ido
    :ensure t
    :init)
  (setq ido-enable-flex-matching t)

  (setq ido-everywhere t)
  (ido-mode 1)
  (flx-ido-mode 1) ; better/faster matching
  (setq ido-create-new-buffer 'always) ; don't confirm to create new buffers
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
;;; Stops Ido searching for similar-named files if I use C-x C-s to create a new 
;;; file and buffer 
(setq ido-auto-merge-delay-time 9)

(use-package smex
  :ensure t
  :init) 

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(defun krc/split-window-below-and-switch ()
  "Split the window horizontally, then switch to the new pane."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun krc/split-window-right-and-switch ()
  "Split the window vertically, then switch to the new pane."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'krc/split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'krc/split-window-right-and-switch)

(defun krc/split-horizontally-for-temp-buffers ()
  (when (one-window-p t)
    (split-window-horizontally)))

(add-hook 'temp-buffer-window-setup-hook
          'krc/split-horizontally-for-temp-buffers)

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode))

(use-package engine-mode
  :ensure t
  :config) 

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

(defengine youtube
  "https://www.youtube.com/results?search_query=%s")

(defun krc/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/configuration.org"))

(global-set-key (kbd "C-c e") 'krc/visit-emacs-config)

;; treemacs: a tree layout file explorer for Emacs
;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :bind
  ("C-c t" . treemacs)
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         40)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))


(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package tabbar
  :ensure t
  :bind
  ;; these don't work in osx terminal becaues iterm intercepts these
  ;; and switches tab
  ;; ("<C-S-iso-lefttab>" . tabbar-backward)
  ;; ("<C-tab>" . tabbar-forward)

  :init
  (progn
    (tabbar-mode t)

    ;; TABBAR STYLES

    (set-face-attribute
     'tabbar-default nil
     :background "gray20"
     :foreground "gray20"
     :box '(:line-width 1 :color "gray20" :style nil))

    (set-face-attribute
     'tabbar-unselected nil
     :background "gray30"
     :foreground "white"
     :underline nil
     :box '(:line-width 5 :color "gray30" :style nil))

    (set-face-attribute
     'tabbar-modified nil
     :background "gray30"
     :foreground "red"
     :underline nil
     :box '(:line-width 5 :color "gray30" :style nil))

    (set-face-attribute
     'tabbar-selected nil
     :background "white"
     :foreground "black"
     :underline nil
     :box '(:line-width 5 :color "white" :style nil))

    ;; highlight is hover behavior
    (set-face-attribute
     'tabbar-highlight nil
     :background "DarkCyan"
     :foreground "green"
     :underline nil
     :box '(:color "DarkCyan" :style nil))

    ;; defaults for button
    (set-face-attribute
     'tabbar-button nil
     :underline nil
     :box '(:line-width 1 :color "white" :style nil))
    ;; (set-face-attribute
    ;;  'tabbar-separator nil
    ;;  :background "gray20"
    ;;  :height 0.6)

    ;; example tabbar coloring code...
    ;; (set-face-attribute
    ;;  'tabbar-default nil
    ;; :background "gray24")
    (set-face-attribute
     'tabbar-unselected nil
     :background "gray34"
     :foreground "white"
     :box '(:line-width 1 :color "white" :style released-button))

    (set-face-attribute
     'tabbar-modified nil
     :background "gray34"
     :foreground "pink"
     :inherit 'tabbar-unselected
     :box '(:line-width 1 :color "white" :style released-button))

    (set-face-attribute
     'tabbar-selected nil
     :background "#bcbcbc"
     :foreground "black"
     :box nil)

    (set-face-attribute
     'tabbar-button nil
     :box '(:line-width 1 :color "gray72" :style released-button))

    (set-face-attribute
     'tabbar-separator nil
     :height 0.7)

    ;; set big fonts
    (set-face-attribute
     'tabbar-button nil
     :inherit 'tabbar-default-face
     :box '(:line-width 1 :color "gray30"))

    (set-face-attribute 'tabbar-default  nil
     ;;:family "Courier"
     :height 1.1)

    (set-face-attribute
     'tabbar-selected nil
     :inherit 'tabbar-default-face
     :foreground "blue3"
     :background "LightGoldenrod"
     :box '(:line-width 1 :color "DarkGoldenrod")
     ;;:overline "black" :underline "black"
     :weight 'bold)

    (set-face-attribute
     'tabbar-unselected nil
     :inherit 'tabbar-default-face
     :box '(:line-width 1 :color "gray70"))
    ;;end set big fonts

    ;; Change padding of the tabs
    ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
    (custom-set-variables
     '(tabbar-separator (quote (0.5))))
    ;; adding spaces
    (defun tabbar-buffer-tab-label (tab)
      "Return a label for TAB.
That is, a string used to represent it on the tab bar."
      (let ((label  (if tabbar--buffer-show-groups
			(format " [%s] " (tabbar-tab-tabset tab))
		      (format " %s " (tabbar-tab-value tab)))))
	;; Unless the tab bar auto scrolls to keep the selected tab
	;; visible, shorten the tab label to keep as many tabs as possible
	;; in the visible area of the tab bar.
	(if tabbar-auto-scroll-flag
	    label
	  (tabbar-shorten
	   label (max 1 (/ (window-width)
			   (length (tabbar-view
                                    (tabbar-current-tabset)))))))))

    )
  )

(global-set-key (kbd "<C-next>")  'tabbar-forward)
(global-set-key (kbd "<C-prior>")  'tabbar-backward)

(use-package sudo-edit
  :ensure t)

(save-place-mode t)

(setq indent-tabs-mode nil)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(setq cua-rectangle-mark-key (kbd "C-^"))
(cua-mode t)

;; Make it so you only need to type 'y' or 'n' not 'yes' or 'no'
 (fset 'yes-or-no-p 'y-or-n-p)

 ;; Support the mouse and colors in the terminal
 (xterm-mouse-mode t)

 ;; "Allow 20MB of memory (instead of 0.76MB) before calling garbage collection. 
 ;; This means GC runs less often, which speeds up some operations."
 (setq gc-cons-threshold 20000000)

 ;; "When opening a file, always follow symlinks."
 (setq vc-follow-symlinks t)

  ;; "Don't assume that sentences should have two spaces after periods. This ain't a typewriter."
 (setq sentence-end-double-space nil)

 ;; "Turn on transient-mark-mode."
 (transient-mark-mode t)

 ;; "If some text is selected, and you type some text, delete the selected text and start inserting your typed text."
 (delete-selection-mode t)

 ;; "Add file sizes in human-readable units (KB, MB, etc) to dired buffers."
 ;;(setq-default dired-listing-switches "-alh")

 ;; "Turn on syntax highlighting whenever possible."
 ;;(global-font-lock-mode t)

 ;; "When something changes a file, automatically refresh the buffer containing that file so they can't get out of sync."
 ;;(global-auto-revert-mode t)

 ;; "When you double-click on a file in the Mac Finder open it as a buffer in the existing Emacs frame, rather than creating a new frame just for that file."
 ;;(setq ns-pop-up-frames nil)

 ;; "When middle-clicking the mouse to yank from the clipboard, insert the text where point is, not where the mouse cursor is."
 (setq mouse-yank-at-point t)

 ;; "Make <home> and <end> move point to the beginning and end of the line, respectively."
 (global-set-key (kbd "<home>") 'move-beginning-of-line)
 (global-set-key (kbd "<end>") 'move-end-of-line)

;; "When saving a file in a directory that doesn't exist, offer to (recursively) create the file's parent directories."
; (add-hook 'before-save-hook
;           (lambda ()
;             (when buffer-file-name
;               (let ((dir (file-name-directory buffer-file-name)))
;                 (when (and (not (file-exists-p dir))
;                            (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
;                   (make-directory dir t))))))

(use-package anzu
  :ensure t
  :config)
(global-anzu-mode +1)
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)

(use-package iedit
  :ensure t
  :commands (iedit-mode)
  :bind* (("C-u" . iedit-mode)))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-window-setup 'current-window)

(use-package auctex
  :defer t
  :ensure t)
  (setq TeX-auto-save t)
  (setq TeX-save-query nil)
  (setq TeX-parse-self t)
  ;;(setq-default TeX-master nil)

(setq TeX-engine-set 'XelaTeX)
(setq TeX-show-compilation t)

(setq org-latex-pdf-process 
  '("xelatex -interaction nonstopmode %f"
    "xelatex -interaction nonstopmode %f")) ;; for multiple passes

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-math-mode)
            (setq TeX-master t)))

(setq doc-view-continuous t)
(setq revert-without-query '(".*"))

(require 'ox-md)
(require 'ox-beamer)

(org-babel-do-load-languages  'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (dot . t)
   (gnuplot . t)
   (R . t)
   (org . t)
   (latex . t )
   (python . t)
   (shell . t)))

(setq org-confirm-babel-evaluate nil)

(setq org-image-actual-width nil)

;;(setq org-startup-with-inline-images t)
;;(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
;;(add-hook 'org-mode-hook 'org-display-inline-images)

(add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))

(setq org-export-with-smart-quotes t)

(setq org-html-postamble nil)

(use-package htmlize
  :ensure t
  :init)

(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  (setq org-latex-default-packages-alist: nil)
  (setq org-latex-with-hyperref: nil)
  (setq org-latex-packages-alist: nil)

(use-package bibretrieve
  :ensure t
  :init)

(add-to-list 'org-latex-classes 
      '("IEEEtran" 
        "\\documentclass[11pt]{IEEEtran}"
        ("\\section{%s}" . "\\section*{%s}")
        ("\\subsection{%s}" . "\\subsection*{%s}")
        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
        ("\\paragraph{%s}" . "\\paragraph*{%s}")
        ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(global-set-key (kbd "M-9") 'visual-line-mode)
(global-set-key (kbd "M-8") 'toggle-truncate-lines)
;;(setq-default visual-line-fringe-indicators 1)

(setq tab-width 2)

;;(global-subword-mode 1)

;;(setq compilation-scroll-output t)

(use-package flycheck
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-flycheck-mode)
    (add-hook 'prog-mode-hook 'flycheck-mode)
    (add-hook 'text-mode-hook 'flycheck-mode)
    (add-hook 'org-mode-hook 'flycheck-mode)
    ;;(add-hook 'python-mode-hook 'flycheck-mode)
    (add-hook 'elpy-mode-hook 'flycheck-mode)
    (add-hook 'ess-mode-hook (lambda () (flycheck-mode t)))
  )
  :custom
  (flycheck-display-errors-delay .3))

(use-package company
  :ensure t
  :init
  (setq company-tooltip-align-annotations t
        company-tooltip-minimum-width 30)
  :config (global-company-mode))

(use-package web-mode 
	:ensure t
	:mode 
	(("\\.phtml\\'" . web-mode)
	("\\.css\\'" . web-mode)	  
	("\\.php\\'" . web-mode)
	("\\.js\\'" . web-mode)
	("\\.jsx\\'" . web-mode)	  
	("\\.jsp\\'" . web-mode)		
	("\\.as[cp]x\\'" . web-mode)	
	("\\.erb\\'" . web-mode)		
	("\\.mustache\\'" . web-mode)	
	("\\.djhtml\\'" . web-mode)		
	("\\.jst.ejs\\'" . web-mode)	
	("\\.html?\\'" . web-mode))
      :init
	(setq web-mode-enable-block-face t)
	(setq web-mode-enable-comment-keywords t)
	(setq web-mode-enable-current-element-highlight t)
	(setq web-mode-enable-current-column-highlight t)	
	(setq web-mode-script-padding 2)
	(setq web-mode-style-padding 2)
	(setq web-mode-comment-style 2)
	(setq web-mode-code-indent-offset 2)
	(setq web-mode-markup-indent-offset 2)
	(setq web-mode-css-indent-offset 2)
	(setq web-mode-css-indent-level 2)
        (setq web-mode-auto-close-style 2)
        ;; let smartparens handle these
        (setq web-mode-enable-auto-quoting nil)
        (setq web-mode-enable-auto-pairing nil))


;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))


;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

(defun pk-web-mode-hook ()
  "Hooks for Web mode."
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#e8e815")
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "#e5c900")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#ebabde")
  (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#8cf1f1")
  ;;(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#42f2ff")
  )
(add-hook 'web-mode-hook  'pk-web-mode-hook)

(use-package prettier-js
    :ensure t
    :config)

(add-hook 'web-mode-hook 'prettier-js-mode)

(use-package js2-mode
:ensure t
:init)

(use-package json-mode
:ensure t
:mode "\\.json\\'"
:init)

;; TypeScript
(use-package typescript-mode
:ensure t
:mode "\\.ts\\'"
:init)

;; (use-package rjsx-mode 
;; :ensure t
;; :mode (("\\.jsx\\'" . rjsx-mode)
;;        ("\\.js\\'" . rjsx-mode))
;; :init)


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :config
  (progn
    (add-hook 'typescript-mode-hook #'setup-tide-mode)
    (add-hook 'rjsx-mode-hook #'setup-tide-mode)
    (add-hook 'before-save-hook 'tide-format-before-save)))


     ;; this magic incantation fixes highlighting of jsx syntax in .js files
	 (setq web-mode-content-types-alist
	       '(("jsx" . "\\.js[x]?\\'")))
	 (add-hook 'web-mode-hook
	       (lambda ()
		 (setq web-mode-code-indent-offset 2)
		 (when (string-equal "tsx" (file-name-extension buffer-file-name))
		   (setup-tide-mode))
		 (when (string-equal "jsx" (file-name-extension buffer-file-name))
		   (setup-tide-mode))
		 (when (string-equal "js" (file-name-extension buffer-file-name))
		   (progn
		     (setup-tide-mode)
		     (with-eval-after-load 'flycheck
		       (flycheck-add-mode 'typescript-tslint 'web-mode)
		       (flycheck-add-mode 'javascript-tide 'web-mode))))))

(use-package apache-mode     
  :ensure t
  :init)

(use-package flyspell
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    (add-hook 'text-mode-hook 'flyspell-mode)
    (add-hook 'org-mode-hook 'flyspell-mode)
    )
  :config
  ;; Sets flyspell correction to use two-finger mouse click
  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
)

(use-package find-file-in-project
    :ensure t
    :config)

  (use-package highlight-indentation
  :ensure t
    :config)

  (use-package elpy
    :ensure t
    :config
    (elpy-enable))

  (setq elpy-rpc-backend "jedi")                    

  (setq elpy-modules '(elpy-module-company
                       elpy-module-eldoc
                       elpy-module-pyvenv
                       elpy-module-yasnippet
                       elpy-module-sane-defaults
                       ;;elpy-module-rope
                       ;;elpy-module-autopep8
                       ;;elpy-module-yapf
                       ;;elpy-module-jedi
)
)

    
  (use-package pyvenv
    :ensure t
    :config)

  (pyvenv-activate "~/Environments/project_01/myenv")
  
  (setq python-shell-completion-native-disabled-interpreters '("python"))                                                                                                                                                       
                                                                                                                                               
  (setq python-indent-guess-indent-offset t)  
  (setq python-indent-guess-indent-offset-verbose nil)

  ;;(setq python-use-auto-complete t)
  ;;(setq python-shell-interpreter "python3")

(use-package ess
  :ensure t
  :init (require 'ess-site))

;; Supposedly AC and ESS have default use to TRUE
;; (setq ess-use-auto-complete t) 

;; R process opens in own frame - if wanted
;;(setq inferior-ess-own-frame t)


(add-hook 'ess-R-post-run-hook 'ess-execute-screen-options) 
(ess-toggle-underscore nil) 



;;(setq ess-fancy-comments nil)
;;(setq ess-indent-with-fancy-comments nil)

(setq ess-eval-visibly-p nil)
(setq ess-ask-for-ess-directory nil)


(define-key ess-mode-map [(control return)] nil)
(define-key ess-mode-map [(shift return)] 'ess-eval-region-or-line-and-step)

;; To control the indentation level remove default settings
;; OR select C-c C-e C-s
(setq ess-set-style 'RStudio)
(defun r-custom ()
  (setq ess-default-style 'OWN)
  (setq ess-indent-level 2))
;; To auto-indent the whole buffer: mark the whole buffer C-x h and then indent the region with C-M-\

(add-hook 'ess-mode-hook 'r-custom)
;; (setq ess-indent-level 2)
;;(setq ess-default-style 'DEFAULT)

;; (autoload 'r-mode "ess-site" "(Autoload)" t)

(use-package poly-markdown
  :ensure t)
(use-package poly-R
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown-mode))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))
