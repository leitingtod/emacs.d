(setq-default fill-column 80
	      make-backup-files nil              
	      ;; sentence-end-double-space nil
	      tab-width 4)

(setq auto-save-default t
      auto-save-list-file-prefix (concat user-emacs-cache-directory "auto-save/")
      auto-revert-verbose nil
      ;; ad-redefinition-action 'accept
      
      bookmark-default-file (concat user-emacs-cache-directory "bookmarks")
      bookmark-save-flag 1
      ;; byte-compile--use-old-handlers nil
      
      ;; compilation-scroll-output 'first-error
      ;; cache-long-scans t

      default-buffer-file-coding-system 'utf-8
      delete-by-moving-to-trash t
      display-time-24hr-format t
      display-time-default-load-average nil
      display-time-format ""

      enable-recursive-minibuffers t
      ;; eval-expression-print-length nil
      ;; eval-expression-print-level nil

      find-file-suppress-same-file-warnings t
      
      ;; global-auto-revert-non-file-buffers t

      highlight-nonselected-windows t
      
      indent-tabs-mode nil
      inhibit-startup-screen t
      ;;initial-scratch-message "(hi, i love emacs)"

      kill-buffer-query-funtions nil

      ;; longlines-show-hard-newlines t

      minibuffer-message-timeout 1
      minibuffer-depth-indicate-mode 1

      prefer-coding-system 'utf-8
      ;; remove annoying ellipsis when printing sexp in message buffer
      ;; print-gensym nil
      ;; print-circle nil
	  
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      recentf-save-file (concat user-emacs-cache-directory "recentf")
      recentf-max-saved-items 50
      recentf-auto-cleanup 'never
      ;; recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list)
      ;;read-quoted-char-radix 16
      ring-bell-function 'ignore

      ;;text-quoting-style 'grave      
      truncate-lines t)
	  

;; (add-to-list 'recentf-exclude (expand-file-name user-emacs-cache-directory))
;; (add-to-list 'recentf-exclude (expand-file-name package-user-dir))
;; (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")

(fset 'yes-or-no-p 'y-or-n-p)
;;(tool-bar-mode -1))
;; (menu-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(global-auto-revert-mode 1)

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'emacs-startup-hook
          (lambda () (unless recentf-mode
                       (recentf-mode)
                       (recentf-track-opened-file))))

(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "C-c m") 'set-mark-command)
(global-set-key (kbd "C-x C-q") 'view-mode)

(provide 'init-defaults)
