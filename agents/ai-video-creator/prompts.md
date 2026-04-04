# AI Video Creator - 提示词模板库

## 导演 (1) - 艺术指导提示词

### 视觉风格定位
```
作为艺术总监，请为以下剧本定义视觉风格：

剧本主题：{theme}
情感基调：{emotion}
目标受众：{audience}

请提供：
1. 色彩方案 (主色/辅色/强调色)
2. 光影风格 (高调/低调/对比度)
3. 构图偏好 (对称/不对称/规则)
4. 视觉参考 (电影/摄影/艺术作品)
5. 美学关键词 (3-5 个)
```

### 情感基调映射
```
将以下情感转化为视觉语言：

情感：{emotion}

请指定：
- 色温 (冷/暖/中性)
- 饱和度 (高/中/低)
- 对比度 (高/中/低)
- 镜头滤镜 (如有)
- 典型 lighting setup
```

---

## 导演 (2) - 镜头设计提示词

### 单个镜头设计
```
作为现场导演，请设计以下镜头：

场景描述：{scene_description}
情感意图：{emotional_intent}
在剧本中的位置：{script_position}

请提供：
1. 镜头类型 (ECU/CU/MS/FS/EWS)
2. 摄像机角度 (高/平/低/荷兰角)
3. 摄像机运动 (Dolly/Truck/Crane/Orbit/Pan/Tilt)
4. 镜头效果 (DOF/Anamorphic/Rack Focus)
5. 灯光设计 (key light/fill light/back light)
6. 时长 (秒)
```

### 动作场景镜头设计
```
设计以下动作场景的镜头序列：

动作描述：{action_description}
节奏：{pace} (快/中/慢)

请设计：
- 建立镜头 (establishing shot)
- 主动作镜头 (main action)
- 细节镜头 (insert shots)
- 反应镜头 (reaction shots)
- 每个镜头的摄像机运动
- 转场方式
```

---

## AI 视频生成提示词

### 通用提示词模板 (muapi-cinema-director 协议)
```
[Shot Type] + [Subject/Action] + [Environment] + [Lighting] + [Camera Movement] + [Lens Effect]

示例：
Close-Up of a weary samurai, rain dripping from his helmet, 
standing in a bamboo forest at dusk, 
volumetric fog filtering through bamboo stalks, 
slow Dolly In with shallow depth of field, 
anamorphic lens flares, 
cinematic color grading with teal and orange tones, 
24fps, 2.39:1 aspect ratio
```

### 提示词优化检查清单
```
在生成提示词前，确保包含：

□ 镜头类型 (Shot Type)
□ 主体/动作 (Subject/Action)
□ 环境描述 (Environment)
□ 灯光设计 (Lighting)
□ 摄像机运动 (Camera Movement)
□ 镜头效果 (Lens Effect)
□ 技术参数 (fps/aspect ratio)
□ 物理逻辑描述 (光线关系/材质反射等)
□ 情感/氛围词
□ 风格参考 (可选)
```

### 不同 AI 模型的提示词偏好

#### Veo3 (高质量美学)
```
强调：
- 详细的环境描述
- 光影关系
- 材质质感
- 慢节奏运动
- 电影感构图

示例关键词：
cinematic, atmospheric, volumetric lighting, 
film grain, color graded, anamorphic
```

#### Kling (复杂动作)
```
强调：
- 清晰的动作描述
- 物理逻辑
- 角色运动细节
- 连续动作分解

示例关键词：
fluid motion, realistic physics, 
character animation, dynamic action
```

#### Luma (快节奏)
```
强调：
- 简洁有力的描述
- 快速剪辑感
- 高能量场景
- 视觉冲击力

示例关键词：
high energy, fast paced, dynamic, 
impactful, bold visuals
```

---

## 分镜描述模板

### 单格分镜
```
分镜编号：SC-{场景号}-SH-{镜头号}
镜头类型：{类型}
时长：{秒}

画面描述：
{详细的视觉描述，包括主体位置/背景/前景}

摄像机：
- 角度：{角度}
- 运动：{运动}
- 焦距：{焦距}

灯光：
- 主光：{位置和强度}
- 辅光：{位置和强度}
- 背光：{位置和强度}

备注：
{特殊效果/注意事项}
```

---

## 剧本格式模板

### 标准电影剧本格式
```
场景 {场景号}
{场景标题：内/外。地点。时间}

{场景描述}
{动作描述，现在时态}

                    {角色名}
          {对话内容}

                    {角色名}
          { parenthetical: 语气/动作 }
          {对话内容}

转场：{转场方式}
```

---

## 质量评估提示词

### 剧本评估
```
请评估以下剧本：

评估维度：
1. 结构 (三幕是否清晰)
2. 角色 (动机是否明确)
3. 对话 (是否自然)
4. 视觉性 (是否适合影像化)
5. 节奏 (张弛是否得当)

评分：1-5 星
改进建议：3 条具体建议
```

### 视频质量评估
```
请评估生成的视频：

评估维度：
1. 画面质量 (清晰度/伪影)
2. 动作流畅度
3. 与提示词的一致性
4. 情感表达
5. 技术执行

评分：1-5 星
是否需要重新生成：是/否
如需重生成，请指定改进方向
```

---

## 项目元数据模板

```json
{
  "project_id": "{uuid}",
  "project_name": "{name}",
  "created_at": "{iso_timestamp}",
  "updated_at": "{iso_timestamp}",
  "creative_brief": {
    "theme": "",
    "duration_seconds": 0,
    "style_reference": "",
    "emotional_tone": "",
    "target_audience": ""
  },
  "stages": {
    "screenplay": { "status": "", "file": "" },
    "art_direction": { "status": "", "file": "" },
    "storyboard": { "status": "", "file": "" },
    "shot_design": { "status": "", "file": "" },
    "prompts": { "status": "", "file": "" },
    "video_generation": { "status": "", "file": "" },
    "post_production": { "status": "", "file": "" }
  },
  "output": {
    "final_video": "",
    "duration": 0,
    "resolution": "",
    "format": ""
  },
  "iterations": [],
  "notes": ""
}
```
