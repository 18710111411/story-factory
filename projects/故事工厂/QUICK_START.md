# 故事工厂 v2.0 - 快速开始

---

## 🚀 5 分钟开始创作

### 第 1 步：复制模板

```bash
cd /home/admin/.openclaw/workspace/projects/故事工厂/05_作品管理
cp -r 模板书 我的第一本小说
```

### 第 2 步：填写创作控制

编辑以下文件：

1. **story/author_intent.md** - 作者意图（长期目标）
2. **story/current_focus.md** - 当前焦点（最近 1-3 章）
3. **story/book_rules.md** - 创作规则（题材 + 禁令）

### 第 3 步：填写章节意图

编辑 `story/runtime/chapter-0001.intent.md`：
- 本章目标
- 必须保留/避免的内容
- 场景规划
- 本章钩子

### 第 4 步：开始写作

使用我们的**续写工具模板**生成正文：
- 字数：3000-5000 字
- 对话比例：20-40%
- 章末必须有钩子

### 第 5 步：自检

使用检查清单：
1. **03_检查清单/continuity_checklist.md** - 33 维度连续性检查
2. **03_检查清单/ai_detection_checklist.md** - AI 味检测
3. **03_检查清单/quality_gate.md** - 质量门禁

### 第 6 步：更新真相文件

编辑 `story/state/` 下的文件：
- `chapter_summaries.json` - 添加本章摘要
- `pending_hooks.json` - 更新伏笔状态
- `character_matrix.json` - 更新角色状态

### 第 7 步：导出（可选）

```bash
cd /home/admin/.openclaw/workspace/projects/故事工厂/06_导出工具
chmod +x export.sh
./export.sh "我的第一本小说" epub
```

---

## 📋 日常写作流程

```
更新 current_focus.md
    ↓
填写 chapter-XXXX.intent.md
    ↓
写作（用续写模板）
    ↓
自检（用检查清单）
    ↓
更新真相文件
    ↓
重复以上步骤
```

---

## 📊 真相文件说明

| 文件 | 用途 | 更新频率 |
|------|------|---------|
| `world_state.json` | 世界设定 | 新增设定时 |
| `character_matrix.json` | 角色信息 | 每章 |
| `pending_hooks.json` | 伏笔追踪 | 每章 |
| `chapter_summaries.json` | 章节摘要 | 每章 |
| `resource_ledger.json` | 资源账本 | 资源变化时 |
| `emotional_arcs.json` | 情感弧线 | 情感戏后 |
| `subplot_board.json` | 支线进度 | 支线推进时 |

---

## 📝 润色工具

| 工具 | 用途 | 使用时机 |
|------|------|---------|
| `polish_tool.md` | 润色/去 AI 味 | 初稿完成后 |
| `expand_tool.md` | 扩写（大纲→正文） | 只有大纲时 |
| `sensitive_words.md` | 敏感词检测 | 发布前 |

---

## 🎯 与 InkOS 的配合

| 场景 | 使用工具 |
|------|---------|
| 日常写作 | 故事工厂 |
| 连续性检查 | 故事工厂检查清单 |
| 伏笔追踪 | 故事工厂真相文件 |
| EPUB 导出 | InkOS (`inkos export`) |
| 书籍管理 | InkOS (`inkos book create/list`) |
| 市场扫描 | InkOS (`inkos radar scan`) |

---

## 📖 题材规则

- **玄幻**: `04_题材规则/xuanhuan.md`
- **都市**: `04_题材规则/urban.md`
- **言情**: `04_题材规则/yanqing.md`
- **自定义**: `04_题材规则/custom.md`

---

开始创作吧！📝
