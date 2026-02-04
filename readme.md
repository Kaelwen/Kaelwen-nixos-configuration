## binigo的nixos配置

桌面环境：niri

桌面组件：

- waybar
- fuzzel
- swayidle
- swaylock
- swayosd
- mako

![alt text](assets/images/image-1.png)

也有gnome的配置

> 好像也没啥好说的

---

## 小窍门

### 查询软件在nix/store的位置

如果是商业软件，先输入`export NIXPKGS_ALLOW_UNFREE=1`

输入如下命令查询软件的位置：

```nix
nix eval --raw nixpkgs#wpsoffice-cn --impure
```

返回如下：

```bash
❯ nix eval --raw nixpkgs#wpsoffice-cn --impure
/nix/store/1ip3v8gcz1aqf37v7fn9jj6rggj8gzsk-wpsoffice-cn-12.1.2.23578⏎
```

再通过ls查询该文件夹

```bash
❯ ls /nix/store/1ip3v8gcz1aqf37v7fn9jj6rggj8gzsk-wpsoffice-cn-12.1.2.23578/share/applications/
wps-office-et.desktop   wps-office-prometheus.desktop  wps-office-wps.desktop
wps-office-pdf.desktop  wps-office-wpp.desktop
```

作用：

- 当你需要软件的二进制文件来启动的时候。
  例如我在waybar的设置：

```nix
bluetooth = {
    format-disabled = "󰂲";
    format = "󰂯";
    format-connected = "󰂱";
    on-click = "${pkgs.blueberry}/bin/blueberry";
};
```

- 当你需要desktop之类的时候

```nix
let
    photoViewer = "org.gnome.gThumb.desktop";
    ...
in
{
    xdg = {
        enable = true;
        ...
        mimeApps = {
            enable = true;
            defaultApplications = {
                "image/png" = [ photoViewer ];
        ...
        }
    }
}
```

- 当你需要qt之类的依赖路径的时候

### niri的窗口规则设置

假设你希望niri在qq查看图片时，图片查看器是浮空的。但是又不知道config.kdl中怎么设置app-id和title。

可以安装一个`wlrctl`。

接着打开qq里的一张图片。

然后命令行输入：

```bash
 wlrctl toplevel list
```

可以看到终端的打印：

```bash
binigo@nixos ~> wlrctl toplevel list
QQ: QQ
kitty: nvim ~/nixos-configuration
QQ: 图片查看器
...
```

那么就可以填写window-rules了

```kdl
window-rule {
    match app-id="org.pulseaudio.pavucontrol"
    match app-id="mpv"
    match app-id="org.gnome.FileRoller"
    match app-id="QQ" title="图片查看器"
    match app-id="wechat" title="图片和视频"
    open-floating true
}
```
