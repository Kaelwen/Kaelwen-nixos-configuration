history=$(cliphist list)

# 如果历史为空，则退出
if [ -z "$history" ]; then
    notify-send "剪贴板历史为空"
    exit 1
fi

# 使用 fuzzel 进行模糊选择（显示内容，但保留 ID）
selected=$(echo "$history" | fuzzel --dmenu --prompt="📋 剪贴板历史: ")

# 如果用户取消（无输出），则退出
if [ -z "$selected" ]; then
    exit 0
fi

# 提取 ID（第一列，以制表符分隔）
id=$(printf '%s' "$selected" | cut -f1)

# 将对应 ID 的内容解码并复制到剪贴板
cliphist decode "$id" | wl-copy

# 可选：通知用户（需要 notify-send）
notify-send "✅ 已复制到剪贴板"
