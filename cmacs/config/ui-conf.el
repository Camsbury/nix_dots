(require 'smartparens-config)

(if (string-equal system-type "gnu/linux")
    (require 'doom-modeline))
(column-number-mode)
(show-paren-mode)
;; (electric-pair-mode)
(smartparens-global-mode)
(global-linum-mode)
(global-auto-revert-mode)
(global-hl-line-mode)
(doom-modeline-init)

(sp-pair "*" nil :actions :rem)

(setq hl-todo-keyword-faces
      `(("TODO"  . ,(face-foreground 'warning))
        ("FIXME" . ,(face-foreground 'error))
        ("NOTE"  . ,(face-foreground 'success)))
      find-function-C-source-dir "<some-dir>/emacs/src"
      whitespace-line-column 80
      whitespace-style '(face trailing lines-tail))

(general-add-hook 'prog-mode-hook
  (list 'hl-todo-mode
        'whitespace-mode
        'rainbow-delimiters-mode
        'rainbow-mode
        'evil-smartparens-mode))

(provide 'ui-conf)
