(setq emacs-load-start-time (current-time))

;;(setq user-emacs-directory "~/app/emacs.d.debug/")

(setq debug-on-error t
	  gc-cons-threshold (* 20 1024 1024))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(defvar user-emacs-cache-directory (concat user-emacs-directory ".cache/"))

(setq package-enable-at-startup nil
	  package-archives
	  '(("popkit" . "http://elpa.popkit.org/packages/")
		;;("orgcn" . "http://elpa.emacs-china.org/org/")
		;; ("elpa-cn" . "http://elpa.emacs-china.org/gnu/")
		;; ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")

		;; melpa-stable has no spacemacs-theme
		;; ("melpa-stable" . "http://elpa.emacs-china.org/melpa-stable/")
		))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;  (package-install 'diminish))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
;; (setq use-package-debug t)
;; (setq use-package-inject-hooks t)

(require 'init-defaults)
(require 'init-core)
(require 'init-org)
(require 'init-additions)

(require 'server)
(unless (server-running-p) (server-start))

(message
 (format "Emacs startup time: %.3f seconds."
		 (float-time (time-since emacs-load-start-time))))
