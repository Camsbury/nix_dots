(use-package circe
  :init
  (setq circe-sasl-username (getenv "SASL_USERNAME"))
  (setq circe-sasl-password (getenv "SASL_PASSWORD"))
  (setq irc-debug-log t)
  (setq circe-network-options
        `(("Freenode"
           :tls t
           :port 6697
           :nick "camsbury"
           :sasl-username ,circe-sasl-username
           :sasl-password ,circe-sasl-password
           :channels (
                      ;; "#bash"
                      ;; "##c"
                      ;; "#docker"
                      ;; "#emacs"
                      ;; "#emacs-circe"
                      ;; "#git"
                      ;; "#hardware"
                      ;; "#haskell"
                      ;; "#javascript"
                      ;; "##math"
                      ;; "##networking"
                      "#nixos"
                      ;; "#postgresql"
                      ;; "#python"
                      ;; "##security"
                      "##tvl")))))
(use-package circe-notifications
  :after (circe)
  :config
  (autoload 'enable-circe-notifications "circe-notifications" nil t)
  (eval-after-load "circe-notifications"
    '(setq circe-notifications-watch-strings '()))
  (add-hook 'circe-server-connected-hook 'enable-circe-notifications))

(provide 'services/irc)
