;; (use-package flycheck-rust
;;   :defer t
;;   :init
;;   (add-hook 'rust-mode-hook 'flycheck-hook)
;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package rust-mode
  :ensure t
  :defer t
  :init
  (add-hook 'rust-mode-hook 'company-mode))

(use-package toml-mode
  :ensure t
  :defer t
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

(use-package racer
    :ensure t
    :defer t
    :config
    (with-eval-after-load 'smartparens
      ;; Don't pair lifetime specifiers
      (sp-local-pair 'rust-mode "'" nil :actions nil))
    (with-eval-after-load 'company-mode
      (add-hook 'rust-mode-hook
                (lambda ()
                  (setq-local company-tooltip-align-annotations t)))))

(provide 'lang:rust)
