(setq user-emacs-directory "~/program/myapp/emacs.d/")
(add-to-list 'load-path (concat user-emacs-directory "features/"))
(defvar user-emacs-cache-directory (concat user-emacs-directory ".cache/"))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish) ;; if you use :diminish
(require 'bind-key) ;; if you use any :bind variant
;;(setq use-package-debug t)

;; Modern UI
(require 'modern-ui)

;; Customize defaults
(require 'defaults)

;; Prerequisites packages
(require 'bootstrap)

;; Auto completion
(require 'completion)


;; Lisp, scheme, etc
;;(require 'lang-lisp)

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
;;(require 'lang-php

