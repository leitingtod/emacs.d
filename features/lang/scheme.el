(use-package geiser
  :ensure t
  :defer t
  :commands run-geiser
  :init
  (add-hook 'scheme-mode'company-mode))

(provide 'lang:scheme)
