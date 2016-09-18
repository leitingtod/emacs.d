(setq-default indent-tabs-mode nil
              tab-width 4)
(setq longlines-show-hard-newlines t)
(setq delete-by-moving-to-trash t)
(setq-default fill-column 80)
(diminish auto-fill-function " Ⓕ")
(setq-default sentence-end-double-space nil)
(show-paren-mode 1)

;; The C-d rebinding that most shell-like buffers inherit from
;; comint-mode assumes non-evil configuration with its
;; `comint-delchar-or-maybe-eof' function, so we disable it
(with-eval-after-load 'comint
  (define-key comint-mode-map (kbd "C-d") nil))

;; don't create backup~ files
(setq make-backup-files nil)

;; Mouse cursor in terminal mode
(xterm-mouse-mode 1)

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
;;(add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")

(require 'uniquify)
;; When having windows with repeated filenames, uniquify them
;; by the folder they are in rather those annoying <2>,<3>,.. etc
(setq uniquify-buffer-name-style 'post-forward-angle-brackets
      ;; don't screw special buffers
      uniquify-ignore-buffers-re "^\\*")

;;; bookmark
(setq bookmark-default-file
      (concat user-emacs-cache-directory "bookmarks")
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
 initial-scratch-message "(hi, i love emacs)"
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
;;       'blink-paren-post-self-insert-function)

(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "C-c m") 'set-mark-command)
(global-set-key (kbd "C-x C-q") 'view-mode)

(use-package view-mode
  :defer t
  :init
  (setq view-mode-map (make-sparse-keymap))
  (let ((map view-mode-map))
    ;; redefine keymap
    (define-key map "q" 'View-exit-and-edit)
    (define-key map "Q" 'View-quit)
    (define-key map "m" 'point-to-register)
    (define-key map "'" 'register-to-point)
    (define-key map "x" 'exchange-point-and-mark)
    (define-key map "@" 'View-back-to-mark)
    (define-key map "." 'set-mark-command)
    (define-key map "%" 'View-goto-percent)
    (define-key map "g" 'View-goto-line)

    ;; (define-key map "F" 'View-revert-buffer-scroll-page-forward)

    (define-key map "k" 'previous-line)
    (define-key map "j" 'next-line)
    (define-key map "l" 'recenter-top-bottom)

    (define-key map "p" 'View-scroll-page-backward)
    (define-key map " " 'View-scroll-page-forward)

    (define-key map ">" 'end-of-buffer)
    (define-key map "<" 'beginning-of-buffer)

    (define-key map "-" 'negative-argument)
    (define-key map "9" 'digit-argument)
    (define-key map "8" 'digit-argument)
    (define-key map "7" 'digit-argument)
    (define-key map "6" 'digit-argument)
    (define-key map "5" 'digit-argument)
    (define-key map "4" 'digit-argument)
    (define-key map "3" 'digit-argument)
    (define-key map "2" 'digit-argument)
    (define-key map "1" 'digit-argument)
    (define-key map "0" 'digit-argument)
    (define-key map "?" 'describe-mode)))
;;(add-hook 'find-file-hook 'view-mode)

(use-package dired
  :config
  (define-key dired-mode-map (kbd "o") 'dired-display-file)
  (define-key dired-mode-map (kbd "C-o") 'dired-find-file-other-window))

(use-package dired-x
  :commands (dired-jump
             dired-jump-other-window
             dired-omit-mode))

(provide 'defaults)
