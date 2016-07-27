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

(use-package spacemacs-theme
  :ensure t
  :init
  (require 'spacemacs-dark-theme))

(use-package ace-window
  :defer t
  :init
  (setq aw-keys '(?j ?k ?l ?m ?n ?o ?p))
  (setq aw-background nil)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:foreground "red" :weight bold :height 3.0)))))
  :config
  (global-set-key (kbd "C-x o") 'ace-window)
  (global-set-key (kbd "C-x 1") 'ace-delete-window))

(provide 'modern-ui)

