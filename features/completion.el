(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)
  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
  :config
  (diminish 'company-mode "Ⓒ"))

(use-package company-statistics
  :ensure t
  :init
  (setq company-statistics-file (concat user-emacs-cache-directory "company-statistics-cache.el"))
  (add-hook 'company-mode-hook 'company-statistics-mode))

(provide 'completion)
