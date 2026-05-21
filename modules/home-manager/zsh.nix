{ config, pkgs, ...}:

{
  programs.zsh = {
  	enable = true;
	autosuggestion.enable = true;
	autosuggestion.highlight = "fg=#ff00ff,bg=cyan,bold,underline";
	package = pkgs.zsh;
  }

}
