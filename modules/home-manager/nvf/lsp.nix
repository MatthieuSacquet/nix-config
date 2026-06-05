{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        lsp = {
            enable = true;
            trouble = {
                enable = true;
                mappings = {
                    documentDiagnostics = "<leader>dt";
                };
            };
        };
    };
}
