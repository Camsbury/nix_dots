(let ((mu-path (getenv "MU_PATH")))
  (when mu-path
    (add-to-list 'load-path
                 (concat (getenv "MU_PATH") "/share/emacs/site-lisp/mu4e"))
    (use-package mu4e)
    (use-package evil-mu4e)))

(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "Personal"
           :match-func
           (lambda (msg)
             (when msg
               (string-prefix-p "/personal" (mu4e-message-field msg :maildir))))
           :vars '((mu4e-sent-folder . "/personal/sent")
                   (mu4e-drafts-folder . "/personal/drafts")
                   (mu4e-trash-folder . "/personal/trash")))))

(setq shr-color-visible-luminance-min 80)

(provide 'services/email-conf)
