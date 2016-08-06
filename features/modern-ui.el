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

(use-package fill-column-indicator
  :ensure t
  :defer t
  :init
  (setq fci-rule-width 1)
  (setq fci-rule-color "#D0BF8F")
  ;; manually register the minor mode since it does not define any
  ;; lighter
  (push '(fci-mode "") minor-mode-alist)
  (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
  ;;(global-fci-mode 1)
  (add-hook 'after-change-major-mode-hook 'fci-mode)
  :config
  (diminish 'fci-mode " ⓕ"))

(use-package hl-todo
  :ensure t
  :defer t
  :init
  (add-hook 'text-mode-hook 'hl-todo-mode)
  (add-hook 'prog-mode-hook 'hl-todo-mode))

(setq scroll-preserve-screen-position t
      scroll-margin 0
      scroll-conservatively 0)

(use-package golden-ratio
  :ensure t
  :defer t
  :config
  ;; golden-ratio-exclude-modes
  (dolist (m '("bs-mode"
               "calc-mode"
               "ediff-mode"
               "dired-mode"
               "gud-mode"
               "gdb-locals-mode"
               "gdb-registers-mode"
               "gdb-breakpoints-mode"
               "gdb-threads-mode"
               "gdb-frames-mode"
               "gdb-inferior-io-mode"
               "gdb-disassembly-mode"
               "gdb-memory-mode"
               "speedbar-mode"
               ))
    (add-to-list 'golden-ratio-exclude-modes m))
  ;; golden-ratio-extra-commands
  (dolist (f '(ace-window
               ace-delete-window
               ace-select-window
               ace-swap-window
               ace-maximize-window
               avy-pop-mark
               buf-move-left
               buf-move-right
               buf-move-up
               buf-move-down
               quit-window
               windmove-left
               windmove-right
               windmove-up
               windmove-down))
    (add-to-list 'golden-ratio-extra-commands f))
  ;; golden-ratio-exclude-buffer-names
  (dolist (n '(" *NeoTree*"
               "*LV*"
               " *which-key*"))
    (add-to-list 'golden-ratio-exclude-buffer-names n))
  ;; (add-to-list 'golden-ratio-inhibit-functions
  ;;              'spacemacs/no-golden-ratio-guide-key)
  (global-ratio-mode 1)
  (diminish 'golden-ratio-mode " ⓖ"))

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package indent-guide
  :ensure t
  :defer t
  :init
  (setq indent-guide-delay 0.3)
  :config
  (diminish 'indent-guide-mode " ⓘ"))

(use-package column-enforce-mode
  :ensure t
  :commands (column-enforce-mode global-column-enforce-mode)
  :config
  (diminish 'column-enforce-mode "⑧"))

(use-package hl-anything
  :ensure t
  :init
  (hl-highlight-mode)
  (setq-default hl-highlight-save-file
                (concat user-emacs-cache-directory ".hl-save"))
  :config
  (diminish 'hl-highlight-mode " Ⓗ"))

(provide 'modern-ui)
