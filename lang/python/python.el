;; Prelude python module includes anaconda-mode

;; Due to Python bug, Mac Homebrew pip installer fails, workaround is to set empty
;; prefix at /usr/local/Frameworks/Python.framework/Versions/2.7/lib/python2.7/distutils/distutils.cfg eg:
;; [install]
;; prefix=

(prelude-require-package 'virtualenvwrapper)

(defun my-anaconda-mode-hook ()
  ;; (setq-local helm-dash-docsets '("Flask" "Python 3"))
  (define-key elpy-mode-map (kbd "M-,") 'pop-tag-mark)
  ;; (elpy-use-ipython)
  )

(add-hook 'anaconda-mode-hook 'my-anaconda-mode-hook)
