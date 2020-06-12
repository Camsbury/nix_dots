epkgs:

let
  melpas = with epkgs.melpaPackages; [
    alda-mode
    all-the-icons-ivy-rich
    avy
    benchmark-init
    buffer-move
    cargo
    cider
    circe
    clj-refactor
    command-log-mode
    company
    company-cabal
    company-c-headers
    company-ghc
    company-go
    company-jedi
    company-lsp
    counsel
    counsel-projectile
    dante
    dash
    dash-functional
    datomic-snippets
    define-word
    direnv
    docker
    dockerfile-mode
    doom-themes
    doom-modeline
    dotenv-mode
    dumb-jump
    ein
    elixir-mode # elixir
    emacsql
    emacsql-sqlite
    emacsql-psql
    ess
    evil
    evil-commentary
    evil-magit
    evil-multiedit
    evil-surround
    evil-visualstar
    exec-path-from-shell
    f
    flycheck
    flycheck-haskell
    flycheck-popup-tip
    flycheck-clj-kondo
    flycheck-credo # elixir
    flycheck-dialyxir # elixir
    flycheck-elixir # elixir
    flycheck-mix # elixir
    flycheck-rust
    forge
    general
    git-timemachine
    gnuplot
    gnuplot-mode
    go-mode
    helm-dash
    hl-todo
    hlint-refactor
    hydra
    ivy
    ivy-hydra
    ivy-xref
    js2-mode
    json-navigator
    keychain-environment
    know-your-http-well
    lispyville
    lsp-haskell
    lsp-mode
    lsp-ui
    magit
    markdown-preview-eww
    markdown-preview-mode
    mediawiki
    nav-flash
    nix-mode
    nix-update
    nov
    ob-async
    ob-elixir
    ob-http
    ob-ipython
    org-bullets
    paredit
    paxedit
    prettier-js
    projectile
    projectile-direnv
    pylint
    py-isort
    racer
    racket-mode
    rainbow-delimiters
    rainbow-identifiers
    ranger
    reformatter # astyle dep
    restart-emacs
    rjsx-mode
    rust-mode
    s
    slack
    slime
    smex
    sqlup-mode
    tree-mode
    use-package
    uuid
    visual-fill-column
    web
    wgrep
    which-key
    yaml-mode
    yapfify # python-lsp
    yasnippet
  ];
  elpas = with epkgs.elpaPackages; [
    rainbow-mode
    undo-tree
  ];
  others = with epkgs; [
    agda2-mode
    astyle
    company-postgresql
    etymology-of-word
    ivy-cider
  ];
in
  melpas ++ elpas ++ others
