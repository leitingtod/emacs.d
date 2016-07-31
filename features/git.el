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
  (setq magit-refresh-status-buffer nil)
  (setq vc-handled-backends (delq 'Git vc-handled-backends))
  (setq magit-completing-read-function 'ivy-completing-read)
  (global-set-key (kbd "C-x g") 'magit-status)
  ;;(add-hook 'git-commit-mode-hook 'fci-mode)
  :config
  (require 'git-rebase))

(provide 'git)
