(defun term-send-ssh-connection ()
  (interactive)
  (term-send-raw-string "ssh anyuan@192.168.0."))

(defun term-send-ssh-passwd ()
  (interactive)
  (term-send-raw-string "aykj83752661\n"))

;; 在multi-term打开的ssh连接中，使用vi等编辑器非常地难用
;; 好像没什么好的解决办法
(use-package multi-term
  :ensure
  :defer t
  :init
  (setq multi-term-program "/bin/bash"
		multi-term-dedicated-close-back-to-open-buffer-p t)
  :config
  (add-hook 'term-mode-hook
			(lambda () (setq term-buffer-maximum-size 0)))
  (add-hook 'term-mode-hook
			(lambda () (define-key term-raw-map (kbd "C-y") 'term-paste)))
  (add-hook 'term-mode-hook
			(lambda () (define-key term-raw-map (kbd "C-c h") 'term-send-ssh-connection)))
  (add-hook 'term-mode-hook
			(lambda () (define-key term-raw-map (kbd "C-c p") 'term-send-ssh-passwd))))

;;smartparens
;;flycheck
;;hydra
;;unicad
;;yasnippet
;;magit
;;cnfonts
;;multi-cursors
;;smartparens
;;winner-mode
;;percol

(use-package eyebrowse
  :ensure t
  :defer t
;;  :diminish eyebrowse-mode
  :config
  (progn
	(setq eyebrowse-new-workspace t)
	(define-key eyebrowse-mode-map (kbd "M-1") 'eyebrowse-switch-to-window-config-1)
	(define-key eyebrowse-mode-map (kbd "M-2") 'eyebrowse-switch-to-window-config-2)
	(define-key eyebrowse-mode-map (kbd "M-3") 'eyebrowse-switch-to-window-config-3)
	(define-key eyebrowse-mode-map (kbd "M-4") 'eyebrowse-switch-to-window-config-4)))
(eyebrowse-mode t)

(provide 'init-additions)
