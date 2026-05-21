{ config, pkgs, ...}:

{
  programs.zsh = {
  	enable = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = false;
	package = pkgs.zsh;
	oh-my-zsh = {
    		enable = true;
    		plugins = [ "git" ];
		theme = "robbyrussell";
  	};
  };

}
