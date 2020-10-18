
;; Define the start time so we can measure how long loading took later.
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(package-initialize)

(defconst emacs-start-time (current-time))

;; Turn on debugging. This is for ensuring we get decent errors when
;; the startup is messed up.
(setq debug-on-error t
      debug-on-quit t)

;; Load the org-mode file. This has everything aside from the timing.
(require 'org)
(org-babel-load-file
  (expand-file-name "configuration.org" user-emacs-directory))

;; Now that we're done loading, we disable debugging since we don't
;; need it any more
(setq debug-on-error nil
      debug-on-quit nil)

;; Now that we're done loading everything, print how long it took.
(when window-system
  (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
    (message "Loading %s...done (%.3fs)" load-file-name elapsed))

  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed)))
            t))


  ;; flymake is superseded by flycheck so remove
  (remove-hook 'flymake-diagnostic-functions 'flymake-proc-legacy-flymake)





 ;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8d805143f2c71cfad5207155234089729bb742a1cb67b7f60357fdd952044315" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(elpy-autodoc-delay 0.2)
 '(org-babel-load-languages (quote ((emacs-lisp . t) (R . t))))
 '(org-confirm-babel-evaluate nil)
 '(package-selected-packages
   (quote
    (virtualenvwrapper which-key web-mode use-package unicode-fonts undo-tree solarized-theme smooth-scrolling smex python-mode py-autopep8 projectile paredit org-bullets material-theme lua-mode less-css-mode json-mode irony-eldoc ido-vertical-mode ido-ubiquitous flycheck flx-ido fic-mode engine-mode elpy ein diminish diff-hl jedi cmake-mode better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 6.0)))))
(put 'downcase-region 'disabled nil)
