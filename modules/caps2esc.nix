{ config, pkgs, ... }:

{
  services.kanata = {
    enable = true;
    keyboards.Caps2esc.config = ''
      (defsrc
        caps
      )

      (defalias
        escctrl (tap-hold 150 150 esc lctrl)
      )

      (deflayer base
        @escctrl
      )
    '';
  };
}
