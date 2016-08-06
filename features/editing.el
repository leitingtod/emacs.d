(use-package avy
  :ensure t
  :defer t
  :init
  (setq avy-all-windows 'all-frames)
  (setq avy-background t))

(use-package expand-region
  :defer t
  :init
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package hexl
  :ensure t
  :defer t)

(use-package hungry-delete
  :ensure t
  :defer t
  :config
  ;; only horizontal whitespace
  (setq-default hungry-delete-chars-to-skip " \t\f\v")
  (define-key hungry-delete-mode-map (kbd "DEL") 'hungry-delete-backward)
  (define-key hungry-delete-mode-map (kbd "S-DEL") 'delete-backward-char))

(use-package move-text
  :ensure t
  :defer t)

(use-package origami
  :ensure t
  :init
  (global-origami-mode)
  :config
  (defun origami-elisp-parser (create)
    (origami-lisp-parser create "(\\(use-package\\|def\\)\\w*\\s-*\\(\\s_\\|\\w\\|[:?!]\\)*\\([ \\t]*(.*?)\\)?"))
  (diminish 'origami-mode " Ⓕ"))

(use-package smartparens
  :ensure
  :defer t
  :commands (sp-split-sexp sp-newline sp-up-sexp)
  :init
  (add-hook 'prog-mode-hook 'smartparens-strict-mode)
  (add-hook 'comint-mode-hook 'smartparens-strict-mode)
  ;; enable smartparens-mode in `eval-expression'
  (defun conditionally-enable-smartparens-mode ()
    "Enable `smartparens-mode' in the minibuffer, during `eval-expression'."
    (if (eq this-command 'eval-expression)
        (smartparens-mode)))
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-smartparens-mode)
  (setq sp-show-pair-delay 0.2
        ;; fix paren highlighting in normal mode
        sp-show-pair-from-inside t
        sp-cancel-autoskip-on-backward-movement nil)
  :config
  (require 'smartparens-config)
  (diminish 'smartparens-mode " Ⓟ")
  (show-smartparens-global-mode +1)
  (defun spacemacs/smartparens-pair-newline (id action context)
    (save-excursion
      (newline)
      (indent-according-to-mode)))

  (defun spacemacs/smartparens-pair-newline-and-indent (id action context)
    (spacemacs/smartparens-pair-newline id action context)
    (indent-according-to-mode))

  ;; don't create a pair with single quote in minibuffer
  (sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

  (sp-pair "{" nil :post-handlers
           '(:add (spacemacs/smartparens-pair-newline-and-indent "RET")))
  (sp-pair "[" nil :post-handlers
           '(:add (spacemacs/smartparens-pair-newline-and-indent "RET")))

  (defun spacemacs/smart-closing-parenthesis ()
    (interactive)
    (let* ((sp-navigate-close-if-unbalanced t)
           (current-pos (point))
           (current-line (line-number-at-pos current-pos))
           (next-pos (save-excursion
                       (sp-up-sexp)
                       (point)))
           (next-line (line-number-at-pos next-pos)))
      (cond
       ((and (= current-line next-line)
             (not (= current-pos next-pos)))
        (sp-up-sexp))
       (t
        (insert-char ?\)))))))

(use-package undo-tree
  :ensure t
  :defer t
  :init
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t)
  :config
  (diminish 'undo-tree-mode " Ⓤ"))

(use-package whitespace-cleanup-mode
  :ensure t
  :defer t
  :init
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :config
  (global-whitespace-clean-up-mode))

(use-package ws-butler
  :ensure t
  :defer t
  :config
  (ws-butler-global-mode))

(provide 'editing)
