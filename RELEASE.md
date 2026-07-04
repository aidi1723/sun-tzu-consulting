# 孙子兵法咨询引擎 Skill 发布说明

当前版本：v1.1

## 项目简介

`sun-tzu-consulting` 是一个基于《孙子兵法》“五事七计”的咨询行业战略审计 Skill。它面向企业战略、市场进入、并购评估、业务转型和组织健康度扫描，帮助 Agent 生成可审计的战略可行性判断、风险预警和 L2 破局交接。

## 设计目标

- 将《孙子兵法》的宏观战略判断转译为现代咨询评估框架
- 通过统一 schema 接收企业战略问题
- 输出五维评分、雷达图数据、胜率判断、风险预警和行动建议
- 与 `thirty-six-strategies` 形成 L1 宏观审计 + L2 战术破局的双核工作流
- 保持无状态、可嵌入、可被其他 Agent 或 SaaS 网关调用

## 能力范围

- 市场进入与新业务立项
- 并购、投资和资产重组评估
- AI、SaaS、线上化等转型可行性判断
- 企业战略健康度体检
- 董事会级战略风险预警
- L1 否定原方案后的 L2 破局交接

## 目录说明

- `SKILL.md`：Skill 入口、触发说明、推理流程、输出格式和质量标准
- `references/assessment-framework.md`：五事七计评分框架与风险分层
- `references/schema.md`：Function Calling / JSON Schema
- `references/workflow-handoff.md`：与 `thirty-six-strategies` 的 L1→L2 调度协议
- `references/examples.md`：典型咨询场景示例
- `agents/openai.yaml`：Codex/Agent UI 元数据
- `README.md`：GitHub 项目介绍与快速调用说明
- `DEVELOPMENT.md`：维护、校验和发布流程

## 使用方式

在调用时提供以下核心信息：

- 客户行业与区域
- 计划执行的重大战略
- 当前资金、人才、技术、品牌、数据、渠道与组织能力
- 宏观周期、政策、资本和技术趋势
- 竞争格局、进入壁垒和渠道控制者
- 时间窗口与风险底线

Skill 会输出：

1. 战略诊断
2. 五事审计
3. 雷达图数据
4. 胜率判断
5. 关键风险预警
6. 分阶段建议行动
7. L2 破局交接 payload

## GitHub Release 摘要

> `sun-tzu-consulting` 是一个基于《孙子兵法》“五事七计”的 L1 宏观战略咨询 Skill，适用于市场进入、并购评估、业务转型、商业模式验证和组织健康度扫描。该版本提供标准化输入 schema、五维评分框架、雷达图数据输出，以及与 `thirty-six-strategies` 的 L2 战术破局交接协议，可作为咨询 SaaS 或 AgentCore OS 的战略审计模块接入。

## 版本说明

### v1.1

发布后可用化与验证增强版本：

- 修复并固化 L1 到 `thirty-six-strategies` 的 handoff 字段契约。
- 新增 `scripts/validate.rb`，校验 frontmatter、Markdown、YAML、JSON schema、L2 字段兼容性和 handoff JSON 示例。
- 保留并运行隐私扫描，避免本机路径和环境信息泄露到公开仓库。
- 新增 MIT License、README 安装说明、`CLOSEOUT.md` 和 `FINAL_REPORT.md`。
- 完成 GitHub 安装验证，确认可通过 Codex skill installer 安装。
- 明确后续维护规则：不移动 `v1.0`，后续功能和维护更新使用新版本标签。

### v1.0

- 主要内容：基础 Skill 结构、五事七计评估框架、调用 schema、L1→L2 工作流交接、典型咨询案例和开发文档

## 注意事项

- 本 Skill 仅用于合法、合规、可执行的战略分析
- 不应将其用于欺诈、胁迫、隐私侵犯、违法裁员、市场操纵或虚假融资叙事
- 复杂法务、财务、劳动用工、教育监管、医疗合规、金融监管和数据安全场景应结合专业审核
