(use-package auto-compile
  :ensure t
  :defer t
  :diminish (auto-compile-mode . "")
  :init
  (setq auto-compile-display-buffer nil
        ;; lets spaceline manage the mode-line
        auto-compile-use-mode-line nil
        auto-compile-mode-line-counter t)
  (add-hook 'emacs-lisp-mode-hook 'auto-compile-mode))

(add-hook 'ielm-mode-hook 'company-mode t)
(add-hook 'emacs-lisp-mode-hook 'company-mode t)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(with-eval-after-load 'eldoc
  (diminish 'eldoc-mode " Ⓔ"))

;; Elisp go-to-definition with M-. and back again with M-,
(use-package elisp-slime-nav
  :ensure
  :defer t
  ;;:diminish elisp-slime-nav-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
  :config
  (diminish 'elisp-slime-nav-mode " Ⓝ"))

(use-package macrostep
  :ensure t
  :defer t
  :mode ("\\*.el\\'" . emacs-lisp-mode))

(setq flycheck-emacs-lisp-load-path 'inherit)

(add-hook 'emacs-lisp-mode-hook 'semantic-mode)
(with-eval-after-load 'semantic
  (semantic-default-elisp-setup))

(use-package srefactor-lisp
  :defer t
  :commands (srefactor-lisp-format-buffer
             srefactor-lisp-format-defun
             srefactor-lisp-format-sexp
             srefactor-lisp-one-line))

(provide 'lang:elisp)
