{ config, pkgs, ...}:

{

  programs.oh-my-posh = {
  	package = {
		pkgs.oh-my-posh;
	};
	enable = true;
	configFile = "./themes/blue-owl.omp.json";
  };

}
