#!/bin/bash
# AI Video Creator - 项目进度检查脚本

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="/home/admin/.openclaw/workspace/projects"
LOG_FILE="$SCRIPT_DIR/logs/progress.log"

# 创建日志目录
mkdir -p "$SCRIPT_DIR/logs"

# 日志函数
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "=== AI Video Creator - 项目进度检查 ==="
log ""

# 检查项目
project_count=0
completed_count=0
in_progress_count=0

for project in "$PROJECT_DIR"/*/; do
    if [ -f "$project/metadata.json" ]; then
        project_count=$((project_count + 1))
        name=$(basename "$project")
        
        # 读取状态
        status=$(grep -o '"status": "[^"]*"' "$project/metadata.json" | head -1 | cut -d'"' -f4)
        
        # 读取阶段状态
        screenplay=$(grep -A1 '"screenplay"' "$project/metadata.json" | grep status | grep -o '"[^"]*"$' | tr -d '"')
        art_dir=$(grep -A1 '"art_direction"' "$project/metadata.json" | grep status | grep -o '"[^"]*"$' | tr -d '"')
        video_gen=$(grep -A1 '"video_generation"' "$project/metadata.json" | grep status | grep -o '"[^"]*"$' | tr -d '"')
        
        log "📁 项目：$name"
        log "   总状态：$status"
        log "   剧本：$screenplay | 艺术指导：$art_dir | 视频生成：$video_gen"
        
        if [ "$status" = "completed" ]; then
            completed_count=$((completed_count + 1))
        elif [ "$status" = "in_progress" ]; then
            in_progress_count=$((in_progress_count + 1))
        fi
        
        log ""
    fi
done

log "=== 统计 ==="
log "总项目数：$project_count"
log "已完成：$completed_count"
log "进行中：$in_progress_count"
log "等待中：$((project_count - completed_count - in_progress_count))"
log ""
log "=== 检查完成 ==="

# 输出摘要到状态文件
cat > /tmp/ai-video-status.json << EOF
{
  "timestamp": "$(date -Iseconds)",
  "total_projects": $project_count,
  "completed": $completed_count,
  "in_progress": $in_progress_count,
  "pending": $((project_count - completed_count - in_progress_count))
}
EOF

log "状态已写入：/tmp/ai-video-status.json"
