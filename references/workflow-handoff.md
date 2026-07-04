# L1 to L2 Workflow Handoff

Use this reference when `sun-tzu-consulting` should coordinate with the existing `thirty-six-strategies` skill.

## Role Boundary

| Layer | Skill | Core question | Output |
| --- | --- | --- | --- |
| L1 | `sun-tzu-consulting` | Should the client do this? What is the strategic success probability? | Macro audit, scores, risk warning, go/pilot/redesign/reject decision |
| L2 | `thirty-six-strategies` | Given the dilemma, how should the client win, pivot, negotiate, or exit? | Tactical operator combination, execution sandbox, risk control, retreat path |

Do not use L2 to justify a strategically unsound plan. L2 is for finding a lawful tactical path after L1 identifies the real bottleneck.

## Handoff Triggers

Recommend L2 handoff when any condition is true:

- Average Five Factors score is below 5.0.
- Any fatal factor is below 3.0.
- L1 recommendation is `重构方案` or `否定原方案`.
- The client faces a concrete blockage: PR crisis, layoffs, competitor attack, founder conflict, investor negotiation, supplier lock-in, channel squeeze, or customer churn.
- The strategy is directionally valid but execution requires sequencing, negotiation leverage, stakeholder management, or exit design.

## Handoff Payload

Map L1 findings to the L2 input schema:

| L1 finding | L2 field |
| --- | --- |
| Situation type, such as negotiation, supply-chain pressure, contract design, marketing, news interpretation, or a close inferred domain | `context_type` |
| Main strategic bottleneck, concrete blockage, or pivot/exit dilemma | `dilemma_or_input` |
| Client assets, leverage, constraints, desired end state, budget cap, reputation floor, compliance boundary, time limit, and cash runway | `my_resources_and_position` |
| Competitors, regulators, channels, internal factions, counterpart incentives, strengths, weaknesses, and likely reactions | `opponent_profile` |

Recommended L2 prompt:

```text
Use $thirty-six-strategies to produce a lawful tactical solution:
context_type: business_negotiation
dilemma_or_input: ...
my_resources_and_position: ...
opponent_profile: ...
```

## Handoff Patterns

### L1 denies direct market entry

Common L2 search direction:
- `借尸还魂`: reuse old assets, distressed teams, abandoned channels, or neglected IP.
- `暗度陈仓`: use an ordinary transition path to build the real strategic control point.
- `走为上`: exit the unwinnable battlefield while preserving cash, data, brand, and team.

### L1 finds weak team DNA

Common L2 search direction:
- `树上开花`: add credible advisors, partners, certifications, or acquisition targets.
- `借刀杀人`: use external standards or expert review to force capability upgrades.
- `李代桃僵`: trade non-core budget or projects for critical hires and operating control.

### L1 finds hostile terrain

Common L2 search direction:
- `调虎离山`: move competition away from incumbent advantage.
- `围魏救赵`: attack hidden cost, compliance, service, or reliability instead of the visible dimension.
- `远交近攻`: ally with distant platforms, suppliers, regulators, or ecosystem partners to pressure near rivals.

### L1 finds organization cannot execute

Common L2 search direction:
- `釜底抽薪`: remove root causes, zombie projects, or misaligned KPIs.
- `指桑骂槐`: reset cultural norms through visible signals, rewards, and benchmark cases.
- `反客为主`: install process, data, cadence, and decision templates that shift initiative to the transformation team.

## Combined Output Pattern

When producing a dual-core answer:

1. State the L1 verdict first.
2. Explain the Five Factors evidence.
3. Reject or redesign the original plan if needed.
4. Call out the L2 handoff with a compact payload.
5. Provide only a short tactical preview unless the user asked for the full L2 plan.
