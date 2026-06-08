{ config, pkgs, ...}:

{
    programs.kitty = {
        enable = true;
        settings = {
            background_opacity = "0.8";
            dynamic_background_opacity = true;
        };
        actionAliases = {
            "cc" = "echo 'cc'";
        };
        font = {
            size = 15;
            name = "Cascadia Code";
            package = pkgs.cascadia-code;
        };
        themeFile = "3024_Night";
    };
}
