;; Entry point for Emacs configurations.
;; This file is symlinked into ~/.emacs.d/personal/init.el after Prelude install

(setq dotfiles-folder "~/dotfiles/")

;; TODO dynamic loading?
(let ((conf-files
       '("emacs/modes/acme-search.el"
         "emacs/general.el"
         "emacs/orgmode.el"
         ;;"lang/python/python.el"
         ;;"lang/clojure/clojure.el"
         ;;"lang/web/web.el"
)))
  (dolist (entry conf-files) (load (concat dotfiles-folder entry))))