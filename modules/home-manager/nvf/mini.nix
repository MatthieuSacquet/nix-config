{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        mini = {
            colors = {
                enable = true;
            };
        };
    };
}
