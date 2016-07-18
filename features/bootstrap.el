(use-package counsel
  :ensure t)

(use-package flx
  :ensure t)

(use-package swiper
  :ensure t
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 10)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-re-builders-alist
	;; need flx to handle large list
	;;'((read-file-name-internal . ivy--regex-fuzzy)
	'((t . ivy--regex-fuzzy)))
  :config
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-load-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox))

(use-package smex
  :ensure t
  :init
  (setq smex-save-file (concat user-emacs-cache-directory "smex-items")))

;; (use-package magit
;;   :ensure t
;;   :init
;;   (setq magit-completing-read-function 'ivy-completing-read)
;;   :config
;;   (global-set-key (kbd "C-x g") 'magit-status))

;; (use-package projectile
;;   :ensure t
;;   :init
;;   (setq projectile-completion-system 'ivy))

(use-package hydra
  :ensure t
  :config
  (progn
    (defhydra hydra-zoom ()
      "zoom"
      ("j" text-scale-increase "in")
      ("k" text-scale-decrease "out")
      ("r" (text-scale-set 0) "reset")
      ("q" nil "quit"))
    (global-set-key (kbd "C-c -") 'hydra-zoom/body)

    (defhydra hydra-vi (:pre (set-cursor-color "#e52b50")
			     :post (set-cursor-color "#ffffff")
			     :color pink)
      "vi"
      ;; movement
      ("f" forward-word)
      ("b" backward-word)
      ;; scrolling
      ("C-v" scroll-up-command nil)
      ("M-v" scroll-down-command nil)
      ("n" (scroll-down `-))
      ("p" (scroll-up `-))
      ("v" recenter-top-bottom)
      ;; arrows
      ("h" backward-char)
      ("j" next-line)
      ("k" previous-line)
      ("l" forward-char)
      ;; delete
      ("x" delete-char)
      ;;("d" hydra-vi-del/body "del" :exit t)
      ("u" undo)
      ;; should be generic "open"
      ("r" push-button "open")
      ("." hydra-repeat)
      ;; bad
      ("m" set-mark-command "mark")
      ("a" move-beginning-of-line "beg")
      ("e" move-end-of-line "end")
      ("y" kill-ring-save "yank" :exit t)
      ;; exit points
      ("q" nil "ins")
      ("C-n" (forward-line 1) nil :exit t)
      ("C-p" (forward-line -1) nil :exit t))
    (global-set-key (kbd "C-c v") 'hydra-vi/body)))

(use-package ivy-hydra
  :ensure t)


(provide 'bootstrap)
