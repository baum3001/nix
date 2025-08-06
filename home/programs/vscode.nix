{
  inputs,
  config,
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {

      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        esbenp.prettier-vscode
        bradlc.vscode-tailwindcss
        bbenoist.nix
      ];
      userSettings = {

        "workbench.colorTheme" = "Catppuccin Mocha";
        "editor.fontFamily" = "ComicCodeLigatures Nerd Font";
        "editor.formatOnSave" = true;
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[html]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[css]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
      };
    };
  };
}
