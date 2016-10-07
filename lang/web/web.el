(prelude-require-packages '(emmet-mode skewer-mode
                                       ))

(defun my-emmet-mode-hook ()
  (define-key emmet-mode-keymap (kbd "C-j") nil)
  (define-key emmet-mode-keymap (kbd "C-M-<tab>") 'emmet-next-edit-point)
  (setq emmet-move-cursor-between-quotes t) ;; default nil
  )

(add-hook 'emmet-mode-hook 'my-emmet-mode-hook)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; Fix yasnippet activation
(add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'html-mode)))

(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(provide 'web.el)
;;; web.el ends here
