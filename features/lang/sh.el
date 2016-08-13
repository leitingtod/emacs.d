(use-package company-shell
  :defer t
  :init
  (push '(company-shell company-fish-shell) company-backends-fish-mode)
  (push 'company-shell company-backends-sh-mode))

(use-package fish-mode
  :defer t
  :init
  (add-hook 'fish-mode-hook 'company-mode))

(use-package sh-script
  :defer t
  :init
  (add-hook 'sh-mode-hook 'company-mode)
  ;; Use sh-mode when opening `.zsh' files, and when opening Prezto runcoms.
  (dolist (pattern '("\\.zsh\\'"
                     "zlogin\\'"
                     "zlogout\\'"
                     "zpreztorc\\'"
                     "zprofile\\'"
                     "zshenv\\'"
                     "zshrc\\'"))
    (add-to-list 'auto-mode-alist (cons pattern 'sh-mode)))

  (defun spacemacs//setup-shell ()
    (when (and buffer-file-name
               (string-match-p "\\.zsh\\'" buffer-file-name))
      (sh-set-shell "zsh")))
  (add-hook 'sh-mode-hook 'spacemacs//setup-shell))
