{ pkgs, ... }:

{ environment.systemPackages = with pkgs; [ 
  ## Text Editors ##
  alacritty vscode
  
  ## Github ##
  mr gitAndTools.gitFull jq

  ## Basic Hacker Stuff ##
  discord tdesktop
  freecad kicad
  gparted nfs-utils sshfs mtr sysstat
  wget coreutils binutils curl
  zip unzip killall syncthing-cli
  asciidoctor appimage-run bind cpulimit file fzf iperf jpegoptim libwebp lm_sensors
  lsof man mtr nmap ntfs3g openssl pciutils pdftk pandoc pwgen rclone rsync traceroute
  tree unetbootin unrar unzip usbutils 
  vim emacs 
  which yamllint
  sudo iptables nmap tcpdump rxvt_unicode 
  filelight gparted libreoffice-fresh p7zip remmina zim
  byobu ncurses oh-my-zsh screen sshpass tmux zsh
  #added to enable cardano node tools: 
  gmpxx openssl.dev libffi systemd zlib procps sqlite
  
  ##For Cardano Guild apps on Debian: build-essential pkg-config libffi-dev libgmp-dev libssl-dev libtinfo-dev libsystemd-dev zlib1g-dev tmux
  ## for CentOS pkgconfig libffi-devel gmp-devel openssl-devel ncurses-libs ncurses-compat-libs systemd-devel zlib-devel tmux procps-ng  

  ## Nix Package for nix-shell etc ##
  binutils 
  cabal2nix
  nix
  docker
  stack 
  #cabal
  ghc

  gnome3.gnome-tweaks
  ];
}
