(use-package org
  :ensure t
  :defer t
  :commands (org-clock-out org-occur-in-agenda-files org-agenda-files orgtbl-mode)
  :init
  (setq org-clock-persist-file (concat user-emacs-cache-directory "org-clock-save.el")
		org-id-locations-file (concat user-emacs-cache-directory "org-id-locations")
		org-publish-timestamp-directory (concat user-emacs-cache-directory "org-timestamps/")
		org-hide-leading-starts t
		org-log-done t
		org-log-done nil
		org-startup-with-inline-images t
		org-image-actual-width nil
		org-src-fontify-natively t
		org-imenu-depth 8
		org-hide-leading-stars t
		org-default-notes-file "notes.org"
		org-agenda-files (list "~/program/notes/work/gtd.org")
		org-archive-location (concat user-emacs-cache-directory "archive/gtd.org_archive::")
		org-todo-keywords
		'((sequence "TODO(t)" "WAITING(a)" "WORKING(w)" "PLANNING(p)" "TRACKING(r)" "|" "DONE(d)"
					"CANCELD(c)" "FIXED(f)" "DELAY(d)" "IMPROVE(i)" )))
  ;;(add-hook 'org-mode-hook 'flyspell-mode)
  :config
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture))

(use-package org-plus-contrib
  :ensure t
  :defer t)

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

;; (use-package org-agenda
;;   :defer t
;;   :init
;;   (setq org-agenda-restore-windows-after-quit t))

(use-package org-download
  :ensure t
  :defer t
  :commands (org-download-enable
			 org-download-yank
			 org-download-screenshot)
  :init
  (add-hook 'org-mode-hook 'org-download-enable))

;; (use-package org-mime
;;   :defer t
;;   :commands (org-mime-htmlize org-mime-org-buffer-htmlize))

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

(provide 'init-org)
