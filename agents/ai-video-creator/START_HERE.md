# 🚀 AI Video Creator - 快速启动

## ✅ 已完成配置

- [x] Agent 文档创建 (AGENT.md, workflow.md, prompts.md, quickstart.md)
- [x] 配置文件创建 (config.json)
- [x] 项目目录创建 (projects/)
- [x] 项目模板创建 (template/metadata.json)
- [x] 示例项目创建 (example-ad/)

---

## 📋 下一步行动

### 1️⃣ 配置 API Keys (必须)

编辑配置文件：
```bash
nano /home/admin/.openclaw/workspace/agents/ai-video-creator/config.json
```

替换以下占位符：
- `YOUR_MUAPI_KEY_HERE` → 你的 muapi.ai API Key
- `YOUR_JIMENG_KEY_HERE` → 你的即梦 API Key
- `YOUR_VIDEO_API_KEY_HERE` → 你的视频生成 API Key

**获取 API Key**:
- muapi.ai: https://muapi.ai/
- 即梦 (Jimeng): https://jimeng.doubao.com/
- 视频生成：根据选择的 provider 配置

---

### 2️⃣ 测试工作流 (推荐)

#### 方式 A: 使用示例项目

```bash
# 查看示例项目
cat /home/admin/.openclaw/workspace/projects/example-ad/01_screenplay.md
cat /home/admin/.openclaw/workspace/projects/example-ad/02_art_direction.md

# 复制示例项目开始创作
cp -r /home/admin/.openclaw/workspace/projects/example-ad \
      /home/admin/.openclaw/workspace/projects/my-first-ad
```

#### 方式 B: 从头开始

```bash
# 创建新项目
mkdir -p /home/admin/.openclaw/workspace/projects/{项目名称}

# 复制模板
cp /home/admin/.openclaw/workspace/projects/template/metadata.json \
   /home/admin/.openclaw/workspace/projects/{项目名称}/
```

---

### 3️⃣ 开始第一个项目

**简单模式** (推荐新手):
```
用户：帮我创作一个 30 秒的智能手表广告
产品：智能手表
核心卖点：全天候健康监测
风格：赛博朋克
```

**协作模式** (推荐专业用户):
```
用户：我想制作一个产品广告，我们一起创作

Agent 将分步引导：
1. 创意简报 → 确认
2. 剧本创作 → 修改 → 确认
3. 艺术指导 → 选择 → 确认
4. 分镜设计 → 调整 → 确认
5. 镜头设计 → 审阅 → 确认
6. 提示词生成 → 审核 → 确认
7. 视频生成 → 确认
8. 后期制作 → 验收
```

---

## 📁 项目文件结构

```
projects/
  {项目名称}/
    metadata.json          # 项目元数据
    01_screenplay.md       # 剧本
    02_art_direction.md    # 艺术指导
    03_storyboard/         # 分镜文件
    04_shot_design.md      # 镜头设计
    05_prompts.md          # AI 提示词
    06_raw_video/          # 原始视频
    07_final/              # 最终成片
```

---

## 🎯 使用检查清单

### 开始前
- [ ] API Keys 已配置
- [ ] 项目目录已创建
- [ ] 了解工作流 7 个阶段

### 第一阶段 (剧本)
- [ ] 创意简报清晰
- [ ] 剧本结构完整 (三幕)
- [ ] 时长符合要求

### 第二阶段 (艺术指导)
- [ ] 色彩方案明确
- [ ] 视觉参考具体
- [ ] 情感基调匹配

### 第三阶段 (分镜)
- [ ] 镜头数量合理 (30 秒≈6-8 镜头)
- [ ] 镜头序列连贯
- [ ] 每个镜头有时长标注

### 第四阶段 (镜头设计)
- [ ] 摄像机运动明确
- [ ] 灯光设计具体
- [ ] 镜头效果指定

### 第五阶段 (提示词)
- [ ] 包含所有必要元素
- [ ] 针对 AI 模型优化
- [ ] 物理逻辑清晰

### 第六阶段 (视频生成)
- [ ] 选择合适的 AI 模型
- [ ] 监控生成进度
- [ ] 检查视频质量

### 第七阶段 (后期)
- [ ] 剪辑流畅
- [ ] 调色统一
- [ ] 字幕准确
- [ ] 导出格式正确

---

## 🆘 常见问题

### Q: 没有 API Key 可以使用吗？
A: 可以手动执行部分阶段（如剧本创作、分镜设计），但视频生成需要 API。

### Q: 可以先测试再生成完整视频吗？
A: 建议！先生成 5 秒测试片段，确认风格后再完整生成。

### Q: 视频质量不佳怎么办？
A: 
1. 优化提示词（添加更多细节）
2. 更换 AI 模型
3. 使用 video-edit 后期增强

### Q: 如何保存项目进度？
A: 每个阶段自动保存到项目目录，metadata.json 记录状态。

---

## 📞 文档索引

| 文档 | 用途 |
|------|------|
| README.md | 总览和快速参考 |
| AGENT.md | Agent 架构和设计理念 |
| workflow.md | 详细工作流说明 |
| prompts.md | 提示词模板库 |
| quickstart.md | 5 分钟快速上手 |
| START_HERE.md | 本文件 - 启动指南 |

---

## 🎊 准备就绪！

你现在可以开始创作第一个 AI 视频了！

**推荐起点**:
```
用户：帮我创作一个 30 秒的{风格}{主题}视频
```

例如：
- "帮我创作一个 30 秒的赛博朋克风格智能手表广告"
- "帮我创作一个 2 分钟的科幻短片，关于孤独宇航员"
- "帮我创作一个 15 秒的 TikTok 激励视频"

---

*快速启动指南 v1.0 | 创建：2026-04-02*
