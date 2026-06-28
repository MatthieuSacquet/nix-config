{
  config,
  pkgs,
  inputs,
  ...
}:

{
    imports = [
        inputs.nvf.homeManagerModules.default
        ./keymaps.nix
        ./dashboard.nix 
        ./theme.nix
        ./git.nix
        ./languages.nix
        ./lsp.nix
        ./lualine.nix
        ./nvimTree.nix
        ./options.nix
        ./telescope.nix
        ./terminal.nix
    ];

    programs.nvf = {
        enable = true;
        defaultEditor = true;
        enableManpages = true;

        settings = {
            vim = {
                viAlias = true;
                vimAlias = true;

                globals.mapleader = " ";

                hideSearchHighlight = false;

                luaConfigRC.nvimTreeFix = ''
                  local notify = vim.notify
                  vim.notify = function(msg, log_level, _opts)
                    -- Si le message contient le warning de system_open, on l'ignore silencieusement
                    if msg:find("system_open has been removed") then
                      return
                    end
                    notify(msg, log_level, _opts)
                  end
                ''; # it is for delete the warning "[NvimTree] system_open has been removed, now used the system default handler: vim.ui.open()"

                binds.whichKey = {
                    enable = true;
                    register = {
                        "<leader>f" = "+Telescope";
                    };
                };

                treesitter = {
                    enable = true;
                };

                visuals = {
                    indent-blankline = {
                        enable = true;
                        setupOpts.exclude.filetypes = [
                            "dashboard"
                        ];
                    };
                    nvim-web-devicons.enable = true;
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

                ui = {
                    borders.enable = true;
                };

                comments.comment-nvim.enable = true;
                notes.todo-comments.enable = true;

                projects.project-nvim = {
                    enable = true;
                };

                utility = {
                    vim-wakatime.enable = false;
                    motion = {
                        flash-nvim = {
                            enable = true;
                            mappings = {
                                toggle = "<c-s>";
                            };
                        };
                    };
                    images.image-nvim = {
                        enable = true;
                        setupOpts = {
                            backend = "kitty";
                            processor = "magick_rock";
                        };
                    };
                };
            };
        };
    };
}
