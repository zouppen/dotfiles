;;; TODO add major mode agnostic settings

;; Disable some Prelude defaults
(setq prelude-whitespace nil)


(defmacro progn-on (platform &rest body)
  "Evaluate given expressions if running on given platform."
  (if (string-equal system-type platform)
      (cons 'progn body)))

;; Run emacs server so emacsclient can connect.
(load "server")
(unless (server-running-p) (server-start))

(progn-on
 "darwin"
 (setq ns-use-native-fullscreen nil)
 (setq mac-option-modifier 'nil
       mac-command-modifier 'meta
       mac-function-modifier 'hyper)
 (set-variable 'magit-emacsclient-executable
               "/usr/local/bin/emacsclient"))
