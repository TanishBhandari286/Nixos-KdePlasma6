# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.tanish.shell = "/run/current-system/sw/bin/zsh";
  programs.zsh.enable = true;

  services.tailscale.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  users.users.nixos = {
  isNormalUser = true;
  extraGroups = [ "docker" ];
  };


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip ];
  };

  # Enable sound with pipewire.
  hardware.bluetooth.enable = true;

  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tanish = {
    isNormalUser = true;
    description = "tanish";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "tanish";
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	neovim
	caligula
	eza 
	obsidian
	zsh
	zinit
	thefuck
	bat
    vscode
    hplip
    zed-editor
    go
    lua
    python3
    rofi
    portal
    python3Packages.pip
    uv
    clang
    zig
    rustup
    nodePackages_latest.pnpm
    nodePackages_latest.yarn
    nodePackages_latest.nodejs
    bun
    jdk
    maven
    gcc
    openssl
    nodePackages_latest.live-server
    git
    gh
    lazygit
    lazydocker
    bruno
    postman
    bruno-cli
    gnumake
    coreutils
    nixfmt-rfc-style
    meson
    ninja
    stow
    wget
    killall
    starship
    kitty
    zoxide
    fzf
    tmux
    progress
    tree
    alacritty
    exfatprogs
    yazi
    p7zip
    unzip
    unrar
    file-roller
    ncdu
    duf
    htop
    btop
    aria2
    qbittorrent
    cloudflare-warp
    tailscale
    onedrive
    pulseaudio
    pavucontrol
    ffmpeg
    mpv
    deadbeef-with-plugins
    imagemagick
    telegram-desktop
    zoom-us
    vesktop
    element-desktop
    google-chrome
    stremio
    pkg-config
    libgcc
    bc
    networkmanagerapplet
    cmatrix
    lolcat
    fastfetch
    onefetch
    microfetch
    wireshark
    ventoy
    youtube-music
    spotify
    libvirt

    # File systems
    ntfs3g
    os-prober





  ];

  virtualisation = {
    docker = {
      enable = true;
    };
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
