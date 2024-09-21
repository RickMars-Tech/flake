{ pkgs, ... }: {

  #= Printers
    services.printing = {
        enable = true;
        drivers = with pkgs; [
            gutenprint
            #hplipWithPlugin
            hplip
        ];
    };

    environment.systemPackages = with pkgs; [
        hplip
    ];
}
