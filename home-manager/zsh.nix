{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    initExtraFirst = "
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    ";

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    zplug = {
      enable = true;
      plugins = [
        {
          name = "romkatv/powerlevel10k";
          tags = [as:theme depth:1];
        }
      ];
    };
  };
}
