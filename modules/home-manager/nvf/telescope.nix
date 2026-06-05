{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
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
    };
}
