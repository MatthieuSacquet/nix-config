{ config, pkgs, ...}

{

  programs.kitty = {
  	enable = true;
	themeFile = "Azy";
	font = {
		size = "11";
		name = "Cascadia Code";
		package = pkgs.cascadia-code;
	};
	settings = {
		background_opacity = "0.5";
		dynamic_background_opacity = true;
	};
	actionAliases = {
		"cc" = "echo 'cc'";
	};
  };
}
