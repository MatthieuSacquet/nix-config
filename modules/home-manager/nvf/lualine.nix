{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        statusline.lualine = {
            enable = true;
            theme = "nord";
            icons.enable = true;
            # sectionSeparator = { left = ""; right = ""; };
            # componentSeparator = { left = ""; right = ""; };
        };
    };
}
