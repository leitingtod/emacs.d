(setq emacs-start-time (current-time))

;;(setq user-emacs-directory "~/app/emacs.d.debug/")
(setq debug-on-error t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq gc-cons-threshold (* 512 1024 1024))

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
(require 'theme)
(require 'keybindings)
(require 'completion)
(require 'editing)

(message
 (format "Emacs startup time: %.3f seconds."
         (float-time (time-since emacs-start-time))))
