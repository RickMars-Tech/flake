{ config, pkgs, lib, ... }:

{

    home.file.".drirc" = {
        enable = true;
        text = ''
            <driconf>
                <device>
                    <application name="Default">
                        <option name="vblank_mode" value="0" />
                    </application>
                </device>
            </driconf>
        '';
    };

}
