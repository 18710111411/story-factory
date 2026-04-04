# AI Video Creator - 独立运行模式

## 🚀 独立 Agent 配置

本配置让 AI Video Creator 作为独立子代理运行，与主会话隔离。

---

## 📁 运行方式

### 方式 1: 作为子代理启动
```bash
# 从主会话 spawn 子代理
openclaw sessions spawn \
  --runtime subagent \
  --label ai-video-creator \
  --task "执行 AI 视频创作工作流" \
  --cwd /home/admin/.openclaw/workspace/agents/ai-video-creator
```

### 方式 2: 独立会话
```bash
# 创建独立会话
openclaw sessions create --name ai-video-creator

# 在会话中运行
cd /home/admin/.openclaw/workspace/agents/ai-video-creator
```

### 方式 3: Cron 定时任务
```bash
# 添加定时任务 (示例：每天检查视频生成进度)
openclaw cron add --schedule "0 9 * * *" \
  --command "cd /home/admin/.openclaw/workspace/agents/ai-video-creator && check-progress.sh"
```

---

## 🔧 独立配置文件

创建 `.env` 文件存放敏感信息：

```bash
# /home/admin/.openclaw/workspace/agents/ai-video-creator/.env
MUAPI_API_KEY=your_muapi_key_here
JIMENG_API_KEY=your_jimeng_key_here
VIDEO_API_KEY=your_video_api_key_here
PROJECT_DIR=/home/admin/.openclaw/workspace/projects
LOG_LEVEL=info
```

---

## 📝 独立运行脚本

### check-progress.sh - 检查项目进度
```bash
#!/bin/bash
# 检查所有项目进度

PROJECT_DIR="/home/admin/.openclaw/workspace/projects"

echo "=== AI Video Creator - 项目进度 ==="
echo ""

for project in $PROJECT_DIR/*/; do
    if [ -f "$project/metadata.json" ]; then
        name=$(basename "$project")
        status=$(cat "$project/metadata.json" | grep -o '"status": "[^"]*"' | head -1)
        echo "📁 $name: $status"
    fi
done

echo ""
echo "=== 完成 ==="
```

### generate-video.sh - 触发视频生成
```bash
#!/bin/bash
# 触发指定项目的视频生成

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo "用法：generate-video.sh <项目名称>"
    exit 1
fi

PROJECT_DIR="/home/admin/.openclaw/workspace/projects/$PROJECT_NAME"

if [ ! -d "$PROJECT_DIR" ]; then
    echo "错误：项目 $PROJECT_NAME 不存在"
    exit 1
fi

echo "开始生成项目：$PROJECT_NAME"
echo "项目目录：$PROJECT_DIR"

# 检查前置条件
if [ ! -f "$PROJECT_DIR/05_prompts.md" ]; then
    echo "错误：提示词文件不存在，请先完成前期制作"
    exit 1
fi

# 调用 AI Video Creator Agent
echo "调用 AI Video Creator Agent..."
# 这里可以调用具体的生成命令

echo "生成完成"
```

---

## 📊 独立日志

日志文件位置：
```
/home/admin/.openclaw/workspace/agents/ai-video-creator/logs/
├── agent.log          # Agent 运行日志
├── projects.log       # 项目操作日志
└── errors.log         # 错误日志
```

查看日志：
```bash
# 实时查看日志
tail -f /home/admin/.openclaw/workspace/agents/ai-video-creator/logs/agent.log

# 查看错误
cat /home/admin/.openclaw/workspace/agents/ai-video-creator/logs/errors.log
```

---

## 🎯 与主会话通信

### 方式 1: 文件通知
```bash
# Agent 写入状态文件
echo "completed" > /tmp/ai-video-status

# 主会话检查
cat /tmp/ai-video-status
```

### 方式 2: Session 消息
```bash
# 子代理发送消息到主会话
openclaw sessions send --label main --message "视频生成完成"
```

### 方式 3: Webhook (高级)
```json
// config.json 中添加
{
  "webhook": {
    "on_complete": "http://localhost:18955/webhook/video-done",
    "on_error": "http://localhost:18955/webhook/video-error"
  }
}
```

---

## 📋 独立运行检查清单

- [ ] 创建独立 `.env` 文件
- [ ] 配置 API Keys
- [ ] 设置日志目录
- [ ] 测试运行脚本
- [ ] 配置与主会话的通信方式
- [ ] 设置权限 (chmod +x *.sh)

---

## 🎊 独立运行优势

1. **隔离性**: 不占用主会话上下文
2. **持续性**: 可长时间运行视频生成任务
3. **并发性**: 可同时处理多个项目
4. **可监控**: 独立日志便于排查问题
5. **可调度**: 可设置定时任务

---

*独立运行配置 v1.0 | 创建：2026-04-02*
