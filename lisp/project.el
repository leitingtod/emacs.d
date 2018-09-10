(use-package persp-mode
  :ensure t
  :defer t
  :init
  (setq persp-save-dir (concat user-emacs-cache-directory "persp-confs/")))

(persp-mode 1)

(use-package projectile
  :ensure t
  :defer t
  :init
  (setq projectile-known-projects-file (concat user-emacs-cache-directory "projectile-bookmarks.eld"))
  :config
  (define-key projectile-mode-map (kbd "C-c o") 'projectile-command-map))

(projectile-mode 1)

(provide 'project)
