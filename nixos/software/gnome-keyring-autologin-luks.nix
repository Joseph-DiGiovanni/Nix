{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.services.xserver.displayManager.gdm.enable {
    # Auto login will attempt to unlock gnome keyring using LUKS passphrase.
    # See https://github.com/NixOS/nixpkgs/pull/282317
    # TODO: Merged. Remove this if backported or in the next release.
    security.pam.services.gdm-autologin.text = lib.mkForce ''
      auth      requisite     pam_nologin.so
      auth      required      pam_succeed_if.so uid >= 1000 quiet
      ${lib.optionalString config.security.pam.services.login.enableGnomeKeyring ''
        auth       [success=ok default=1]      ${pkgs.gnome.gdm}/lib/security/pam_gdm.so
        auth       optional                    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so
      ''}
      auth      required      pam_permit.so
      account   sufficient    pam_unix.so
      password  requisite     pam_unix.so nullok yescrypt
      session   optional      pam_keyinit.so revoke
      session   include       login
    '';
  };
}
