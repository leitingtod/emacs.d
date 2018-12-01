(setq inhibit-startup-screen t)
(setq initial-scratch-message "((lambda () (message \"i ❤ emacs\")))")

(setq prefer-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8-unix)

(setq enable-recursive-minibuffers t)
(setq minibuffer-message-timeout 1)
(setq minibuffer-depth-indicate-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)

(setq truncate-lines t)
(setq indent-tabs-mode nil)
(setq highlight-nonselected-windows t)

(setq auto-save-default t)
(setq auto-save-list-file-prefix (concat user-emacs-cache-directory "auto-save/"))

(setq indent-tabs-mode nil)

(global-auto-revert-mode 1)

(tool-bar-mode -1)
;;(menu-bar-mode -1)
(scroll-bar-mode -1)

(provide 'defaults)
