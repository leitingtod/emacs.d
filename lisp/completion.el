;; completion mechanism - ivy
;; Ivy is a generic completion mechanism for Emacs. While it operates similarly to other completion schemes such as icomplete-mode, Ivy aims to be more efficient, smaller, simpler, and smoother to use yet highly customizable.

;; execute-command completion - consule
;; Counsel takes this further, providing versions of common Emacs commands that are customised to make the best use of ivy.

;; counsel-M-x need smex to do more work
(use-package smex
  :ensure t
  :init
  (setq smex-save-file (concat user-emacs-cache-directory "smex-items")))

(use-package counsel
  :ensure t)

;; search completion - swipe
;; Swiper is an alternative to isearch that uses ivy to show an overview of all matches.

;; swiper need flx to support fuzzy search
(use-package flx
  :ensure t)

;; recentf settings
(setq recentf-save-file (concat user-emacs-cache-directory "recentf")
      recentf-max-saved-items 100
      recentf-auto-cleanup 'never
      recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list))

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
  ;; Ivy-based interface to standard commands
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  ;; this option enable recentf-mode
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-load-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  ;; Ivy-based interface to shell and system tools
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  ;; Ivy-resume and other commands
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

;; edit completion -- company

(provide 'completion)
