{inputs, ...}:

{
    imports = [
      inputs.caelestia-shell.homeModules.default
    ];

    programs.caelestia = {
        enable = true;
        cli.enable = true;
    };

}
