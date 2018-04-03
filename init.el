(setq emacs-load-start-time (current-time))

;;(setq user-emacs-directory "~/app/emacs.d.debug/")

(setq debug-on-error t
	  gc-cons-threshold (* 20 1024 1024))

(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(defvar user-emacs-cache-directory (concat user-emacs-directory ".cache/"))

(require 'package)
(setq package-enable-at-startup nil
	  package-archives
	  '(("popkit" . "http://elpa.popkit.org/packages/")

		;; block by GFW
		;; ("org" . "http://orgmode.org/elpa/")
		;; ("org" . "https://elpa.zilongshanren.com/org/")

		;; ("marmalade" . "http://elpa.zilongshanren.com/marmalade/")
		
		;; ("melpa" . "https://elpa.zilongshanren.com/melpa/")
		
		;; melpa-stable has no spacemacs-theme
		;; ("melpa-stable" . "https://elpa.zilongshanren.com/melpa-stable/")
		))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
;; (setq use-package-debug t)
;; (setq use-package-inject-hooks t)

(require 'init-defaults)
(require 'init-core)
(require 'init-org)

(require 'server)
(unless (server-running-p) (server-start))

(message
 (format "Emacs startup time: %.3f seconds."
	 (float-time (time-since emacs-load-start-time))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(whitespace-cleanup-mode counsel company undo-tree move-text nyan-mode spaceline spacemacs-theme smex ace-window rainbow-delimiters use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "red" :weight bold :height 3.0)))))
