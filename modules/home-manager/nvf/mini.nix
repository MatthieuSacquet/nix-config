{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        mini = {
            enable = true;
            cursorword.enable = true;
            colors = {
                enable = true;
            };
        };
    };
}
