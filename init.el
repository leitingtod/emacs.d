(setq emacs-load-start-time (current-time))
(setq user-emacs-directory "~/program/myapp/emacs.d/")

;; Debug
;;(setq debug-on-error t)
;; (add-to-list 'load-path
;; 	     (concat user-emacs-directory
;; 		     "elpa/benchmark-init-20150905.1738/"))
;; (require 'benchmark-init)
;; (benchmark-init/activate)

(add-to-list 'load-path (concat user-emacs-directory "features/"))
(add-to-list 'load-path (concat user-emacs-directory "features/lang"))
(defvar user-emacs-cache-directory (concat user-emacs-directory ".cache/"))
(setq gc-cons-threshold (* 20 1024 1024))

(require 'package)
(setq package-enable-at-startup nil)
(setq
 package-archives
 '(("popkit" . "http://elpa.popkit.org/packages/")))
    
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
;;(setq use-package-debug t)
(setq use-package-inject-hooks t)

;; Modern UI
(require 'modern-ui)

;; Customize defaults
(require 'defaults)

;; Completions
(require 'completion)

;; Checkers
;;(require 'checker)

;; Org, markdown
(require 'org-markdown)

;; Magit
(require 'git)

;; Lisp, scheme, etc
(require 'lang-elisp "elisp.el")

;; Python
;;(require 'lang-python)

;; Golang
;;(require 'lang-go)

;; C/C++
;;(require 'lang-c-c++)

;; Web
;;(require 'lang-web)

;; Javascript
;;(require 'lang-js)

;; PHP
;;(require 'lang-php)

(require 'server)
(unless (server-running-p) (server-start))

(message
 (format "Emacs startup time: %.3f seconds."
         (float-time (time-since emacs-load-start-time))))
