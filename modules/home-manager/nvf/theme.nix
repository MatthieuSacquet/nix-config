{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        theme = {
            enable = true;
            name = "nord";
            # style = "";
            transparent = false;
        };
    };
}
