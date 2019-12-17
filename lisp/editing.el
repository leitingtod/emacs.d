(use-package persp-mode
  :ensure t
  :defer t
  :init
  (setq persp-save-dir (concat user-emacs-cache-directory "persp-confs/")))

(persp-mode 1)

(use-package indent-guide
  :ensure t
  :defer t)

(indent-guide-global-mode)

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package paren
  :ensure t
  :defer
  :init
  (show-paren-mode t))

(electric-pair-mode t)

(use-package whitespace-cleanup-mode
  :ensure t
  :defer t
  :init
  (setq global-whitespace-cleanup-mode t))

(provide 'editing)
