{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        languages = {
            enableTreesitter = true;
            clang.enable = true;
            cmake = {
                enable = true;
                format.enable = true;
            };
            markdown.enable = true;
            nix.enable = true;
            python.enable = true;
            rust.enable = true;
            zig.enable = true;
        };
    };
}
