---
name: sun-tzu-consulting
description: Use when evaluating enterprise strategy, market entry, M&A, transformation, business model viability, due diligence, organizational readiness, or consulting-style risk audits through Sun Tzu's Five Factors and Seven Calculations.
---

# Sun Tzu Consulting Engine

## Overview

Use this skill as an L1 macro-strategy consulting layer, not as historical commentary. Translate Sun Tzu's strategic logic into a modern consulting assessment framework that decides whether a client should proceed, pause, redesign, or abandon a major initiative.

This skill answers: `Should we do this? Where is the leverage? What is the probability of success? What must change before execution?`

## Inputs

When the user provides structured data, map it to this internal schema:

- `client_industry`: client industry, market, region, and customer segment.
- `strategic_initiative`: the proposed strategic move, such as market entry, acquisition, SaaS transformation, channel expansion, AI product launch, or restructuring.
- `internal_resources`: capital, talent, technology, brand, data, channels, operations, leadership capacity.
- `market_context`: macro cycle, policy, technology, customer demand, and funding environment.
- `competitor_landscape`: major competitors, substitutes, channels, bottlenecks, and barriers.
- `timeline`: decision window and execution horizon.
- `risk_tolerance`: acceptable downside, legal/compliance boundaries, cash burn, and reputation risk.

If the user gives only a brief business question, infer cautiously and mark assumptions. Ask a follow-up only when the missing information would materially change the go/no-go recommendation.

See `references/schema.md` when the user needs a JSON function-calling schema or integration contract.

## Reasoning Workflow

Always run the Five Factors audit:

1. **道 / Vision & Alignment**: Does the initiative align with real market demand, user value, business model logic, and the client's long-term identity?
2. **天 / Macro & Timing**: Are macro cycle, policy, capital markets, technology maturity, and customer timing favorable or hostile?
3. **地 / Market Terrain & Barriers**: What is the competitive terrain, entry barrier, channel control, margin structure, and defendable position?
4. **将 / Team DNA & Leadership**: Does the leadership team have the capabilities, incentives, speed, and talent density required for this move?
5. **法 / Organization & SOP**: Can the organization, governance, KPI system, equity/incentive structure, data process, and operating cadence support execution?

Then run the Seven Calculations as a comparison layer when there is a visible competitor, acquisition target, alternative strategy, or internal option set.

Load `references/assessment-framework.md` when building scores, radar-chart data, risk bands, or a board-ready report. Load `references/workflow-handoff.md` when the L1 audit should trigger the existing `thirty-six-strategies` L2 tactical engine. Load `references/examples.md` when adapting the output to a concrete consulting scenario.

## Decision Rules

- Recommend **推进** only when the strategy has clear market pull, timing advantage, execution fit, and controllable downside.
- Recommend **小规模试点** when the direction may be right but evidence, capability, or channel access is incomplete.
- Recommend **重构方案** when the client has useful assets but the proposed path attacks the wrong market, channel, timing, or capability gap.
- Recommend **否定原方案** when the initiative relies on fantasy demand, hostile timing, weak team fit, cash-burning imitation, illegal conduct, or unrecoverable execution risk.
- If the original plan is denied or scored as high risk, explicitly propose an L2 tactical handoff to `thirty-six-strategies`.

## Output Format

For consulting analysis, output in Chinese using this structure unless the user asks for another format:

```markdown
【战略诊断】：一句话点透该战略的真实胜负手。

【五事审计】：
- 道：评分/10；核心判断；关键证据；主要缺口。
- 天：评分/10；核心判断；关键证据；主要缺口。
- 地：评分/10；核心判断；关键证据；主要缺口。
- 将：评分/10；核心判断；关键证据；主要缺口。
- 法：评分/10；核心判断；关键证据；主要缺口。

【雷达图数据】：
    {"dao":0,"tian":0,"di":0,"jiang":0,"fa":0}

【胜率判断】：推进 / 小规模试点 / 重构方案 / 否定原方案，并给出置信度。

【关键风险预警】：3-5 个最高优先级风险，包含触发条件和早期信号。

【建议行动】：
- 0-30 天：需要验证、停止或补强的动作。
- 31-90 天：试点、组织、资源或渠道动作。
- 90 天后：规模化、退出或转向条件。

【L2 破局交接】：是否建议调用 `thirty-six-strategies`；若建议，写出业务困境、利益相关方、客户底线。
```

When the user asks for a board memo, add `董事会结论`, `投资/预算建议`, `组织调整要求`, and `不建议动作`.

## Quality Bar

- Produce a real consulting judgment, not a balanced essay.
- Separate evidence from assumptions.
- Make scoring defensible; weak evidence should reduce confidence.
- Prefer asset-based pivots over fashionable imitation.
- Include legal, employment, privacy, education, finance, healthcare, antitrust, and data-compliance caveats when relevant.
- Do not recommend fraud, coercion, illegal labor practices, market manipulation, privacy invasion, fake scarcity, or deceptive investor signaling.
