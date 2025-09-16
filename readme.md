# Nixos Dotfiles

This config is kinda ass and needs atleast 2 rewrites to be in a state I would consider Acceptable, use at your own risk

use `nix-shell -p nixfmt-tree --command 'treefmt .'` to format all files; use before committing

## Things that need to be done

### Multi-user

- multi-user should be done and in a usable state

### General

- Cleanup unused files(Wallpapers etc.)

### Modules

- General refactor: move everything currently in home/programs to homeModules to allow for more modularity
- General refactor: expose module optionas as nix options to allow for easier user customization

## Honorable Mentions :

- thank you [Julius](https://github.com/juliuskreutz/ "Meowngo") for your dotfiles that served as a good example configuration
- A lot of other git repos I copied from to a lesser extent

## Dishonorable mentions:

- Microsoft for creating an OS so ass I switched to Linux permanently
