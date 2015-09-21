;; General customization for programming modes.

(defun my-smartparens-mode-hook ()
  (define-key smartparens-mode-map (kbd "H-n") 'sp-splice-sexp-killing-forward)
  (define-key smartparens-mode-map (kbd "H-p") 'sp-splice-sexp-killing-backward)

  ;; Mac workaround, TODO eval mac only
  (define-key smartparens-mode-map (kbd "<kp-multiply>") 'sp-splice-sexp-killing-backward)
  
  
  (define-key smartparens-mode-map (kbd "H-f") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "H-b") 'sp-forward-barf-sexp)
  

  (define-key smartparens-mode-map (kbd "M-<right>") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "M-<left>") 'sp-forward-barf-sexp)
  )

(add-hook 'smartparens-mode-hook 'my-smartparens-mode-hook)
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '((concat dotfiles-folder "/emacs/yasnippets"))))
