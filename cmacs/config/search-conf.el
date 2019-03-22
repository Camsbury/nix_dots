(require 'wgrep)
(require 'avy)

(defun wgrep-save-and-quit ()
  "things"
  (interactive)
  (wgrep-finish-edit)
  (wgrep-save-all-buffers)
  (quit-window))

(setq counsel-rg-base-command
      "rg -S -g !.git -g !node_modules -g !yarn -g !lock --no-heading --line-number --hidden --color never %s .")
(general-define-key :keymaps 'wgrep-mode-map
  [remap evil-save-modified-and-close] #'wgrep-save-and-quit)

(provide 'search-conf)
