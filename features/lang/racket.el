(use-package racket-mode
  :ensure t
  :defer t
  :init
  (add-hook 'racket-mode-hook 'company-mode)
  :config
  ;; smartparens configuration
  (with-eval-after-load 'smartparens
    (add-to-list 'sp--lisp-modes 'racket-mode)
    (when (fboundp 'sp-local-pair)
      (sp-local-pair 'racket-mode "'" nil :actions nil)
      (sp-local-pair 'racket-mode "`" nil :actions nil)))
  ;; remove racket auto-insert of closing delimiter
  ;; see https://github.com/greghendershott/racket-mode/issues/140
  (define-key racket-mode-map ")" 'self-insert-command)
  (define-key racket-mode-map "]" 'self-insert-command)
  (define-key racket-mode-map "}" 'self-insert-command))

(provide 'lang:racket)
