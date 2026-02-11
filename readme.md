## Kaelwen的nixos配置

桌面环境：niri

桌面组件：

- waybar （顶栏）
- fuzzel （程序选择器）
- swayidle（自动熄屏）
- swaylock（锁屏）
- swayosd （音量、屏幕亮度窗口）
- swaync （通知）
- wlsunset (护眼模式)
- swww (壁纸)

主题配色管理：stylix

![alt text](assets/images/image-1.png)

也有gnome的配置

可在home.nix中选择要哪个终端和文件选择器（后续更改）

```nix
  programs.terminal.tty = "alacritty";
  # programs.terminal.tty = "kitty";
  programs.essential = {
    fileChoose = "thunar";
  };
```

fish为shell

---
