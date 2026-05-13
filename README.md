# 孙子兵法咨询引擎 Skill

`sun-tzu-consulting` 是一个面向咨询行业的 L1 宏观战略审计 Skill。它把《孙子兵法》的“五事七计”转译为现代管理咨询评估框架，用于判断企业战略是否值得推进、需要试点、应当重构，或必须否定。

它与 [`thirty-six-strategies`](https://github.com/aidi1723/thirty-six-strategies) 形成双核咨询工作流：

- `sun-tzu-consulting`：L1 宏观战略审计，回答“该不该做、胜算几何、风险在哪”。
- `thirty-six-strategies`：L2 微观破局方案，回答“怎么做、怎么赢、怎么撤退”。

## 适用场景

- 市场进入策略
- 并购与投资评估
- 企业转型可行性判断
- AI、SaaS、线上化等新业务立项
- 商业模式验证
- 组织健康度与战略落地能力扫描
- 董事会级风险预警报告

## 核心框架

Skill 会从五个维度进行咨询式审计：

| 维度 | 咨询转译 | 关键问题 |
| --- | --- | --- |
| 道 | Vision & Alignment | 愿景、客户价值、商业模式和市场需求是否对齐 |
| 天 | Macro & Timing | 宏观周期、政策、资本、技术和客户时机是否有利 |
| 地 | Market Terrain & Barriers | 竞争格局、渠道、壁垒、利润池和可防守位置是否清晰 |
| 将 | Team DNA & Leadership | 团队能力、领导力、激励和人才密度是否匹配战略 |
| 法 | Organization & SOP | 组织、治理、KPI、流程、数据和合规是否支撑落地 |

输出包含五维评分、雷达图数据、胜率判断、关键风险预警、行动建议，以及必要时对 `thirty-six-strategies` 的 L2 交接 payload。

## 目录结构

```text
sun-tzu-consulting/
├── SKILL.md
├── README.md
├── DEVELOPMENT.md
├── RELEASE.md
├── agents/
│   └── openai.yaml
└── references/
    ├── assessment-framework.md
    ├── examples.md
    ├── schema.md
    └── workflow-handoff.md
```

## 快速调用

```text
Use $sun-tzu-consulting to audit this strategic initiative:

client_industry: 传统线下教育机构
strategic_initiative: 投入 500 万研发 AI 辅导 APP 并转型线上
internal_resources: 本地校区、教师资源、题库、家长信任，但缺少 AI 产品团队
risk_tolerance: 不能在 12 个月内烧掉全部现金储备，不能触碰教育监管红线
```

## Function Calling Schema

集成到 Agent、SaaS 或 API 网关时，使用 `references/schema.md` 中的 `consulting_macro_audit` schema。

核心字段：

- `client_industry`
- `strategic_initiative`
- `internal_resources`
- `market_context`
- `competitor_landscape`
- `timeline`
- `risk_tolerance`

## 输出示例

```markdown
【战略诊断】：客户正在用线下教育资产解决线上 AI 产品战场的问题，直接自研 APP 胜率偏低。

【五事审计】：
- 道：5/10；用户需求存在，但通用 APP 缺少差异化。
- 天：4/10；AI 教育窗口存在，但监管、获客和模型成本不确定。
- 地：3/10；AI 原生团队和大平台已占据技术与流量高地。
- 将：3/10；传统线下团队缺少 AI 产品和增长 DNA。
- 法：4/10；现有 KPI 与线下经营节奏难以支撑快速迭代。

【雷达图数据】：
    {"dao":5,"tian":4,"di":3,"jiang":3,"fa":4}

【胜率判断】：否定原方案，建议重构为资产型 AI 教育解决方案。
```

## 合规边界

本 Skill 仅用于合法、合规、可审计的战略分析。不应输出欺诈、胁迫、隐私侵犯、违法裁员、市场操纵、虚假融资叙事或违反监管要求的建议。涉及教育、医疗、金融、劳动用工、数据安全、反垄断等场景时，应加入专业合规审查。

