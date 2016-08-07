;; Entry point for custom Emacs configuration.
;; See README for installation guide
;; This file is symlinked into ~/.emacs.d/personal/init.el

(setq dotfiles-folder "~/dotfiles/")

(setq ad-redefinition-action 'accept)

;; TODO dynamic loading?
(let ((conf-files
       '("emacs/modes/acme-search.el"
         "emacs/modes/google-translate-mode.el"
         "emacs/general.el"
         "emacs/programming.el"
         "emacs/orgmode.el"
         "lang/web/web.el"
         "lang/python/python.el"
         "lang/clojure/clojure.el"
)))
  (dolist (entry conf-files) (load (concat dotfiles-folder entry))))
