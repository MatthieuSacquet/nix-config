{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
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
                        ""
                        ""
                        ""
                    ];
                    center = [
                        { icon = " "; desc = "Find file"; key = "f"; action = "Telescope find_files"; }
                        { icon = " "; desc = "Live grep"; key = "g"; action = "Telescope live_grep"; }
                        { icon = " "; desc = "Find project"; key = "p"; action = "Telescope projects"; }
                        { icon = "⚙ "; desc = "Config"; key = "c"; action = "Oil ~/nix-config/modules/home-manager/nvf"; }
                        { icon = " "; desc = "Quit"; key = "q"; action = "qa"; }
                    ];
                };
            };
        };
    };
}
