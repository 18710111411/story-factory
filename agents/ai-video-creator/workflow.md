# AI Video Creator - 工作流配置

## 工作流定义

```yaml
name: ai-video-creator
version: 1.0.0
description: AI 视频创作完整工作流

stages:
  - id: screenplay
    name: 剧本创作
    skill: cinematic-script-writer
    input: creative_brief
    output: screenplay
    
  - id: art_direction
    name: 导演 (1) - 艺术指导
    skill: muapi-cinema-director
    input: screenplay
    output: visual_style
    
  - id: storyboard
    name: 分镜设计
    skill: seedance2-storyboard-generator
    input: screenplay + visual_style
    output: storyboard_panels
    
  - id: shot_design
    name: 导演 (2) - 镜头设计
    skill: seedance-shot-design
    input: storyboard_panels
    output: shot_specs
    
  - id: prompt_engineering
    name: 提示词生成
    skills:
      - muapi-cinema-director
      - seedance-shot-design
    input: shot_specs
    output: ai_prompts
    
  - id: video_generation
    name: 视频生成
    skills:
      - image-to-video
      - ai-video-workflow
    input: ai_prompts
    output: raw_video
    
  - id: post_production
    name: 后期制作
    skills:
      - video-edit
      - srt-proofreader
    input: raw_video
    output: final_video
```

## 阶段详情

### 阶段 1: 剧本创作
**输入**: 创意简报 (主题/时长/风格/情感)
**处理**: 
- 分析创意需求
- 生成三幕结构
- 编写场景描述和对话
**输出**: 完整剧本 (含场景编号/地点/时间/动作/对话)

### 阶段 2: 导演 (1) - 艺术指导
**输入**: 剧本
**处理**:
- 确定视觉风格 (色彩/光影/构图)
- 定义情感基调
- 创建情绪板参考
**输出**: 视觉风格文档 (含参考图/色彩方案/美学定位)

### 阶段 3: 分镜设计
**输入**: 剧本 + 视觉风格
**处理**:
- 分解剧本为镜头序列
- 绘制/描述每个分镜画面
- 标注镜头类型和时长
**输出**: 分镜面板 (含画面描述/镜头类型/时长)

### 阶段 4: 导演 (2) - 镜头设计
**输入**: 分镜面板
**处理**:
- 设计摄像机运动 (Dolly/Truck/Crane/Orbit)
- 规划灯光布置
- 指定镜头效果 (DOF/Anamorphic/Rack Focus)
**输出**: 镜头技术规格 (每个镜头的详细参数)

### 阶段 5: 提示词生成
**输入**: 镜头技术规格
**处理**:
- 转换为 AI 视频模型优化的提示词
- 应用提示词工程最佳实践
- 添加物理逻辑描述
**输出**: AI 提示词 (针对 Veo3/Kling/Luma 优化)

### 阶段 6: 视频生成
**输入**: AI 提示词
**处理**:
- 选择合适的 AI 视频模型
- 调用生成 API
- 监控生成进度
**输出**: 原始视频片段

### 阶段 7: 后期制作
**输入**: 原始视频片段
**处理**:
- 剪辑拼接
- 调色
- 添加/校对字幕
- 导出最终格式
**输出**: 成品视频

## 质量检查点

| 阶段 | 检查项 | 通过标准 |
|------|--------|----------|
| 剧本 | 结构完整 | 三幕清晰/冲突明确 |
| 艺术指导 | 风格一致 | 视觉元素协调 |
| 分镜 | 连贯性 | 镜头转换流畅 |
| 镜头设计 | 技术可行 | 运动/灯光可实现 |
| 提示词 | 完整性 | 包含所有必要元素 |
| 视频生成 | 质量 | 无伪影/时长正确 |
| 后期 | 成品 | 符合原始创意 |

## 迭代规则

- 每个阶段支持用户确认/修改
- 最多 3 次迭代 per 阶段
- 重大修改需返回上一阶段

## 项目结构

```
projects/
  {project-id}/
    01_screenplay.md
    02_art_direction.md
    03_storyboard/
    04_shot_design.md
    05_prompts.md
    06_raw_video/
    07_final/
    metadata.json
```
