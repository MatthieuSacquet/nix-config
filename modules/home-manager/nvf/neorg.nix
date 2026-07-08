{
    inputs,
    ...
}:

{
    programs.nvf.settings.vim.notes.neorg = {
        enable = true;
        setupOpts = {
            load = {
                "core.defaults" = { };
                "core.concealer" = { };
                # Keymaps
                "core.keybinds" = {
                    config = {
                        default_keybinds = true;
                        neorg_leader = "<LocalLeader>";
                        preset = "neorg";
                    };
                };
            };
        };
    };
}
