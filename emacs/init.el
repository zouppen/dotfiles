;; Entry point for custom Emacs configuration.
;; See README for installation guide
;; This file is symlinked into ~/.emacs.d/personal/init.el
(if (string-equal system-type "windows-nt")
    (setenv "HOME" "c:/Users/Admin/")
    )



(setq dotfiles-folder "~/dotfiles/")

; Fix prelude package problem with undo-tree being unsigned
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq ad-redefinition-action 'accept)

;; TODO dynamic loading?
(let ((conf-files
       '(
         ;"emacs/modes/acme-search.el"
 ;        "emacs/modes/google-translate-mode.el"
         "emacs/general.el"
         "emacs/programming.el"
         "emacs/orgmode.el"
         ;"lang/web/web.el"
         ;"lang/python/python.el"
         ;;"lang/clojure/clojure.el"
)))
(dolist (entry conf-files) (load (concat dotfiles-folder entry))))
