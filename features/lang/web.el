(use-package css-mode
  :ensure t
  :defer t
  :init
  ;;(push 'company-css company-backends-css-mode)
  ;; Mark `css-indent-offset' as safe-local variable
  (put 'css-indent-offset 'safe-local-variable #'integerp))

(use-package emmet-mode
  :ensure t
  :defer t
  :init
  (add-hook 'css-mode-hook 'emmet-mode )
  (add-hook 'sass-mode-hook 'emmet-mode )
  (add-hook 'scss-mode-hook 'emmet-mode )
  (add-hook 'web-mode-hook 'emmet-mode ))

(use-package company
  :ensure t
  :defer t
  :init
  (add-hook 'css-mode-hook 'company-mode )
  ;;(add-hook 'jade-mode-hook 'company-mode )
  (add-hook 'slim-mode-hook 'company-mode )
  (add-hook 'web-mode-hook 'company-mode ))

(use-package haml-mode
  :ensure t
  :defer t)

(use-package less-css-mode
  :ensure t
  :defer t
  :mode ("\\.less\\'" . less-css-mode))

(use-package sass-mode
  :ensure t
  :defer t
  :mode ("\\.sass\\'" . sass-mode))

(use-package scss-mode
  :ensure t
  :defer t
  :mode ("\\.scss\\'" . scss-mode))

(use-package slim-mode
  :ensure t
  :defer t)

(with-eval-after-load 'smartparens
  (add-hook 'css-mode-hook 'smartparens-strict-mode)
  (add-hook 'sass-mode-hook 'smartparens-strict-mode)
  (add-hook 'scss-mode-hook 'smartparens-strict-mode)
  (add-hook 'web-mode-hook 'smartparens-strict-mode))

(use-package web-mode
  :ensure t
  :defer t
  :init
  ;;(push '(company-web-html company-css)
  ;;company-backends-web-mode)
  :mode
  (("\\.phtml\\'"      . web-mode)
   ("\\.tpl\\.php\\'"  . web-mode)
   ("\\.twig\\'"       . web-mode)
   ("\\.html\\'"       . web-mode)
   ("\\.htm\\'"        . web-mode)
   ("\\.[gj]sp\\'"     . web-mode)
   ("\\.as[cp]x?\\'"   . web-mode)
   ("\\.eex\\'"        . web-mode)
   ("\\.erb\\'"        . web-mode)
   ("\\.mustache\\'"   . web-mode)
   ("\\.handlebars\\'" . web-mode)
   ("\\.hbs\\'"        . web-mode)
   ("\\.eco\\'"        . web-mode)
   ("\\.ejs\\'"        . web-mode)
   ("\\.djhtml\\'"     . web-mode)))

(provide 'lang:web)
