{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.networking.networkmanager.enable {
    environment.etc."NetworkManager/dispatcher.d/99-auto-wlan" = {
      mode = "0755";
      text = ''
        #!${pkgs.bash}/bin/bash
        # Auto disable wifi when ethernet is connected
        wired_interfaces="en.*|eth.*"
        if [[ "$1" =~ $wired_interfaces ]]; then
            case "$2" in
                up)
                    ${pkgs.networkmanager}/bin/nmcli radio wifi off
                    ;;
                down)
                    ${pkgs.networkmanager}/bin/nmcli radio wifi on
                    ;;
            esac
        fi
      '';
    };
  };
}
