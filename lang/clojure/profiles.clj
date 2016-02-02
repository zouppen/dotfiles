;; Symlink this file to ~/.lein/
{:user
 {:plugins
  [[lein-pprint "1.1.2"]
   [lein-environ "1.0.0"]
   [com.palletops/lein-shorthand "0.4.0"] ;; Repl shortcut commands
   [lein-ancient "0.6.3"]
   
   ;; Static code analysis https://github.com/jonase/kibit
   ;; [lein-kibit "0.1.2"]
   [lein-drip "0.1.1-SNAPSHOT"] 
   [cider/cider-nrepl "0.11.0-SNAPSHOT"]
   ]
  :dependencies
  [
   [org.clojure/tools.nrepl "0.2.12"]
   
   [debugger "0.1.7"]
   [slamhound "1.5.5"]
   ;; [clj-stacktrace "0.2.8"] ;; Pretty stack traces (cider mode does this already)
   [alembic "0.3.2"] ;; Add dependencies to repl session, run lein...
   ]

  :shorthand {. [clojure.pprint/pprint
                 clojure.repl/doc
                 clojure.repl/find-doc
                 clojure.repl/source
                 clojure.repl/dir
                 clojure.repl/pst
                 clojure.repl/apropos

                 debugger.core/break
                 debugger.core/break-catch

                 alembic.still/load-project ; reload project.clj deps
                 alembic.still/distill ; add ad-hoc dep, eg:
                 ;; (./distill '[org.clojure/tools.logging "0.3.2"])
                 ;; (./distill [[org.clojure/tools.logging "0.3.2"]
                 ;;             [org.clojure/somethin.else "0.1.2"]])
                 alembic.still/lein ; run lein, eg:
                 ;; (./lein deps :tree)
                 ]}

  ;; Setup clj-stacktrace https://github.com/mmcgrana/clj-stacktrace
  ;; :injections [
  ;; (let [orig (ns-resolve (doto 'clojure.stacktrace require) 'print-cause-trace)
  ;;       new (ns-resolve (doto 'clj-stacktrace.repl require) 'pst)]
  ;;   (alter-var-root orig (constantly (deref new))))]

  }}
