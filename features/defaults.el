;;; linum mode
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)
(setq linum-format "%4d")

;;; recentf mode
(add-hook 'find-file-hook
	  (lambda () (unless recentf-mode
		       (recentf-mode)
		       (recentf-track-opened-file))))
(setq recentf-save-file (concat user-emacs-cache-directory "recentf")
      recentf-max-saved-items 1000
      recentf-auto-cleanup 'never
      recentf-auto-save-timer (run-with-idle-timer 600 t
						   'recentf-save-list))
;; (add-to-list 'recentf-exclude (expand-file-name user-emacs-cache-directory))
;; (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
;; (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")

(require 'uniquify)
;; When having windows with repeated filenames, uniquify them
;; by the folder they are in rather those annoying <2>,<3>,.. etc
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      ;; don't screw special buffers
      uniquify-ignore-buffers-re "^\\*")

;;; bookmark
(setq bookmark-default-file (concat user-emacs-cache-directory "bookmarks")
      ;; autosave each change
      bookmark-save-flag 1)

;; Auto refresh
(global-auto-revert-mode 1)
;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; Scroll compilation to first error or end
(setq compilation-scroll-output 'first-error)

;; Auto-save file
(setq auto-save-default t)
(setq auto-save-list-file-prefix (concat user-emacs-cache-directory "auto-save/"))
;; always save TRAMP URLs to cache directory no matter what is the value
;; of `dotspacemacs-auto-save-file-location'
(let ((autosave-dir (concat user-emacs-cache-directory "tramp/")))
  (setq auto-save-file-name-transforms
        `(("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" ,autosave-dir  t)))
  (unless (file-exists-p autosave-dir)
    (make-directory autosave-dir t)))

(let ((autosave-dir (concat user-emacs-cache-directory "site/")))
  (add-to-list 'auto-save-file-name-transforms
	       `(".*" ,autosave-dir t) 'append)
  (unless (file-exists-p autosave-dir)
    (make-directory autosave-dir t)))

;; remove annoying ellipsis when printing sexp in message buffer
(setq eval-expression-print-length nil
      eval-expression-print-level nil)

;; cache files
(setq tramp-persistency-file-name (concat user-emacs-cache-directory "tramp"))

(setq
 inhibit-startup-screen t
 initial-scratch-message ""
 ;;text-quoting-style 'grave
 ;;finding files
 prefer-coding-system 'utf-8
 default-buffer-file-coding-system 'utf-8
 vc-follow-symlinks t
 ;;find-file-suppress-same-file-warnings t
 ;;read-file-name-completion-ignore-case t
 ;;read-buffer-completion-ignore-case t
 ;; minibuffer interaction
 enable-recursive-minibuffers t
 minibuffer-message-timeout 1
 minibuffer-depth-indicate-mode 1
 ;;read-quoted-char-radix 16
 ;; editor behavior
 indent-tabs-mode nil
 truncate-lines t
 ring-bell-function 'ignore
 highlight-nonselected-windows t
 kill-buffer-query-funtions nil
 ;;eval-expression-print-length nil
 ;;eval-expression-print-level nil
 ;;print-gensym nil
 ;;print-circle nil
 byte-compile--use-old-handlers nil
 ;; internals
 gc-cons-threshold (* 10 1024 1024)
 ad-redefinition-action 'accept
 ;; isn't needed in 24.5
 cache-long-scans t
 ;; time display
 display-time-24hr-format t
 display-time-default-load-average nil
 display-time-format ""
 )

;;(add-hook 'server-switch-hook 'raise-frame)
;;(remove-hook 'post-self-insert-hook
;;	     'blink-paren-post-self-insert-function)

(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-set-key (kbd "C-`") 'set-mark-command)

(provide 'defaults)
