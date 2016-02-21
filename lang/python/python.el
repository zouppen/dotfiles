;; Prelude python module includes anaconda-mode

;; Due to Python bug, Mac Homebrew pip installer fails, workaround is to set empty
;; prefix at /usr/local/Frameworks/Python.framework/Versions/2.7/lib/python2.7/distutils/distutils.cfg eg:
;; [install]
;; prefix=

(prelude-require-package 'virtualenvwrapper)

(defun my-anaconda-mode-hook ()
  ;; (setq-local helm-dash-docsets '("Flask" "Python 3"))
  (define-key anaconda-mode-map (kbd "M-,") 'pop-tag-mark)
  ;; (elpy-use-ipython)
  )

(add-hook 'anaconda-mode-hook 'my-anaconda-mode-hook)

;; http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;; from IPython import embed; embed()

;; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)
;; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
;; don't split windows
(setq py-split-windows-on-execute-p nil)
;; try to automagically figure out indentation
(setq py-smart-indentation t)
