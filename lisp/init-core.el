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

(use-package company
  :ensure t
  :defer t
  :init
  (setq company-idle-delay 0.2
		company-minimum-prefix-length 2
		company-require-match nil
		company-dabbrev-ignore-case nil
		company-dabbrev-downcase nil)
  ;;(add-hook 'company-completion-started-hook 'company-turn-off-fci)
  ;;(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  ;;(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)
  :config
  (diminish 'company-mode "Company"))

;; (use-package company-statistics
;;   :ensure t
;;   :init
;;   (setq company-statistics-file (concat user-emacs-cache-directory "company-statistics-cache.el"))
;;   (add-hook 'company-mode-hook 'company-statistics-mode))

(use-package smex
  :ensure t
  :init
  (setq smex-save-file (concat user-emacs-cache-directory "smex-items")))

(use-package counsel
  :ensure t
  :defer t)

;; (use-package flx
;;   :ensure t)

(use-package swiper
  :ensure t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
		ivy-height 10
		ivy-count-format "(%d/%d) "
		ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :config
  (define-key ivy-minibuffer-map (kbd "S-M-SPC") 'ivy-restrict-to-matches)
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-load-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (diminish 'ivy-mode "Ivy"))

(use-package ace-window
  :ensure t
  :defer t
  :init
  (setq aw-keys '(?j ?k ?l ?m ?n ?o ?p))
  (setq aw-background nil)
  (custom-set-faces
   '(aw-leading-char-face
	 ((t (:foreground "red" :weight bold :height 3.0)))))
  (global-set-key (kbd "C-x o") 'ace-window)
  (global-set-key (kbd "C-x 1") 'ace-delete-window))

(use-package avy
  :ensure t
  :defer t
  :init
  (setq avy-all-windows 'all-frames)
  (setq avy-background t))

(use-package move-text
  :ensure t
  :defer t)

(use-package undo-tree
  :ensure t
  :defer t
  :init
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t)
  :config
  (diminish 'undo-tree-mode "Undo"))

(use-package whitespace-cleanup-mode
  :ensure t
  :defer t
  :init
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :config
  (global-whitespace-clean-up-mode))

;; (use-package ws-butler
;;   :ensure t
;;   :defer t
;;   :config
;;   (ws-butler-global-mode))

(provide 'init-core)
