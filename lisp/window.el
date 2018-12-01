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

(use-package whitespace-cleanup-mode
  :ensure t
  :defer t
  :init
  (setq global-whitespace-cleanup-mode t))

(provide 'window)
