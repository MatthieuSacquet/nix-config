{
    pkgs,
    inputs,
    ...
}:

{
    programs.nvf.settings.vim = {
        options = {
            clipboard = "unnamedplus";
            mouse = "a";
            updatetime = 300;

            colorcolumn = "80";
            #number
            cursorline = true;
            number = true;
            relativenumber = true;
            wrap = false;
            signcolumn = "yes";
            cursorlineopt = "both";

            # tab settings
            tabstop = 4;
            shiftwidth = 4;
            softtabstop = 4;
            expandtab = true;
            shiftround = true;
            autoindent = true;
            smartindent = true;

            #search
            ignorecase = true;
            smartcase = true;
            incsearch = true;
            hlsearch = true;

            list = true;
            listchars = {
                trail = "~";
            };

            conceallevel = 2;
            concealcursor = "nc";
        };
    };
}
