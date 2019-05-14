{ pkgs }:

with pkgs; [
  _1password
  ack
  ag
  audacity
  autojump
  # autorandr # maybe for displays?
  bat
  bear
  binutils
  cabal-install
  cabal2nix
  cargo
  carnix
  chromium
  curl
  dmenu
  docker
  docker_compose
  dropbox-cli
  emacs
  exa
  fd
  feh # wallpapers
  firefox
  fzf
  gdb
  gimp
  git
  gitAndTools.hub
  glibc
  gnumake
  gnupg
  gnutls
  haskellPackages.Agda
  haskellPackages.Cabal_2_4_1_0
  haskellPackages.apply-refact
  haskellPackages.ghcid
  haskellPackages.hlint
  htop
  httpie
  irony-server
  jq
  keychain
  libnotify
  man-pages
  nix-index
  notify-osd # to upgrade...
  oh-my-zsh
  openssh
  openssl
  peek
  pltScheme
  python36
  python36Packages.jedi
  python36Packages.jupyter_client
  python36Packages.jupyter_core
  python36Packages.pyls-isort
  python36Packages.pyls-mypy
  python36Packages.python-language-server
  python36Packages.yapf
  redshift
  ripgrep
  shellcheck
  slack
  sloccount
  slock
  sourceHighlight
  spotify # non-free
  sqlite
  stack2nix
  teensy-loader-cli # flash ergodox firmware (use zshrc alias for help)
  tldr
  tmux
  tree
  udisks # manage drives
  unzip
  valgrind
  veracrypt
  vim
  vlc
  wget
  xclip # copy paste stuff
  xorg.xbacklight
  xorg.xmodmap
  xss-lock
  zip
  zsh
]