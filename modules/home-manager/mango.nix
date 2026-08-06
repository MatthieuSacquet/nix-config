{ config, pkgs, inputs, ... }:
{
    imports = [
        inputs.mango.hmModules.mango
    ];

    wayland.windowManager.mango= {
        enable = true;
        settings = {
            animations = 0;
            bordercolor="0x595959aa";
            bind = [
                "SUPER,r,reload_config"
                "SUPER,space,spawn,fuzzel"
                "SUPER,Return,spawn,foot"
            ];
        };
    };
}
