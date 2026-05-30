{ config, pkgs, inputs, ...}:

{

imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;
    enableManpages = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        globals.mapleader = " ";


        theme = {
                enable = true;
                name = "catppuccin";
                style = "mocha";
                transparent = false;
        };

        options = {
                clipboard = "unnamedplus";
		mouse = "a";
                updatetime = 300;

		#number
		number = true;
		relativenumber = true;
		wrap = false;
		cursorline = true;
                signcolumn = "yes";
		
		# tab settings
		tabstop = 4;
		shiftwidth = 4;
		softtabstop = 4;
		expandtab = true;
		shiftround = true;
		autoindent = true;
		smartindent = true;

		#search
		ignorecase = true;
          	smartcase = true;
          	incsearch = true;
          	hlsearch = true;
        };

        lsp = {
          enable = true;
        };

        languages = {
          enableTreesitter = true;
          clang.enable = true;
          cmake = {
                enable = true;
                format.enable = true;
          };
          markdown.enable = true;
          nix.enable = true; # nixd language server
          python.enable = true;
          rust.enable = true;
          zig.enable = true;
        };
        
        autocomplete.nvim-cmp = {
            enable = true;
            mappings = {
                confirm = "<CR>";
                complete = "<C-Space>";
                next = "<Tab>";
                previous = "<S-Tab>";
            };
        };

        terminal = {
            toggleterm = {
                enable = true;
                mappings.open = "<c-t>";
                setupOpts.direction = "horizontal";

                lazygit = {
                    enable = true;
                    direction = "float";
                    mappings.open = "<leader>gg";
                };
            };
        };
      };
    };
  };
}
