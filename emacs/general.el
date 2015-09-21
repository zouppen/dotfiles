;;; TODO add major mode agnostic settings

;;;; Disable some Prelude defaults
(setq prelude-whitespace nil)

;;;; Customize default config variables

(defmacro progn-on (platform &rest body)
  "Evaluate given expressions if running on given platform."
  (if (string-equal system-type platform)
      (cons 'progn body)))

;; Run emacs server so emacsclient can connect.
(load "server")
(unless (server-running-p) (server-start))

(setq calendar-week-start-day 1) ; Week starts on monday
(scroll-bar-mode -1) ; Disable scroll bars

;; Make scratch-buffer more convenient
(setq initial-scratch-message "")
(setq initial-major-mode 'org-mode)

(defun show-or-create-scratch ()
  "Shows a scratch buffer or creates another one if visiting one."
  (interactive)
  (if (string-match "*scratch*" (buffer-name))
      (progn
        (switch-to-buffer (get-buffer-create (concat (buffer-name) "*")))
        (princ "Created a new scratch buffer."))
    (progn (switch-to-buffer
            (get-buffer-create "*scratch*")))))

(global-set-key (kbd "C-c <escape>") 'show-or-create-scratch)

(progn-on
 "darwin"
 (setq ns-use-native-fullscreen nil)
 (setq mac-option-modifier 'nil
       mac-command-modifier 'meta
       mac-function-modifier 'hyper)
 (set-variable 'magit-emacsclient-executable
               "/usr/local/bin/emacsclient"))

;; Pop marks faster by repeated spacing
(setq set-mark-command-repeat-pop 't)

(global-set-key (kbd "H-m o") 'org-mode)
(global-set-key (kbd "H-m t") 'text-mode)
(global-set-key (kbd "H-m q") 'fundamental-mode)
(global-set-key (kbd "H-m m") 'markdown-mode)
(global-set-key (kbd "H-m e") 'emacs-lisp-mode)
(global-set-key (kbd "H-m c") 'clojure-mode)
(global-set-key (kbd "H-m v") 'csv-mode)
(global-set-key (kbd "H-m x") 'xml-mode)
(global-set-key (kbd "H-m p") 'python-mode)
(global-set-key (kbd "H-m r") 'ruby-mode)
(global-set-key (kbd "H-m s") 'shell-script-mode)
(global-set-key (kbd "H-m j") 'javascript-mode)
(global-set-key (kbd "H-m h") 'html-mode)
(global-set-key (kbd "H-m w") 'writeroom-mode)

(global-set-key (kbd "<C-M-backspace>") 'prelude-top-join-line)
(global-set-key (kbd "C-c C-SPC") 'comment-or-uncomment-region)

;; Window splitting keys as seen in Terminator
(global-set-key (kbd "C-S-o") '(lambda ()
                                 (interactive)
                                 (split-window-vertically nil)))
(global-set-key (kbd "C-M-o") '(lambda ()
                                 (interactive)
                                 (split-window-horizontally nil)))
(global-set-key (kbd "C-M-w") '(lambda ()
                                 (interactive)
                                 (delete-window)))


;; Chromium like window changing
(prelude-require-package 'window-numbering)
(window-numbering-mode t)

(prelude-require-package 'multiple-cursors)
(setq mc/list-file (concat dotfiles-folder "/emacs/mc-lists.el"))

(key-chord-define-global "jn" 'mc/mark-more-like-this-extended)
;; TODO 'mc/mark-more-like-this-extended for previous to make it work.
;; (key-chord-define-global "jp" 'mc/mark-previous-like-this)

(key-chord-define-global "jm" 'mc/mark-all-like-this)
(key-chord-define-global "jt" 'mc/mark-sgml-tag-pair)
(key-chord-define-global "kd" 'mc/edit-lines)


(prelude-require-package 'edit-server)
(edit-server-start) ; Edit server chromium extension
;; When editing text in Trello, use markdown mode.
(add-hook 'edit-server-start-hook
          '(lambda ()
             (if (string-match "trello.com/" (buffer-name))
                 (markdown-mode))))


;;;; File browsing
(prelude-require-package 'neotree)
(define-key global-map (kbd "C-x D") 'neotree-toggle)
(global-set-key (kbd "C-x F") 'nil)
(define-key global-map (kbd "C-x F") 'neotree-dir)

(defun dired-open-in-external-app ()
  "Open the current file or dired marked files in external app."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           (t (list (buffer-file-name))) ) ) )

    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files?") ) )

    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath)
                (w32-shell-execute "open" (replace-regexp-in-string "/" "\\"
                                                                    fPath t t)) )
              myFileList))
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )
              myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil))
                                (start-process "" nil "xdg-open" fPath)))
              myFileList))))))

(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "0" 'dired-open-in-external-app)))

(progn-on "darwin"
          (let ((terminal-app (concat dotfiles-folder "/osx/bin/iterm")))
            (defun open-file-path-in-terminal ()
              "Open current directory in dired mode in terminal application.
               Dismiss shell output buffer afterwards."
              (interactive)
              (start-process (concat dotfiles-folder "/osx/bin/iterm") nil
                             (concat dotfiles-folder "/osx/bin/iterm")
                             (file-truename default-directory)))))

(progn-on "gnu-linux"
          (defun open-file-path-in-terminal ()
            "Open current directory in dired mode in terminal application.
             Dismiss shell output buffer afterwards."
            (interactive)
            (start-process "terminator" nil "terminator"
                           (concat "--working-directory="
                                   (file-truename default-directory)))))

(define-key global-map (kbd "C-c 0") 'open-file-path-in-terminal)

(provide 'general)
;;; general.el ends here