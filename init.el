(setq emacs-load-start-time (current-time))

;; Debug
;;(setq user-emacs-directory "~/program/myapp/emacs.d/")
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
   ("org" . "http://orgmode.org/elpa/")
   ;;("melpa" . "https://elpa.zilongshanren.com/melpa/")
   ;;("marmalade" . "http://elpa.zilongshanren.com/marmalade/")
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

(require 'server)
(unless (server-running-p) (server-start))

(let ((pkg-installed
       (- (length
           (directory-files (concat user-emacs-directory "elpa/")))
          4)))
  (message
   (format "Emacs startup time: %.3f seconds, %d packages loaded."
           (float-time (time-since emacs-load-start-time)) pkg-installed)))
