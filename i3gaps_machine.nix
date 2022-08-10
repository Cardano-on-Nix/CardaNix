{ config, pkgs, ... }:

{
  users = {
    extraUsers = {
      onyx = {
          isNormalUser = true;
          home = "/home/onyx";
          uid = 1000;
          description = "onyx-tower";
          extraGroups = [ "wheel" "plugdev" ];
          # shell = pkgs.zsh;
          # openssh.authorizedKeys.keys = [ "ssh-dss AAAAB3Nza... alice@foobar" ];
        };
      guest = {
          isNormalUser = true;
          home = "/home/guest";
          uid = 2000;
          description = "Guest User";
          extraGroups = [ "networkmanager" ];
          # shell = pkgs.zsh;
      };
    };
    groups.plugdev = {};
  };

  networking = {
    hostName = "kimchi"; # Define your hostname.
    useDHCP = false;
    interfaces.eno1.useDHCP = true;
    interfaces.eth0.useDHCP = true;
    wireless.enable = false;  # wireless support via wpa_supplicant.
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    #networking.firewall.allowedTCPPorts = [ ... ];
    #networking.firewall.allowedUDPPorts = [ ... ];
    #Or disable the firewall altogether.
    #networking.firewall.enable = false;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  services = {
    xserver = {
      enable = true;
      #startDbusSession = true;
      layout = "us";
      xkbOptions = "caps:ctrl_modifier";
      #xkbOptions = "eurosign:e"; 
      libinput = {
        enable = true;
        disableWhileTyping = true;
      };
      displayManager = {
        defaultSession = "none+xmonad"; #xmonad
        #defaultSession = "none+i3"; #i3 gaps
        gdm.enable = false; #gnome
        gdm.wayland = false; #gnome wayland
        sddm.enable = false; #KDEshit
      };
      desktopManager = {
        gnome.enable = false; #gnome
        plasma5.enable = false; #plasma
        xterm.enable = false; #i3-gaps
      };
      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };
        #i3 = {
        #  enable = false;
        #  extraPackages = with pkgs; [
        #    dmenu #application launcher most people use
        #    #i3status # gives you the default i3 status bar
        #    i3lock #default i3 screen locker
        #    i3blocks #if you are planning on using i3blocks over i3status
        #    i3-gaps #gaps add-on
        #  ];
        #};
      };
    };

    hardware.bolt.enable = true; #gvolpe
    
   # dbus = {
   #   enable = true;
   #   socketActivated = true;
   #   packages = [
   #     #pkgs.gnome3.dconf 
   #     pkgs.dconf 
   #   ];
   # };
   
    #udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
    
    #gnome3.gnome-keyring.enable = true; #gvolpe
    #upower.enable = true; #gvolpe
    
    # Enable CUPS to print documents.
    printing.enable = true;
  
    # Enable the OpenSSH daemon.
    openssh.enable = true;
  };
  #systemd.services.upower.enable = true;
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     font = "Lat2-Terminus16";
     keyMap = "us";
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  #Virtualbox Stuff
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
}
