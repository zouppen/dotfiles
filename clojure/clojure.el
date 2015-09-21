;; Clojure niceties.
(prelude-require-packages '(
                            ;;cider
                            ;; clojure-quick-repls
                            queue
                            clojure-mode
                            cider-eval-sexp-fu
                            rainbow-delimiters
                            clojure-snippets
                            ;;clojure-cheatsheet
                            slamhound
                            ;;sotclojure
                            ))
;; TODO flycheck?

;; Setup stable cider manually
(add-to-list 'load-path "~/konffit/emacs/prelude-personal/modes/cider-0.9.1/")
(require 'cider)

;; Visualize REPL form evaluation
(require 'cider-eval-sexp-fu)

;; Enable company mode for autocomplete
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Enable easier moving around CamelCased names
(add-hook 'cider-repl-mode-hook #'subword-mode)

(defun cider-connect-7888 ()
  "Connect to default figwheel REPL address."
  (interactive)
  (cider-connect "localhost" 7888))

;; Cider to CLJS repl helper
(defun fw-repl ()
  (interactive)
  (insert "(use 'figwheel-sidecar.repl-api)(cljs-repl)")
  (cider-repl-return))

(defun my-clojure-mode-hook ()
  (define-key clojure-mode-map (kbd "C-c C-j") 'cider-connect-7888)
  )

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook 'set-newline-and-indent)


(defun my-cider-mode-hook ()
  (setq cider-test-show-report-on-success t)
  (setq cider-stacktrace-fill-column 80)
  (setq cider-prompt-save-file-on-load nil)
  (setq cider-repl-result-prefix ";; => ")

  (setq cider-repl-use-clojure-font-lock t)

  (define-key cider-mode-map [(super mouse-2)] 'cider-eval-last-sexp)
  
  (define-key cider-mode-map [(hyper mouse-3)] 'acme-cider-find-var)
  (define-key cider-mode-map [(hyper mouse-2)] 'cider-jump-back)

  (define-key clojure-mode-map (kbd "C-c C") #'clojure-cheatsheet)
  
  (setq cider-auto-jump-to-error nil)

  (define-key cider-mode-map (kbd "C-M-.")
    '(lambda ()
       (interactive)
       (split-window-below)
       ;; find var with empty arg to find point var
       (funcall 'cider-find-var "")
       ;;(exit-minibuffer)
       ))
  

  (setq cider-show-error-buffer t);;'only-in-repl)
  (setq cider-auto-select-error-buffer nil)

  (define-key cider-mode-map  [C-M-mouse-3] '(lambda ()
                                               (interactive)
                                               (mouse-drag-region 0)
                                               (cider-find-var)
                                               ;;(split-window-below)
                                               ;;(cider-find-var)
                                               ;;(exit-minibuffer)
                                               ))
  )

(add-hook 'cider-mode-hook 'my-cider-mode-hook)
(add-hook 'cider-mode-hook #'eldoc-mode)

(defun my-cider-repl-mode-hook ()
  (define-key cider-repl-mode-map (kbd "C-c C-j") 'fw-repl))

(add-hook 'cider-repl-mode-hook 'my-cider-repl-mode-hook)



;;Add fancy symbols
(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("(\\(fn\\)[\[[:space:]]"
                     (0 (progn (compose-region (match-beginning 1) (match-end 1) "λ") nil))))))
(eval-after-load 'clojure-mode
  '(font-lock-add-keywords
    'clojure-mode `(("\\(#\\)("
                     (0 (progn (compose-region (match-beginning 1)
                                               (match-end 1) "ƒ")
                               nil))))))
;; (eval-after-load 'clojure-mode
;;  '(font-lock-add-keywords
;;    'clojure-mode `(("\\(#\\){"
;;                     (0 (progn (compose-region (match-beginning 1)
;;                                               (match-end 1) "∈")
;;                               nil))))))
