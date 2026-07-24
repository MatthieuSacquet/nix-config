{ pkgs, ... }:
{
    home.packages = with pkgs; [
        superfile
    ];

    programs.superfile = {
        enable = true;
        settings = {
            theme = "monokai";
            transparent_background = true;
        };
    };
}
