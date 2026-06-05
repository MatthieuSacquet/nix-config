{
    pkgs,
    inputs,
    ...
}:

{
    
    programs.nvf.settings.vim = {
        keymaps = [
            {
                key = "<Esc>";
                mode = "n";
                silent = false;
                desc = "Escape search";
                action = "<cmd>nohlsearch<CR>";
            }
            {
                key = "<A-j>";
                mode = "n";
                silent = true;
                desc = "Move Down";
                action = "<cmd>execute 'move .+' . v:count1<cr>==";
            }
            {
                key = "<A-k>";
                mode = "n";
                silent = true;
                desc = "Move Up";
                action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
            }
            {
                key = "<A-j>";
                mode = "i";
                silent = true;
                desc = "Move Down";
                action = "<esc><cmd>m .+1<cr>==gi";
            }
            {
                key = "<A-k>";
                mode = "i";
                silent = true;
                desc = "Move Up";
                action = "<esc><cmd>m .-2<cr>==gi";
            }
            {
                key = "<A-k>";
                mode = "v";
                silent = true;
                desc = "Move Down";
                action = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
            }
            {
                key = "<A-j>";
                mode = "v";
                silent = true;
                desc = "Move Up";
                action = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
            }

            {
                key = "<C-h>";
                mode = "n";
                silent = true;
                desc = "Go to Left Window";
                action = "<C-w>h";
            }
            {
                key = "<C-j>";
                mode = "n";
                silent = true;
                desc = "Go to Lower Window";
                action = "<C-w>j";
            }
            {
                key = "<C-k>";
                mode = "n";
                silent = true;
                desc = "Go to Upper Window";
                action = "<C-w>h";
            }
            {
                key = "<C-l>";
                mode = "n";
                silent = true;
                desc = "Go to Right Window";
                action = "<C-w>l";
            }
            {
                key = "<";
                mode = "x";
                action = "<gv";
            }
            {
                key = ">";
                mode = "x";
                action = ">gv";
            }
            {
                key = "<leader>wv";
                mode = "n";
                silent = true;
                desc = "Slip Window vertically";
                action = "<C-w>v";
            }
            {
                key = "<leader>wd";
                mode = "n";
                silent = true;
                desc = "Delete Window";
                action = "<C-w>q";
            }
            {
                key = "<leader><leader>";
                mode = "n";
                silent = true;
                desc = "Find file";
                action = "<cmd>Telescope find_files<CR>";
            }
        ];
    };
}
