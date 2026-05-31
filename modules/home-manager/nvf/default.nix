{
  config,
  pkgs,
  inputs,
  ...
}:

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

                theme = {
                    enable = true;
                    name = "tokyonight";
                    style = "night";
                    transparent = false;
                };

                binds.whichKey = {
                    enable = true;
                    register = {
                        "<leader>f" = "+Telescope";
                    };
                };

                visuals = {
                    indent-blankline.enable = true;
                    nvim-web-devicons.enable = true;
                };

                options = {
                    clipboard = "unnamedplus";
                    mouse = "a";
                    updatetime = 300;

                    #number
                    cursorline = true;
                    number = true;
                    relativenumber = true;
                    wrap = false;
                    signcolumn = "yes";
                    cursorlineopt = "both";

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
                    trouble = {
                        enable = true;
                        mappings = {
                            documentDiagnostics = "<leader>dt";
                        };
                    };
                };

                languages = {
                    enableTreesitter = true;
                    clang.enable = true;
                    cmake = {
                        enable = true;
                        format.enable = true;
                    };
                    markdown.enable = true;
                    nix.enable = true;
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

                ui = {
                    borders.enable = true;
                };

                comments.comment-nvim.enable = true;
                notes.todo-comments.enable = true;

                # keymaps = [
                #     {
                #         key = "<leader>e";
                #         mode = "n";
                #         silent = true;
                #         action = ":Neotree toggle<CR>";
                #     }
                # ];

                filetree.nvimTree = {
                    enable = true;
                    openOnSetup = false;

                    mappings = {
                        toggle = "<leader>e";
                        refresh = "<leader>re";
                    };

                    setupOpts = {
                        system_open = {
                            cmd = "";
                            args = [];
                        };

                        view = {
                            width = 35;
                            side = "left";
                        };

                        renderer = {
                            group_empty = true;
                            indent_markers.enable = true;
                            highlight_git = true;
                        };

                        git.enable = true;

                        update_focused_file = {
                            enable = true;
                            update_root = true;
                        };
                    };

                };

                git.gitsigns = {
                    enable = true;
                    setupOpts = {
                        attach_to_untracked = true;
                        current_line_blame = true;
                        current_line_blame_opts = {
                            delay = 0;
                            virt_text_pos = "eol";
                        };
                    };
                };

                telescope = {
                    enable = true;
                    mappings = {
                        buffers = "<leader>fb";
                        diagnostics = "<leader>fld";
                        findFiles = "<leader>ff";
                        findProjects = "<leader>fp";
                    };
                    extensions = [
                        {
                        name = "fzf";
                        packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
                        setup = {
                            fzf = {
                            fuzzy = true;
                            override_file_sorter = true;
                            override_generic_sorter = true;
                            case_mode = "smart_case";
                            };
                        };
                        }
                    ];
                    setupOpts = {
                        defaults = {
                        layout_config.horizontal.prompt_position = "top";
                        sorting_strategy = "ascending";
                        };
                    pickers.find_files.hidden = true;
                    };
                };

                utility = {
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
