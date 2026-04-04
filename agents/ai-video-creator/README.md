# 🎬 AI Video Creator Agent

**专属 AI 视频创作智能体** - 从剧本到成片的完整电影制作流程

---

## 🚀 快速开始

```bash
# 查看 Agent 状态
ls -la /home/admin/.openclaw/workspace/agents/ai-video-creator/

# 查看快速开始指南
cat quickstart.md

# 查看工作流
cat workflow.md

# 查看提示词模板
cat prompts.md
```

---

## 📁 文件结构

```
ai-video-creator/
├── AGENT.md          # Agent 核心定义
├── workflow.md       # 7 步工作流详解
├── prompts.md        # 提示词模板库
├── quickstart.md     # 快速开始指南
└── config.json       # 配置文件 (需创建)
```

---

## 🎯 工作流概览

```
创意 → 剧本 → 导演 (1) → 分镜 → 导演 (2) → 提示词 → 视频生成 → 后期 → 输出
        ↓         ↓         ↓         ↓         ↓          ↓         ↓
      剧本创作  艺术指导  分镜设计  镜头设计  Prompt 工程  AI 生成   剪辑调色
```

---

## 🛠️ 已安装技能

| 阶段 | 技能 | 状态 |
|------|------|------|
| 剧本创作 | cinematic-script-writer | ✅ |
| 艺术指导 | muapi-cinema-director | ✅ |
| 分镜设计 | seedance2-storyboard-generator | ✅ |
| 镜头设计 | seedance-shot-design | ✅ |
| 提示词工程 | muapi-cinema-director + seedance-shot-design | ✅ |
| 视频生成 | image-to-video + ai-video-workflow | ✅ |
| 后期制作 | video-edit + srt-proofreader | ✅ |

---

## 📝 使用示例

### 快速创作
```
用户：帮我创作一个 30 秒的赛博朋克风格产品广告

Agent 将自动执行 7 步流程，输出完整视频
```

### 分步协作
```
用户：我想制作一个关于"孤独宇航员"的 2 分钟短片

Agent 将分步引导，每个阶段等待确认
```

### 单阶段任务
```
用户：请帮我把这个剧本转成分镜

Agent 仅执行分镜设计阶段
```

---

## ⚙️ 配置

创建 `config.json`:

```json
{
  "muapi": { "api_key": "YOUR_KEY" },
  "seedance": { "api_key": "YOUR_KEY" },
  "video_generation": { "api_key": "YOUR_KEY" },
  "preferences": {
    "default_duration": 30,
    "default_resolution": "1920x1080",
    "default_fps": 24
  }
}
```

---

## 📊 项目统计

- **创建日期**: 2026-04-02
- **版本**: 1.0.0
- **工作流阶段**: 7 个
- **使用技能**: 9 个
- **文档文件**: 4 个

---

## 🎓 学习资源

1. **AGENT.md** - 了解 Agent 架构和设计理念
2. **workflow.md** - 详细的工作流说明和质量检查点
3. **prompts.md** - 完整的提示词模板库
4. **quickstart.md** - 5 分钟快速上手指南

---

## 🆘 获取帮助

```bash
# 查看技能列表
clawhub list | grep -E "cinema|storyboard|video|script"

# 检查技能状态
clawhub inspect muapi-cinema-director

# 更新技能
clawhub update --all
```

---

*AI Video Creator Agent v1.0.0 | Created 2026-04-02*
