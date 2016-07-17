(setq emacs-load-start-time (current-time))

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

(require 'server)
(unless (server-running-p) (server-start))

(message
 (format "Emacs startup time: %.3f seconds."
         (float-time (time-since emacs-load-start-time))))
