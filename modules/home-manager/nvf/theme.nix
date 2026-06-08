{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        theme = {
            enable = true;
            name = "onedark";
            style = "warmer";
            transparent = false;
        };
    };
}
