{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {

        filetree.nvimTree = {
            enable = true;
            openOnSetup = false;

            mappings = {
                toggle = "<leader>ee";
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
    };
}
