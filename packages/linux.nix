{ pkgs }:

( with pkgs; if pkgs.stdenv.hostPlatform.system == "x86_64-linux" then [
    _1password
    ack
    anki
    audacity
    autojump
    # autorandr # maybe for displays?
    binutils
    brave
    chromium
    curl
    dmenu
    docker
    docker_compose
    dropbox-cli
    fd
    feh # wallpapers
    firefox
    fzf
    gdb
    ghostscript # for viewing pdfs
    gimp
    git
    glibc
    gnumake
    gnupg
    gnutls
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
    redshift
    rural
    signal-desktop
    slack
    sloccount
    slock
    spotify # non-free
    # stack2nix
    teensy-loader-cli # flash ergodox firmware (use zshrc alias for help)
    tmux
    transmission
    typora
    udisks # manage drives
    unzip
    veracrypt
    vim
    vlc
    xclip # copy paste stuff
    xkb-switch
    xorg.xbacklight
    xorg.xmodmap
    xpdf
    xss-lock
    zip
    zsh
  ] else [])
