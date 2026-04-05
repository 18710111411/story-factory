#!/bin/bash

# 故事工厂导出工具
# 调用 InkOS Skill 进行 EPUB/Markdown 导出

set -e

BOOK_NAME="$1"
FORMAT="${2:-epub}"
OUTPUT_DIR="${3:-./exports}"

if [ -z "$BOOK_NAME" ]; then
    echo "用法：./export.sh <书名> [格式] [输出目录]"
    echo "格式：epub/md/txt (默认 epub)"
    exit 1
fi

echo "📚 故事工厂导出工具"
echo "=================="
echo "书名：$BOOK_NAME"
echo "格式：$FORMAT"
echo "输出：$OUTPUT_DIR"
echo ""

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 调用 InkOS 导出
echo "正在调用 InkOS 导出..."
inkos export "$BOOK_NAME" --format "$FORMAT" --output "$OUTPUT_DIR"

echo ""
echo "✅ 导出完成！"
echo "文件位置：$OUTPUT_DIR"
