{ config , pkgs, ... }:

{
    programs.btop = {
        enable = true;
        settings = {
            color_theme = "Default";
            theme_background = false;
            graph_symbol = "block";
        };
    };
}
