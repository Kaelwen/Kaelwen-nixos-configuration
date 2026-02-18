{
  ...
}:

{
  services.pass-secret-service.enable = true;

  programs.keepassxc = {
    enable = true;
    autostart = false;
    settings = {
      General = {
        ConfigVersion = 2;
        HideWindowOnCopy = true;
        MinimizeAfterUnlock = true;
      };

      Browser = {
        BestMatchOnly = true;
        Enabled = true;
        UpdateBinaryPath = false;
      };

      FdoSecrets = {
        Enabled = true;
      };

      GUI = {
        ApplicationTheme = "classic";
        ColorPasswords = true;
        Language = "zh_CN";
        MinimizeOnClose = true;
        MinimizeOnStartup = true;
        MinimizeToTray = true;
        MonospaceNotes = true;
        ShowTrayIcon = true;
        ToolButtonStyle = 4;
        TrayIconAppearance = "monochrome-light";
      };
      PasswordGenerator = {
        AdditionalChars = null;
        ExcludedChars = null;
      };

      SSHAgent = {
        Enabled = true;
      };

      Security = {
        PasswordEmptyPlaceholder = true;
      };

    };
  };

  # programs.git-credential-keepassxc = {
  #   enable = true;
  #   hosts = [
  #     "https://github.com"
  #     "https://gitee.com"
  #   ];
  # };
}
