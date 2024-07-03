{ config, pkgs, lib, ... }:

{
#==> Apparmor <==#
  security.apparmor = {
    enable = true;
    enableCache = true;
    packages = with pkgs; [
        apparmor-kernel-patches
        apparmor-profiles
    ];
  };

#==> Polkit <==#
  security.polkit.enable = true;
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';

#==> MemorySafe for Sudo <==#
  security.sudo-rs = {
    enable = true;
  };
}
