{
  pkgs,
  inputs,
  config,
  lib,
  userName,
  ...
}:
let
  tty = config.programs.terminal.tty;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.niri.settings.binds = {
    "Mod+D" = {
      hotkey-overlay.title = "打开搜索";
      repeat = false;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
    };
    "Mod+C" = {
      hotkey-overlay.title = "打开剪切板";
      repeat = false;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "clipboard"
      ];
    };

    "Mod+Alt+L" = {
      hotkey-overlay.title = "锁屏";
      repeat = false;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "lockScreen"
        "lock"
      ];
    };
    "Mod+W" = {
      repeat = false;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "wallpaper"
        "toggle"
      ];
    };
    XF86AudioLowerVolume = {
      allow-when-locked = true;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "decrease"
      ];
    };
    XF86AudioMicMute = {
      allow-when-locked = true;
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SOURCE@"
        "toggle"
      ];
    };
    XF86AudioMute = {
      allow-when-locked = true;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "muteOutput"
      ];
    };
    XF86AudioRaiseVolume = {
      allow-when-locked = true;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "increase"
      ];
    };
    XF86MonBrightnessDown = {
      allow-when-locked = true;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "brightness"
        "decrease"
      ];
    };
    XF86MonBrightnessUp = {
      allow-when-locked = true;
      action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "brightness"
        "increase"
      ];
    };

  };
  #
  # home.packages = with pkgs; [
  #   cliphist
  #   cava
  # ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;

    colors = with config.lib.stylix.colors.withHashtag; {
      mError = lib.mkForce base08;
      mOnError = lib.mkForce base00;
      mOnPrimary = lib.mkForce base00;
      mOnSecondary = lib.mkForce base01;
      mOnSurface = lib.mkForce base05;
      mOnSurfaceVariant = lib.mkForce base07;
      mOnTeritiary = lib.mkForce base02;
      mOutline = lib.mkForce base02;
      mPrimary = lib.mkForce base07;
      mSecondary = lib.mkForce base06;
      mShadow = lib.mkForce "#000000";
      mSurface = lib.mkForce base01;
      mSurfaceVariant = lib.mkForce base01;
      mTeritiary = lib.mkForce base0B;
    };

    settings = {
      settingsVersion = 0;
      bar = {
        position = "top";
        monitors = [ ];
        density = "default";
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = lib.mkForce 1;
        # backgroundOpacity = lib.mkForce 0;
        useSeparateOpacity = false;
        floating = false;
        marginVertical = 4;
        marginHorizontal = 4;
        outerCorners = true;
        exclusive = true;
        hideOnOverview = false;
        widgets = {
          left = [
            # {
            #   id = "Launcher";
            # }
            {
              id = "Workspace";
            }
            {
              id = "SystemMonitor";
              compactMode = false;
            }
            {
              id = "ActiveWindow";
            }
            {
              id = "MediaMini";
            }
          ];
          center = [
            {
              id = "Clock";
            }
          ];
          right = [
            {
              id = "Tray";
              colorizeIcons = false;
              drawerEnabled = false;
              hidePassive = false;
            }
            {
              id = "NotificationHistory";

            }
            {
              id = "Battery";
              hideWhenZero = false;
              hideWhenZeroUnread = false;
            }
            {
              id = "Volume";
              displayMode = "alwaysShow";
            }
            {
              id = "Brightness";
              displayMode = "alwaysShow";
            }
            {
              id = "ControlCenter";
            }
          ];
        };
        screenOverrides = [ ];
      };
      general = {
        avatarImage = "${../../../../assets/head/Frieren.png}";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableShadows = true;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
      };
      ui = {
        # fontDefault = "";
        # fontFixed = "";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        tooltipsEnabled = true;
        panelBackgroundOpacity = lib.mkForce 1;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        networkPanelView = "wifi";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = false;
      };
      location = {
        name = "Xiamen";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "/home/${userName}/Pictures/wallpapers";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
      };
      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = true;
        enableClipPreview = true;
        clipboardWrapText = true;
        position = "center";
        pinnedApps = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = tty;
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
      };
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "WallpaperSelector";
            }
            {
              id = "NoctaliaPerformance";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        cpuPollingInterval = 3000;
        tempPollingInterval = 3000;
        gpuPollingInterval = 3000;
        enableDgpuMonitoring = true;
        memPollingInterval = 3000;
        diskPollingInterval = 30000;
        networkPollingInterval = 3000;
        loadAvgPollingInterval = 3000;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };
      dock = {
        enabled = false;
        # position = "bottom";
        # displayMode = "auto_hide";
        # backgroundOpacity = 1;
        # floatingRatio = 1;
        # size = 1;
        # onlySameOutput = true;
        # monitors = [ ];
        # pinnedApps = [ ];
        # colorizeIcons = false;
        # pinnedStatic = false;
        # inactiveIndicators = false;
        # deadOpacity = 0.6;
        # animationSpeed = 1;
      };
      network = {
        wifiEnabled = true;
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 10000;
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
      };
      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "center";
        showHeader = true;
        largeButtonsStyle = false;
        largeButtonsLayout = "grid";
        showNumberLabels = true;
        powerOptions = [
          {
            action = "lock";
            enabled = true;
          }
          {
            action = "suspend";
            enabled = true;
          }
          {
            action = "hibernate";
            enabled = true;
          }
          {
            action = "reboot";
            enabled = true;
          }
          {
            action = "logout";
            enabled = true;
          }
          {
            action = "shutdown";
            enabled = true;
          }
        ];
      };
      notifications = {
        enabled = true;
        monitors = [ ];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = lib.mkForce 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
      };
      osd = {
        enabled = true;
        location = "top_right";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = lib.mkForce 1;
        enabledTypes = [
          0
          1
          2
        ];
        monitors = [ ];
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 30;
        visualizerType = "linear";
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
      };
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };
      # colorSchemes = {
      #   useWallpaperColors = false;
      #   predefinedScheme = "Noctalia (default)";
      #   darkMode = true;
      #   schedulingMode = "off";
      #   manualSunrise = "06:30";
      #   manualSunset = "18:30";
      #   generationMethod = "tonal-spot";
      #   monitorForColors = "";
      # };
      # templates = {
      #   activeTemplates = [ ];
      #   enableUserTheming = false;
      # };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
      };
      desktopWidgets = {
        enabled = false;
        gridSnap = false;
        monitorWidgets = [ ];
      };
    };

  };
}
