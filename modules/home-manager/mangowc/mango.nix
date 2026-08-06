{ config, pkgs, inputs, ... }:
{
    imports = [
        inputs.mango.hmModules.mango
    ];

    wayland.windowManager.mango= {
        enable = true;
        settings = {
            animations = 1;
            layer_animations=1;
            bordercolor="0x595959aa";
            exec-once= "noctalia";
            bind = [
                "SUPER,r,reload_config"
                "SUPER,space,spawn,fuzzel"
                "SUPER,Enter,spawn,kitty"
                "SUPER,q,killclient"
                "SUPER,f,togglefloating"
                "SUPER,F,toggle_all_floating"
                "SUPER,k,focusdir,up"
                "SUPER,j,focusdir,down"
                "SUPER,h,focusdir,left"
                "SUPER,l,focusdir,right"
                "SUPER,K,focus_window_or_workspace,up"
                "SUPER,J,focus_window_or_workspace,down"
                "SUPER,H,focus_window_or_workspace,left"
                "SUPER,L,focus_window_or_workspace,right"
                "SUPER,t,setlayout,tile"
                "SUPER,v,setlayout,vertical"
                "SUPER,c,setlayout,spiral"
                "SUPER,x,setlayout,scroller"
                "SUPER,n,switch_layout"

            ];
        };
    };
}
