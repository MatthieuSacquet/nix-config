{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        theme = {
            enable = true;
            name = "gruvbox";
            style = "dark";
            transparent = false;
        };
    };
}
