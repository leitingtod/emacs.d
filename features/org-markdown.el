(use-package org-plus-contrib
  :ensure t
  :defer t)

(use-package gnuplot
  :ensure t
  :defer t)

(use-package htmlize
  :ensure t
  :defer t)

;; (use-package ob
;;   :defer t
;;   :init
;;   (defun org-babel-do-load-languages ()
;;     (org-babel-do-load-languages 'org-babel-load-languages
;; 				 org-babel-load-language))
;;   (defun ob-fix-inline-images ()
;;     "Fix redisplay of inline images after a code block evaluation."
;;     (when org-inline-image-overlays
;;       (org-redisplay-inline-images)))
;;   (add-hook 'org-mode-hook 'org-babel-do-load-languages)
;;   (add-hook 'org-babel-after-execute-hook 'ob-fix-inline-images))

(use-package org
  :ensure t
  :defer t
  :commands (org-clock-out org-occur-in-agenda-files org-agenda-files orgtbl-mode)
  :init
  (setq org-clock-persist-file (concat user-emacs-cache-directory
				       "org-clock-save.el")
	org-id-locations-file (concat user-emacs-cache-directory
				      "org-id-locations")
	org-publish-timestamp-directory (concat user-emacs-cache-directory "org-timestamps/")
	org-hide-leading-starts t
	org-log-done t
	org-startup-with-inline-images t
	org-image-actual-width nil
	org-src-fontify-natively t
	org-imenu-depth 8
	org-hide-leading-stars t)
  ;;(add-hook 'org-mode-hook 'flyspell-mode)
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  (setq org-default-notes-file "notes.org"))


(use-package org-bullets
  :ensure t
  :defer t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(use-package toc-org
  :ensure t
  :defer t
  :init
  (progn
    (setq toc-org-max-depth 10)
    (add-hook 'org-mode-hook 'toc-org-enable)))

(use-package org-agenda
  :defer t
  :init
  (setq org-agenda-restore-windows-after-quit t))

(use-package org-download
  :ensure t
  :defer t
  :commands (org-download-enable
	     org-download-yank
	     org-download-screenshot)
  :init
  (add-hook 'org-mode-hook 'org-download-enable))

(use-package org-mime
  :defer t
  :commands (org-mime-htmlize org-mime-org-buffer-htmlize))

(use-package org-pomodoro
  :ensure t
  :defer t)

(use-package org-present
  :ensure t
  :defer t
  :init
  (defun org-present-start ()
    (org-present-big)
    (org-display-inline-images)
    (org-present-hide-cursor)
    (org-present-read-only))
  (defun org-present-end ()
    (org-present-small)
    (org-remove-inline-images)
    (org-present-show-cursor)
    (org-present-read-write))
  (add-hook 'org-present-mode-hook 'org-present-start)
  (add-hook 'org-present-mode-quit-hook 'org-present-end))

(use-package org-repo-todo
  :ensure t
  :commands (ort/todo-root ort/find-root ort/todo-file)
  :config
  ;;Better default capture template
  (setcdr (cdddr (assoc "ort/todo" org-capture-templates))
  	  '("* TODO %?\n%U\n\n%i" :empty-lines 1)))

(add-hook 'use-package--org--post-config-hook (require 'ox-gfm))
;; ;;(add-hook 'use-package--org--post-config-hook (require 'ox-reveal))

;;===============================================================
;; Markdown
;;===============================================================
(defvar markdown-live-preview-engine 'eww
  "Possibe values are `eww' (built-in browser) or `vmd' (installed with `npm').")

(use-package markdown-mode
  :mode ("\\.m[k]d" . markdown-mode)
  :defer t
  :init
  (add-hook 'markdown-mode-hook 'smartparens-mode))

(use-package markdown-toc
  :defer t)

(use-package mmm-mode
  :commands mmm-parse-buffer
  :config
  (progn
    (mmm-add-classes '((markdown-python
			:submode python-mode
			:face mmm-declaration-submode-face
			:front "^```python[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-html
			:submode web-mode
			:face mmm-declaration-submode-face
			:front "^```html[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-java
			:submode java-mode
			:face mmm-declaration-submode-face
			:front "^```java[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-ruby
			:submode ruby-mode
			:face mmm-declaration-submode-face
			:front "^```ruby[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-c
			:submode c-mode
			:face mmm-declaration-submode-face
			:front "^```c[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-c++
			:submode c++-mode
			:face mmm-declaration-submode-face
			:front "^```c\+\+[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-elisp
			:submode emacs-lisp-mode
			:face mmm-declaration-submode-face
			:front "^```elisp[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-javascript
			:submode javascript-mode
			:face mmm-declaration-submode-face
			:front "^```javascript[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-ess
			:submode R-mode
			:face mmm-declaration-submode-face
			:front "^```{?r.*}?[\n\r]+"
			:back "^```$")))
    (mmm-add-classes '((markdown-rust
			:submode rust-mode
			:face mmm-declaration-submode-face
			:front "^```rust[\n\r]+"
			:back "^```$")))
    (setq mmm-global-mode t)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-python)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-java)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-ruby)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-c)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-c++)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-elisp)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-html)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-javascript)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-ess)
    (mmm-add-mode-ext-class 'markdown-mode nil 'markdown-rust)))

;; (use-package vmd-mode
;;   :if (eq markdown-live-preview-engine 'vmd)
;;   :defer t
;;   :init
;;   (progn
;;     (add-hook 'markdown-mode-hook 'vmd-mode)
;;     (defun vmd-company-backend (command &optional arg &rest ignored)
;;       (interactive (list 'interactive))
;;       (cl-case command
;; 	(interactive (company-begin-backend 'company-sample-backend))
;; 	(prefix (and (eq major-mode 'fundamental-mode)
;; 		     (company-grab-symbol)))
;; 	(candidates
;; 	 (cl-remove-if-not
;; 	  (lambda (c) (string-prefix-p arg c))
;; 	  vmd-mode/github-emojis-list))))
;;     (add-to-list 'company-backends 'vmd-company-backend)))

;;===============================================================
;; emoji support
;;===============================================================
(use-package emoji-cheat-sheet-plus
  :ensure t
  :defer t
  :init
  (add-hook 'org-mode-hook 'emoji-cheat-sheet-plus-display-mode)
  (add-hook 'markdown-mode-hook 'emoji-cheat-sheet-plus-display-mode))

(use-package company-emoji
  :ensure t
  :init
  (add-hook 'org-mode-hook 'company-mode t)
  (add-hook 'markdown-mode-hook 'company-mode t))
 
(provide 'org-markdown)
