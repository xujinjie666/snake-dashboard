#!/bin/bash

# 数据同步脚本
# 用法：./sync-data.sh 备份文件.json

if [ -z "$1" ]; then
    echo "❌ 请提供备份JSON文件路径"
    echo "用法: ./sync-data.sh 蛇货战绩备份_2026-10-21.json"
    exit 1
fi

BACKUP_FILE="$1"

if [ ! -f "$BACKUP_FILE" ]; then
    echo "❌ 文件不存在: $BACKUP_FILE"
    exit 1
fi

echo "📦 正在同步数据..."

# 读取JSON数据
BACKUP_DATA=$(cat "$BACKUP_FILE")

# 备份原HTML文件
cp index.html index.html.bak
echo "✓ 已备份原文件为 index.html.bak"

# 替换BUILTIN数据
# 注意：这需要手动编辑HTML，脚本只是辅助
echo ""
echo "⚠️  请手动完成以下步骤："
echo "1. 打开 index.html"
echo "2. 找到 'const BUILTIN={...}' 部分"
echo "3. 将以下数据复制替换："
echo ""
echo "const BUILTIN=$BACKUP_DATA;"
echo ""
echo "4. 保存文件"
echo "5. 运行 deploy.bat 或 deploy.sh 重新部署"
echo ""
echo "或者直接访问网站，使用 '📂 导入' 功能导入数据"
