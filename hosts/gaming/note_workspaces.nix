{
    inputs,
    ...
}:

{
    programs.nvf.settings.vim.notes.neorg = {
        setupOpts = {
            load = {
                "core.dirman" = {
                    config = {
                        workspaces = {
                            notes = "~/Document/Notes/notes";
                            melee = "~/Document/Notes/melee";
                        };
                        default_workspace = "notes";
                    };
                };
            };
        };
    };
}
