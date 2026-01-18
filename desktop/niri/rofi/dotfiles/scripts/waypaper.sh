
TARGET_DIR="${1:-$HOME/图片/壁纸}"
# 支持的图片文件扩展名  
IMAGE_EXTENSIONS="(jpg|jpeg|png|gif|bmp|tiff|webp|svg|ico)"

cd "$TARGET_DIR" || exit 1
# 使用find查找图片文件
IMAGE_LIST=$(find . -maxdepth 1 -type f -regextype posix-extended -regex ".*\.${IMAGE_EXTENSIONS}" 2>/dev/null | sed 's|^\./||' | sort)
# 如果没有图片文件，显示提示
if [ -z "$IMAGE_LIST" ]; then
    echo "在 $TARGET_DIR 中没有找到图片文件"
    exit 1
fi
# 使用rofi dmenu模式，启用预览
SELECTED_FILE=$(echo "$IMAGE_LIST" | rofi -dmenu -i \
    -p "选择图片" \
    -mesg "目录: $TARGET_DIR" \
    -show-icons \
    -preview-window up:70%:wrap \
    -preview "cp '{1}' /tmp/rofi-preview 2>/dev/null && echo '/tmp/rofi-preview'" \
    -theme ~/.config/rofi/themes/wallpaper.rasi)
# 如果选择了文件，返回完整路径
if [ -n "$SELECTED_FILE" ]; then
    echo "$TARGET_DIR/$SELECTED_FILE"
    # 清理预览文件
    rm -f /tmp/rofi-preview
fi
