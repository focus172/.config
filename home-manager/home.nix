{ pkgs, ... }:
{
  imports = [
    ./starship.nix
    ./packages.nix
    ./helix.nix
    ./neovim.nix
    ./sh.nix
    ./neofetch.nix
    ./desktop.nix
    ./theming.nix
    ./files.nix
    ./hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = pkgs.nix;

  targets.genericLinux.enable = true;
  
  home = {
    sessionVariables = {
      QT_XCB_GL_INTEGRATION = "none"; # kde-connect
      EDITOR = "nvim";
      VISUAL = "nvim";
      # BROWSER = "flatpak run org.mozilla.firefox";
      TERMINAL = "foot";
      NIXPKGS_ALLOW_UNFREE = "1";
      SHELL = "${pkgs.fish}/bin/fish";
    };

    sessionPath = [
      "$HOME/.local/bin"
    ];

    username = "focus";
    homeDirectory = "/home/focus";
    stateVersion = "21.11";


    # file = {}; # some fancy file building nonsense
  };

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs.home-manager.enable = true;
}
