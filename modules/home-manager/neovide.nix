{ config , pkgs, ... }:

{
    programs.neovide = {
        enable = true;
        settings = {
            cursor-animation-length = 0.0;
        };
    };
}
