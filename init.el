(setq emacs-load-start-time (current-time))
(setq user-emacs-directory "~/program/myapp/emacs.d/")

;; Debug
(setq debug-on-error t)
;; (add-to-list 'load-path
;;       (concat user-emacs-directory
;;           "elpa/benchmark-init-20150905.1738/"))
;; (require 'benchmark-init)
;; (benchmark-init/activate)

(add-to-list 'load-path (concat user-emacs-directory "features/"))
(defvar user-emacs-cache-directory (concat user-emacs-directory ".cache/"))
(setq gc-cons-threshold (* 20 1024 1024))

(require 'package)
(setq package-enable-at-startup nil)
(setq
 package-archives
 '(;;("org" . "https://elpa.zilongshanren.com/org/")
   ;;("melpa" . "https://elpa.zilongshanren.com/melpa/")
   ("popkit" . "http://elpa.popkit.org/packages/")
   ;; melpa-stable has no spacemacs-theme
   ;;("melpa-stable" . "https://elpa.zilongshanren.com/melpa-stable/")
   ))

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

;; Editing
(require 'editing)

;; Org, markdown
(require 'org-markdown)

;; Magit
(require 'git)

;; Programing Languages
(defmacro require-feature (pkg)
  `(let* ((split (split-string (symbol-name ,pkg) ":"))
          (dir (car split))
          (file (cadr split)))
     (progn
       (add-to-list 'load-path (concat user-emacs-directory "features/" dir "/"))
       (require ,pkg file))))

(require-feature 'lang:elisp)
(require-feature 'lang:racket)


(require 'server)
(unless (server-running-p) (server-start))

(let ((pkg-installed
       (- (length
           (directory-files (concat user-emacs-directory "elpa/")))
          4)))
  (message
   (format "Emacs startup time: %.3f seconds, %d packages loaded."
           (float-time (time-since emacs-load-start-time)) pkg-installed)))
