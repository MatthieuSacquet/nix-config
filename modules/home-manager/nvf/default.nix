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

                theme = {
                    enable = true;
                    name = "nord";
                    # style = "hard";
                    transparent = false;
                };

                binds.whichKey = {
                    enable = true;
                    register = {
                        "<leader>f" = "+Telescope";
                    };
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

                keymaps = [
                    {
                        key = "<Esc>";
                        mode = "n";
                        silent = false;
                        desc = "Escape search";
                        action = "<cmd>nohlsearch<CR>";
                    }
                    {
                        key = "<A-j>";
                        mode = "n";
                        silent = true;
                        desc = "Move Down";
                        action = "<cmd>execute 'move .+' . v:count1<cr>==";
                    }
                    {
                        key = "<A-k>";
                        mode = "n";
                        silent = true;
                        desc = "Move Up";
                        action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
                    }
                    {
                        key = "<A-j>";
                        mode = "i";
                        silent = true;
                        desc = "Move Down";
                        action = "<esc><cmd>m .+1<cr>==gi";
                    }
                    {
                        key = "<A-k>";
                        mode = "i";
                        silent = true;
                        desc = "Move Up";
                        action = "<esc><cmd>m .-2<cr>==gi";
                    }
                    {
                        key = "<A-k>";
                        mode = "v";
                        silent = true;
                        desc = "Move Down";
                        action = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
                    }
                    {
                        key = "<A-j>";
                        mode = "v";
                        silent = true;
                        desc = "Move Up";
                        action = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
                    }

                    {
                        key = "<C-h>";
                        mode = "n";
                        silent = true;
                        desc = "Go to Left Window";
                        action = "<C-w>h";
                    }
                    {
                        key = "<C-j>";
                        mode = "n";
                        silent = true;
                        desc = "Go to Lower Window";
                        action = "<C-w>j";
                    }
                    {
                        key = "<C-k>";
                        mode = "n";
                        silent = true;
                        desc = "Go to Upper Window";
                        action = "<C-w>h";
                    }
                    {
                        key = "<C-l>";
                        mode = "n";
                        silent = true;
                        desc = "Go to Right Window";
                        action = "<C-w>l";
                    }
                    {
                        key = "<";
                        mode = "x";
                        action = "<gv";
                    }
                    {
                        key = ">";
                        mode = "x";
                        action = ">gv";
                    }
                    {
                        key = "<leader>wv";
                        mode = "n";
                        silent = true;
                        desc = "Slip Window vertically";
                        action = "<C-w>v";
                    }
                    {
                        key = "<leader>wd";
                        mode = "n";
                        silent = true;
                        desc = "Delete Window";
                        action = "<C-w>q";
                    }
                    {
                        key = "<leader><leader>";
                        mode = "n";
                        silent = true;
                        desc = "Find file";
                        action = "<cmd>Telescope find_files<CR>";
                    }
                ];

                statusline.lualine = {
                    enable = true;
                    theme = "nord";
                    icons.enable = true;
                    # sectionSeparator = { left = ""; right = ""; };
                    # componentSeparator = { left = ""; right = ""; };
                };

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
                    enable = false;
                    setupOpts = {
                        attach_to_untracked = true;
                        current_line_blame = true;
                        current_line_blame_opts = {
                            delay = 0;
                            virt_text_pos = "eol";
                        };
                    };
                };

                projects.project-nvim = {
                    enable = true;
                };

                telescope = {
                    enable = true;
                    mappings = {
                        buffers = "<leader>fb";
                        diagnostics = "<leader>fld";
                        findFiles = "<leader>ff";
                        findProjects = "<leader>fp";
                        gitStatus = "<leader>fgs";
                        gitCommits = "<leader>fgc";
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
                dashboard.dashboard-nvim = {
                    enable = true;
                    setupOpts = {
                        theme = "doom";
                        config = {
                            hide.statusline = false;

                            header = [
                                ""
                                ""
                                ""
                                ""
                                "██████╗ ██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
                                "██╔══██╗██║██║ ██╔╝██║   ██║██║████╗ ████║"
                                "██████╔╝██║█████╔╝ ██║   ██║██║██╔████╔██║"
                                "██╔═══╝ ██║██╔═██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
                                "██║     ██║██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
                                "╚═╝     ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
                            ];
                            center = [
                                { icon = " "; desc = "Find file"; key = "f"; action = "Telescope find_files"; }
                                { icon = " "; desc = "Live grep"; key = "g"; action = "Telescope live_grep"; }
                                { icon = " "; desc = "Find project"; key = "p"; action = "Telescope projects"; }
                                { icon = "⚙ "; desc = "Config"; key = "c"; action = "e ~/nix-config/modules/home-manager/nvf/default.nix"; }
                                { icon = " "; desc = "Quit"; key = "q"; action = "qa"; }
                            ];
                        };
                    };
                };

            };
        };
    };
}
