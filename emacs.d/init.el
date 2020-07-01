;; initialize installed packages for configuration
(setq package-load-list '((bind-key t)
                          (use-package t)))
(package-initialize)
(require 'use-package)
(use-package keychain-environment)

(setq load-path
      (cons "~/.emacs.d/config" load-path))
(when (memq window-system '(x))
  (keychain-refresh-environment))

(setq initial-buffer-choice t)
(setq auto-window-vscroll nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(require 'benchmark-init)
(when (load "private-init.el")
 (require 'private-init))
(add-hook 'after-init-hook
          (lambda () (require 'config))
          'benchmark-init/deactivate)
(put 'narrow-to-region 'disabled nil)
