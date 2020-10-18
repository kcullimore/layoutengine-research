
;; Define the start time so we can measure how long loading took later.
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
;; (package-initialize)

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
