{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        languages = {
            enableFormat = true;
            enableExtraDiagnostics = true;
            enableTreesitter = true;

            clang.enable = true;
            cmake = {
                enable = true;
                format.enable = true;
            };
            markdown.enable = true;
            nix.enable = true;
            python.enable = true;
            rust = {
                enable = true;
                lsp = {
                    enable = true;
                    servers = [ "rust-analyzer" ];
                };
                treesitter.enable = true;
            };
            zig.enable = true;
            arduino = {
                enable = true;
                lsp = {
                    enable = true;
                    servers = [ "arduino-language-server" ];
                };
                treesitter.enable = true;
            };

            ##-WEB languages-##

            html.enable = true;
            css.enable = true;
            scss.enable = true;

            tsx.enable = true;

            vue = {
                enable = true;
                lsp.enable = true;
                format.enable = true;
            };

            json.enable = true;
            yaml.enable = true;

            typescript = {
                enable = true;
                treesitter.jsPackage = pkgs.vimPlugins.nvim-treesitter.grammarPlugins.javascript;
            };

            ##-WEB languages-##
        };
    };
}
