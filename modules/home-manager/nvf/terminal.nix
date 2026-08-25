{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        terminal = {
            toggleterm = {
                enable = true;
                mappings.open = "<leader>to";
                setupOpts.direction = "horizontal";

                lazygit = {
                    enable = true;
                    direction = "float";
                    mappings.open = "<leader>gg";
                };
            };
        };
    };
}
