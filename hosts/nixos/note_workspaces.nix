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
                            langage = "~/Document/Notes/langage";
                        };
                        default_workspace = "notes";
                    };
                };
            };
        };
    };
}
