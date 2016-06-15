;; General customization for programming modes.

(prelude-require-package 'ess)

(defun my-smartparens-mode-hook ()
  (define-key smartparens-mode-map (kbd "H-n") 'sp-splice-sexp-killing-forward)
  (define-key smartparens-mode-map (kbd "H-p") 'sp-splice-sexp-killing-backward)

  (progn-on "darwin"
            (define-key smartparens-mode-map (kbd "<kp-multiply>")
              'sp-splice-sexp-killing-backward))

  (define-key smartparens-mode-map (kbd "H-f") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "H-b") 'sp-forward-barf-sexp)


  (define-key smartparens-mode-map (kbd "M-<right>") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "M-<left>") 'sp-forward-barf-sexp)
  )

(add-hook 'smartparens-mode-hook 'my-smartparens-mode-hook)

(prelude-require-package 'yasnippet)
(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
(yas-global-mode 1)

(let ((my-yas-custom-dir (concat dotfiles-folder "emacs/snippets/")))
  (setq yas-snippet-dirs (append yas-snippet-dirs (list my-yas-custom-dir))))

(define-key global-map (kbd "<f5>") 'compile)

