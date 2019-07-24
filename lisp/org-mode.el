(use-package org
  :ensure t
  :defer t
  :commands (org-clock-out org-occur-in-agenda-files org-agenda-files orgtbl-mode)
  :init
  (setq org-clock-persist-file (concat user-emacs-cache-directory "org-clock-save.el")
	org-id-locations-file (concat user-emacs-cache-directory "org-id-locations")
	org-publish-timestamp-directory (concat user-emacs-cache-directory "org-timestamps/")
	org-hide-leading-starts t
	org-log-done nil
	org-startup-with-inline-images t
	org-image-actual-width nil
	org-src-fontify-natively t
	org-imenu-depth 8
	org-hide-leading-stars t
	;;org-default-notes-file "notes.org"
	;;org-agenda-files (list "~/program/notes/work/gtd.org")
	org-archive-location (concat user-emacs-cache-directory "archive/gtd.org_archive::")
	org-todo-keywords
	'((sequence "TODO(t)" "WAITING(a)" "WORKING(w)" "PLANNING(p)" "TRACKING(r)" "|" "DONE(d)"
		    "CANCELD(c)" "FIXED(f)" "DELAY(d)" "IMPROVE(i)")))
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
  :init
  (add-hook 'org-mode-hook (lambda ()(org-bullets-mode 1))))

(use-package cnfonts
  :ensure t
  :defer t
  :init
  (cnfonts-enable))

;; (use-package org-pomodoro
;;   :ensure t
;;   :defer t)

(provide 'org-mode)
