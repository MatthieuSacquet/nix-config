{inputs, ...}:

{
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia = {
        enable = true;
        systemd.enable = true;
        # settings = builtins.fromJSON (builtins.readFile ./noctalia.json);
    };
}
