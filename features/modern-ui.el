(use-package nyan-mode
  :ensure t
  :config
  (progn
    (setq nyan-wavy-trail t)
    (setq nyan-animate-nyancat t)
    (nyan-mode)
    ;; explicitly re-enable the cat for the first GUI client
    (spacemacs|do-after-display-system-init
     (nyan-mode -1)
     (nyan-mode))))

(use-package spaceline
  :ensure t
  :init
  (progn
    (setq-default powerline-default-separator 'utf-8)
    (spacemacs|do-after-display-system-init
     (setq-default powerline-default-separator 'wave)))
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(use-package spacemacs-theme
  :ensure t
  :init
  (spacemacs|do-after-display-system-init
   (require 'spacemacs-dark-theme)))

(provide 'modern-ui)

