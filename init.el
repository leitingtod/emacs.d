(setq emacs-start-time (current-time))

;;(setq user-emacs-directory "~/app/emacs.d.debug/")
(setq debug-on-error t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq gc-cons-threshold (* 20 1024 1024))

(add-to-list 'load-path (concat user-emacs-directory "lisp/"))
(defvar user-emacs-cache-directory (concat user-emacs-directory ".cache/"))

(setq package-enable-at-startup nil)
(setq package-archives
      '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ))

(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))

(eval-when-compile
  (require 'use-package)
  (require 'diminish)
  (require 'bind-key))

(require 'defaults)
(require 'completion)
(require 'keybindings)
(require 'theme)
(require 'window)

(message
 (format "Emacs startup time: %.3f seconds."
         (float-time (time-since emacs-start-time))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cnfonts org-bullets org-plus-contrib whitespace-cleanup-mode indent-guide persp-mode spacemacs-theme spaceline nyan-mode flx counsel smex diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
