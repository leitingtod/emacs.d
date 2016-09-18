(use-package js2-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; Required to make imenu functions work correctly
  (add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
  (add-hook 'js2-mode-hook 'company-mode)
  ;;(add-hook 'js2-mode-hook 'flycheck-mode)
  )

(use-package js2-refactor
  :ensure t
  :defer t
  :init
  (add-hook 'js2-mode-hook
            (lambda ()
              (require 'js2-refactor))))

(use-package json-mode
  :ensure t
  :defer t)

(use-package json-snatcher
  :ensure t
  :defer t)

(use-package web-beautify
  :ensure t
  :defer t)

(use-package tern
  :ensure t
  :defer t
  :init
  (add-hook 'js2-mode-hook 'tern-mode)
  :config
  (add-to-list 'tern-command "--no-port-file" 'append))

(use-package company-tern
  :ensure t
  :defer t
  :init
  ;;(push 'company-tern company-backends-js2-mode)
  )

(use-package skewer-mode
  :ensure t
  :defer t
  :init
  (add-hook 'js2-mode-hook 'skewer-mode))

(use-package livid-mode
  :ensure t
  :defer t)

(provide 'lang:javascript)
