{inputs, ...}:

{
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia-shell = {
        enable = true;

        colors = {
            # you must set ALL of these
            mError = "#dddddd";
            mOnError = "#111111";
            mOnPrimary = "#111111";
            mOnSecondary = "#111111";
            mOnSurface = "#828282";
            mOnSurfaceVariant = "#5d5d5d";
            mOnTertiary = "#111111";
            mOnHover = "#ffffff";
            mOutline = "#3c3c3c";
            mPrimary = "#aaaaaa";
            mSecondary = "#a7a7a7";
            mShadow = "#000000";
            mSurface = "#111111";
            mHover = "#1f1f1f";
            mSurfaceVariant = "#191919";
            mTertiary = "#cccccc";
        };

        plugins = {
            sources = [
            {
                enabled = true;
                name = "Official Noctalia Plugins";
                url = "https://github.com/noctalia-dev/noctalia-plugins";
            }
            ];
            states = {
                catwalk = {
                    enabled = true;
                    sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
                };
            };
            version = 2;
        };
        # this may also be a string or a path to a JSON file.

        pluginSettings = {
            catwalk = {
                minimumThreshold = 25;
                hideBackground = true;
            };
        };
        settings = {
            # configure noctalia here
            templates = {
                enableUserTemplates = true;
            };
            bar = {
            density = "compact";
            position = "left";
            showCapsule = false;
            widgets = {
                left = [
                {
                    id = "ControlCenter";
                    useDistroLogo = true;
                }
                {
                    id = "Network";
                }
                {
                    id = "Bluetooth";
                }
                ];
                center = [
                {
                    hideUnoccupied = false;
                    id = "Workspace";
                    labelMode = "none";
                }
                ];
                right = [
                {
                    alwaysShowPercentage = false;
                    id = "Battery";
                    warningThreshold = 30;
                }
                {
                    formatHorizontal = "HH:mm";
                    formatVertical = "HH mm";
                    id = "Clock";
                    useMonospacedFont = true;
                    usePrimaryColor = true;
                }
                ];
            };
            };
            colorSchemes.predefinedScheme = "Monochrome";
            general = {
                avatarImage = "/home/drfoobar/.face";
                radiusRatio = 0.2;
            };
            location = {
                monthBeforeDay = true;
                name = "Paris, France";
            };
        };
        # this may also be a string or a path to a JSON file.
    };
}
