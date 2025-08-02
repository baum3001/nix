{ inputs, config, pkgs,  ...}:

{

    imports = [
      ./librewolf.nix
     # ./spicetify.nix
      ./terminal.nix
      ./vscode.nix
      ./vesktop.nix
  ];



  
  # fonts

  fonts.fontconfig.enable = true;



  home.packages = with pkgs; [
    gcr
    killall
    pavucontrol
    gotop
    tree
    fastfetch
    hyfetch
    blahaj
    kdePackages.dolphin
    nerd-fonts.fira-code
    inputs.comic-code-ligatures-nerd-font.packages.x86_64-linux.comic-code-ligatures-nerd-font

  ];

  services = {
    gnome-keyring.enable = true;
    hyprpolkitagent.enable = true;
    
    udiskie = {
      enable = true;
      settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin/";
        };
      };
    };
  };

}
