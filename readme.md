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
