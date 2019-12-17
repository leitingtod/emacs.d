(use-package org
  :ensure t
  :defer t
  :commands (org-clock-out org-occur-in-agenda-files org-agenda-files orgtbl-mode)
  :init
  (progn
    (setq org-clock-persist-file (concat user-emacs-cache-directory "org-clock-save.el")
	  org-id-locations-file (concat user-emacs-cache-directory "org-id-locations")
	  org-publish-timestamp-directory (concat user-emacs-cache-directory "org-timestamps/")
	  org-hide-leading-stars t
	  org-log-done nil
	  org-startup-with-inline-images t
	  org-image-actual-width nil
	  org-src-fontify-natively t
	  org-imenu-depth 8
	  ;;org-default-notes-file "notes.org"
	  ;;org-agenda-files (list "~/program/notes/work/gtd.org")
	  org-archive-location (concat user-emacs-cache-directory "archive/gtd.org_archive::")
	  org-todo-keywords
	  '((sequence "Scheduled(s)" "TODO(t)" "Working(w)"  "|" "DONE(d)" "CANCELD(c)" ))
	  org-file-apps
	  '((auto-mode . emacs)
	    ("\\.docx\\'" . default)
	    ("\\.xlsx\\'" . default)
	    ("\\.pptx\\'" . default)
	    ("\\.doc\\'" . default)
	    ("\\.xls\\'" . default)
	    ("\\.ppt\\'" . default)
	    ("\\.x?html?\\'" . default)
	    ("\\.png\\'" . default)
	    ("\\.jpg\\'" . default)
	    ("\\.jpeg\\'" . default)
	    ("\\.gif\\'" . default)
	    ("\\.pdf\\'" . default))))
  :config
  (progn
    (define-key global-map "\C-cl" 'org-store-link)
    (define-key global-map "\C-ca" 'org-agenda)
    (define-key global-map "\C-cc" 'org-capture)))

(use-package org-plus-contrib
  :ensure t
  :defer t)

(use-package org-bullets
  :ensure t
  :defer t
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode 1))

(use-package cnfonts
  :ensure t
  :defer t
  :init
  (cnfonts-enable))

(use-package org-pomodoro
  :ensure t
  :defer t)

(provide 'org-mode)
