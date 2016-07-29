(use-package magit
  :ensure t
  :commands (magit-blame-mode
	     magit-cherry-pick-popup
	     magit-commit-popup
	     magit-diff-popup
	     magit-fetch-popup
	     magit-log-popup
	     magit-pull-popup
	     magit-push-popup
	     magit-rebase-popup
	     magit-status
	     magit-submodule-popup)
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  (add-hook 'git-commit-mode-hook 'fci-mode)
  :config
  (require 'git-rebase)
  (global-set-key (kbd "C-x g") 'magit-status))

(provide 'git)
