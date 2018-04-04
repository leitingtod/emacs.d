(defun term-send-ssh-connection ()
  (interactive)
  (term-send-raw-string "ssh anyuan@192.168.0."))

(defun term-send-ssh-passwd ()
  (interactive)
  (term-send-raw-string "aykj83752661\n"))

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


(provide 'init-additions)
