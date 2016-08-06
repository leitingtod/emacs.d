(use-package counsel
  :ensure t)

(use-package flx
  :ensure t)

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
  (diminish 'ivy-mode " Ⓘ"))

(use-package smex
  :ensure t
  :init
  (setq smex-save-file (concat user-emacs-cache-directory "smex-items")))

;; (use-package hydra
;;   :ensure t
;;   :config
;;   (progn
;;     (defhydra hydra-zoom ()
;;       "zoom"
;;       ("j" text-scale-increase "in")
;;       ("k" text-scale-decrease "out")
;;       ("r" (text-scale-set 0) "reset")
;;       ("q" nil "quit"))
;;     (global-set-key (kbd "C-c -") 'hydra-zoom/body)

;;     (defhydra hydra-vi (:pre (set-cursor-color "#e52b50")
;;               :post (set-cursor-color "#ffffff")
;;               :color pink)
;;       "vi"
;;       ;; movement
;;       ("f" forward-word)
;;       ("b" backward-word)
;;       ;; scrolling
;;       ("C-v" scroll-up-command nil)
;;       ("M-v" scroll-down-command nil)
;;       ("n" (scroll-down-command))
;;       ("SPC" (scroll-down-command))
;;       ("p" (scroll-up command))
;;       ("S-SPC" (scroll-up command))
;;       ("v" recenter-top-bottom)
;;       ;; arrows
;;       ("h" backward-char)
;;       ("j" next-line)
;;       ("k" previous-line)
;;       ("l" forward-char)
;;       ;; delete
;;       ("x" delete-char)
;;       ;;("d" hydra-vi-del/body "del" :exit t)
;;       ("u" undo)
;;       ;; should be generic "open"
;;       ("r" push-button "open")
;;       ("." hydra-repeat)
;;       ;; bad
;;       ("m" set-mark-command "mark")
;;       ("a" move-beginning-of-line "beg")
;;       ("e" move-end-of-line "end")
;;       ("y" kill-ring-save "yank" :exit t)
;;       ;; exit points
;;       ("q" nil "ins")
;;       ("C-n" (forward-line 1) nil :exit t)
;;       ("C-p" (forward-line -1) nil :exit t))
;;     (global-set-key (kbd "C-c v") 'hydra-vi/body)))

(use-package ivy-hydra
  :ensure t)

(use-package projectile
  :commands (projectile-ack
             projectile-ag
             projectile-compile-project
             projectile-dired
             projectile-find-dir
             projectile-find-file
             projectile-find-tag
             projectile-test-project
             projectile-grep
             projectile-invalidate-cache
             projectile-kill-buffers
             projectile-multi-occur
             projectile-project-p
             projectile-project-root
             projectile-recentf
             projectile-regenerate-tags
             projectile-replace
             projectile-replace-regexp
             projectile-run-async-shell-command-in-root
             projectile-run-shell-command-in-root
             projectile-switch-project
             projectile-switch-to-buffer
             projectile-vc)
  :init
  ;; note for Windows: GNU find or Cygwin find must be in path to enable
  ;; fast indexing
  (when (and (eq system-type 'window-nt) (executable-find "find"))
    (setq  projectile-indexing-method 'alien
           projectile-generic-command "find . -type f"))
  (setq projectile-completion-system 'ivy
        projectile-sort-order 'recentf
        projectile-cache-file (concat user-emacs-cache-directory "projectile.cache")
        projectile-known-projects-file (concat user-emacs-cache-directory "projectile-bookmarks.eld")))

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
  (diminish 'company-mode "Ⓒ"))

(use-package company-statistics
  :ensure t
  :init
  (setq company-statistics-file (concat user-emacs-cache-directory "company-statistics-cache.el"))
  (add-hook 'company-mode-hook 'company-statistics-mode))

(use-package semantic
  :defer t
  :init
  (setq srecode-map-save-file
        (concat user-emacs-cache-directory
                "srecode-map.el"))
  (setq semanticdb-default-save-directory
        (concat user-emacs-cache-directory
                "semanticdb/"))
  :config
  (add-to-list 'semantic-default-submodes
               'global-semantic-stickyfunc-mode)
  (add-to-list 'semantic-default-submodes
               'global-semantic-idle-summary-mode))

(provide 'completion)
