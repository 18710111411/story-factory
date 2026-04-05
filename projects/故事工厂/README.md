# 故事工厂 v2.0

**融合 InkOS 核心设计** · **日常写作优先** · **真相文件驱动**

---

## 🎯 系统定位

| 场景 | 使用工具 | 说明 |
|------|---------|------|
| 日常写作 | 故事工厂模板 | 续写/润色/大纲 |
| 连续性检查 | 故事工厂检查清单 | 33 维度人工审阅 |
| 伏笔追踪 | 故事工厂真相文件 | JSON 状态管理 |
| EPUB 导出 | InkOS Skill | `inkos export` |
| 书籍管理 | InkOS Skill | `inkos book create/list` |
| 题材规则 | 故事工厂题材库 | 内置 + 自定义 |

---

## 📁 文件结构

```
故事工厂/
├── 01_真相文件模板/          # InkOS 核心设计
│   ├── world_state.json      # 世界状态
│   ├── character_matrix.json # 角色矩阵
│   ├── pending_hooks.json    # 伏笔追踪
│   ├── chapter_summaries.json# 章节摘要
│   ├── resource_ledger.json  # 资源账本
│   ├── emotional_arcs.json   # 情感弧线
│   └── subplot_board.json    # 支线进度板
│
├── 02_创作控制/              # 作者意图管理
│   ├── author_intent.md      # 长期意图
│   ├── current_focus.md      # 当前焦点
│   ├── book_rules.md         # 创作规则
│   └── chapter_intent.md     # 章节意图模板
│
├── 03_检查清单/              # 连续性审计
│   ├── continuity_checklist.md   # 33 维度检查
│   ├── ai_detection_checklist.md # AI 味检测
│   └── quality_gate.md           # 质量门禁
│
├── 04_题材规则/              # 题材专属规则
│   ├── xuanhuan.md           # 玄幻
│   ├── xianxia.md            # 仙侠
│   ├── urban.md              # 都市
│   ├── yanqing.md            # 言情
│   └── custom.md             # 自定义
│
├── 05_作品管理/              # 作品存储
│   └── [书名]/
│       ├── story/
│       │   ├── state/        # 真相文件
│       │   ├── author_intent.md
│       │   ├── current_focus.md
│       │   ├── book_rules.md
│       │   └── runtime/      # 章节意图
│       └── chapters/         # 章节正文
│
├── 06_导出工具/              # 导出脚本
│   └── export_to_epub.sh     # 调用 InkOS
│
└── README.md                 # 本文档
```

---

## 🚀 使用流程

### 日常写作流程

```
1. 更新 current_focus.md（当前焦点）
   ↓
2. 填写 chapter_intent.md（章节意图）
   ↓
3. 用续写模板生成正文
   ↓
4. 用检查清单自检
   ↓
5. 更新真相文件
   ↓
6. 重复 1-5 继续下一章
```

### 特殊需求流程

```
需要 EPUB 导出？
  → inkos export <book-id> --format epub

需要书籍管理？
  → inkos book create/list/delete

需要市场扫描？
  → inkos radar scan
```

---

## 📊 真相文件说明

### 7 个核心真相文件

| 文件 | 用途 | 更新频率 |
|------|------|---------|
| `world_state.json` | 世界设定、地点、势力 | 新增设定时 |
| `character_matrix.json` | 角色信息、关系网 | 每章更新 |
| `pending_hooks.json` | 未回收伏笔 | 每章更新 |
| `chapter_summaries.json` | 章节摘要 | 每章完成 |
| `resource_ledger.json` | 物品/金钱/资源 | 资源变化时 |
| `emotional_arcs.json` | 角色情感变化 | 情感戏后 |
| `subplot_board.json` | 支线剧情进度 | 支线推进时 |

---

## 📋 检查清单

### 33 维度连续性检查

- ✅ 角色一致性（4 项）
- ✅ 资源连续性（3 项）
- ✅ 伏笔管理（3 项）
- ✅ 情节逻辑（4 项）
- ✅ 叙事节奏（4 项）
- ✅ 对话质量（3 项）
- ✅ 文笔检查（4 项）
- ✅ 字数检查（2 项）
- ✅ 题材规则（6 项）

### AI 味检测

- ✅ 重复用词检测
- ✅ 句式单调检测
- ✅ 过度总结检测
- ✅ 禁用词表检查

---

## 🔧 与 InkOS 的边界

| 功能 | 故事工厂 | InkOS Skill |
|------|---------|-------------|
| 正文生成 | ✅ 模板 + 你的 API | ❌ API 不兼容 |
| 文章润色 | ✅ 润色工具 + 去 AI 味 | ❌ 需要 API |
| 扩写/缩写 | ✅ 扩写工具 | ❌ 需要 API |
| 敏感词检测 | ✅ 检测清单 | ❌ 需要 API |
| 真相文件 | ✅ JSON 结构 | ⚠️ 可借用 CLI |
| 连续性检查 | ✅ 检查清单 | ❌ 需要 API |
| 伏笔追踪 | ✅ JSON 管理 | ⚠️ 可借用结构 |
| 书籍管理 | ⚠️ 手动 | ✅ CLI 命令 |
| EPUB 导出 | ❌ 无 | ✅ `inkos export` |
| 题材规则 | ✅ 内置 | ✅ `inkos genre` |
| 市场扫描 | ❌ 无 | ✅ `inkos radar` |

---

## 💡 核心设计原则

1. **真相文件是唯一事实来源** - 所有设定以 JSON 为准
2. **写前先规划** - 填写章节意图再生成正文
3. **写完必检查** - 用检查清单自检
4. **及时更新** - 每章完成后更新真相文件
5. **优先本地** - 日常操作用故事工厂，特殊需求用 InkOS

---

**版本**: v2.0  
**创建日期**: 2026-04-06  
**融合来源**: InkOS v1.1.0 核心设计
