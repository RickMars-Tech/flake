{ ... }: {

    services.thinkfan = {
        enable = false;
    };

    services.throttled = {
        enable = true;
        extraConfig = "";
    };

}
