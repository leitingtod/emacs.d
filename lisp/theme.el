(use-package nyan-mode
  :ensure t
  :config
  (progn
    (setq nyan-wavy-trail t)
    (setq nyan-animate-nyancat t)
    (nyan-mode)))

(use-package spaceline
  :ensure t
  :init
  (progn
    (setq-default powerline-default-separator 'utf-8)
    (setq-default powerline-default-separator 'wave))
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-dark t))

(provide 'theme)
