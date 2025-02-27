{ config, lib, pkgs, inputs, ... }:

{
  home.sessionPath = [ "/Applications/Visual Studio Code - Insiders.app/Contents/Resources/app/bin" ];

  home.packages = [ pkgs.qemu6 ];

  programs.git = {
    enable = true;
    signing = {
      key = "0CCA2992";
      signByDefault = true;
    };
    userEmail = "ben@curlybracket.co.uk";
    userName = "Ben Pye";
  };

  programs.go = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "*" = {
        user = "ben";
        extraOptions = {
          ControlMaster = "auto";
          ControlPath = "~/.ssh/sockets/%r@%h-%p";
          ControlPersist = "600";
        };
      };

      "nixserve" = {
        hostname = "192.168.1.1";
        forwardAgent = true;
      };

      "nixvm-aarch64" = {
        hostname = "localhost";
        port = 2222;
        forwardAgent = true;
      };
    };
  };

  programs.zsh = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;

    # null pinentry will use the platform default - pinentry-mac on mac
    pinentryFlavor = null;
  };

  services.dirmngr = {
    enable = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
