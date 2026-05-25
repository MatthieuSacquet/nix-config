{ config, pkgs, inputs, ...}:

{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
  	enable = true;

	defaultEditor = true;
	vimAlias = true;
	viAlias = true;

	globals.mapleader = " ";

	opts = {
		number = true;
		relativenumber = true;
		wrap = false;
		clipboard = "unnamedplus";
	};
  };
}
