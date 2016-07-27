;;============================================================
;; Spell Checker
;;============================================================
(use-package auto-dictionary
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'flyspell-mode-hook 'auto-dictionary-mode)))

(use-package flyspell
  :ensure t
  :defer t
  :init
  (add-hook 'text-mode-hook 'flyspell-mode-hook)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  :config
  (diminish flyspell-mode " Ⓢ"))

(use-package flyspell-correct
  :ensure t
  :defer t
  :commands (flyspell-correct-word-generic
	     flyspell-correct-previous-word-generic))

(use-package flyspell-correct-ivy
  :ensure t)

(use-package flyspell-correct-popup
  :ensure t)

(use-package flyspell-popup
  :ensure t
  :defer t
  :init
  (setq flyspell-popup-correct-delay 0.8)
  (add-hook 'flyspell-mode-hook 'flyspell-popup-auto-correct-mode))

;;============================================================
;; Syntax Checker
;;============================================================
(use-package flycheck
  :ensure t
  :defer t
  :init
  (setq flycheck-standard-error-navigation nil
	flycheck-global-modes nil)
  ;;(add-hook 'prog-mode-hook 'flyspell-prog-mode)
  ;; Custom fringe indicator
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'my-flycheck-fringe-indicator
      (vector #b00000000
	      #b00000000
	      #b00000000
	      #b00000000
	      #b00000000
	      #b00000000
	      #b00000000
	      #b00011100
	      #b00111110
	      #b00111110
	      #b00111110
	      #b00011100
	      #b00000000
	      #b00000000
	      #b00000000
	      #b00000000
	      #b00000000)))
  ;; (flycheck-define-error-level
  ;;  'error
  ;;  :severity 2
  ;;  :overlay-category 'flycheck-error-overlay
  ;;  :fringe-bitmap 'my-flycheck-fringe-indicator
  ;;  :fringe-face 'flycheck-fringe-error)

  ;; (flycheck-define-error-level
  ;;  'warning
  ;;  :severity 1
  ;;  :overlay-category 'flycheck-warning-overlay
  ;;  :fringe-bitmap 'my-flycheck-fringe-indicator
  ;;  :fringe-face 'flycheck-fringe-warning)

  ;; (flycheck-define-error-level
  ;;  'info
  ;;  :severity 0
  ;;  :overlay-category 'flycheck-info-overlay
  ;;  :fringe-bitmap 'my-flycheck-fringe-indicator
  ;;  :fringe-face 'flycheck-fringe-info)
  :config
  (global-flycheck-mode 1)
  (diminish flycheck-mode " ⓢ"))

(use-package flycheck-pos-tip
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode)))

;; (push '("^\\*Flycheck.+\\*$"
;; 	:regexp t
;; 	:dedicated t
;; 	:position bottom
;; 	:stick t
;; 	:noselect t)
;;       popwin:special-display-config)

(provide 'checker)
