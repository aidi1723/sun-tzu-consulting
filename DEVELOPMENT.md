# 开发与维护文档

本文档面向维护者，说明 `sun-tzu-consulting` Skill 的设计边界、文件职责、校验方法和发布流程。

## 设计目标

`sun-tzu-consulting` 是咨询系统中的 L1 宏观战略审计模块。它不负责输出战术博弈动作，而是先判断战略方向是否成立：

- 是否存在真实市场需求
- 是否处在合适的宏观与政策窗口
- 是否具备可防守的市场地形
- 团队 DNA 是否匹配战略目标
- 组织机制是否能支撑落地

当 L1 判断原方案高风险、需要重构或应当否定时，再通过 `references/workflow-handoff.md` 生成给 `thirty-six-strategies` 的 L2 交接 payload。

## 文件职责

| 文件 | 职责 |
| --- | --- |
| `SKILL.md` | Skill 入口。保留触发条件、核心工作流、输出格式和质量标准。 |
| `references/assessment-framework.md` | 五事七计评分方法、证据要求、风险分层和报告检查清单。 |
| `references/schema.md` | `consulting_macro_audit` function calling schema 与返回契约。 |
| `references/workflow-handoff.md` | L1 到 L2 的边界、触发条件、字段映射和组合输出模式。 |
| `references/examples.md` | 教育转型、制造业 SaaS、并购评估等咨询场景样例。 |
| `agents/openai.yaml` | UI 展示元数据和默认调用提示。 |

## 维护原则

- `SKILL.md` 应保持短小，优先放流程和决策规则。
- 详细模型、schema、案例、集成协议放在 `references/`。
- 新增行业案例时，优先补 `references/examples.md`，不要把长案例写进 `SKILL.md`。
- 新增评分标准时，补 `references/assessment-framework.md`，并保持 0-10 分制。
- L2 交接字段必须继续兼容 `thirty-six-strategies` 的 `business_dilemma`、`stakeholders`、`client_bottom_line`。
- 不要让 L2 为 L1 已判定不可行的原方案背书；L2 只能用于合法转向、破局、谈判、止损或退出。

## 本地校验

优先使用官方校验脚本：

```bash
python3 <skill-creator>/scripts/quick_validate.py <sun-tzu-consulting-checkout>
```

如果本机 Python 缺少 `PyYAML` 或 pip 环境不可用，可使用 Ruby 做等价基础校验：

```bash
ruby - <<'RUBY'
require 'yaml'
require 'json'
require 'find'

skill = '<sun-tzu-consulting-checkout>'
skill_md = File.join(skill, 'SKILL.md')
text = File.read(skill_md)
abort 'No YAML frontmatter found' unless text.start_with?("---\n")
front = YAML.safe_load(text.match(/\A---\n(.*?)\n---/m)[1])
abort 'Missing name' unless front['name'].is_a?(String)
abort 'Missing description' unless front['description'].is_a?(String)
abort 'Invalid name format' unless front['name'].match?(/\A[a-z0-9-]+\z/)

Find.find(skill) do |path|
  next unless path.end_with?('.md')
  count = File.read(path).scan(/^```/).length
  abort "Unbalanced code fences in #{path}: #{count}" unless count.even?
end

YAML.safe_load(File.read(File.join(skill, 'agents/openai.yaml')))
schema_md = File.read(File.join(skill, 'references/schema.md'))
JSON.parse(schema_md[/```json\n(.*?)\n```/m, 1])
puts 'Validation passed'
RUBY
```

校验范围：

- `SKILL.md` frontmatter 存在且字段有效
- Skill name 为小写 hyphen-case
- Markdown 代码围栏成对
- `agents/openai.yaml` 可解析
- `references/schema.md` 的 JSON schema 可解析

## 发布流程

1. 修改 `SKILL.md` 或 `references/`。
2. 运行本地校验。
3. 检查与 `thirty-six-strategies` 的字段兼容性。
4. 更新 `RELEASE.md` 的版本说明。
5. 提交并推送：

```bash
git status --short
git add .
git commit -m "Update Sun Tzu consulting skill"
git push origin main
```

## 版本策略

- `v1.x`：保持现有 schema 兼容，只补充案例、风险规则和交接说明。
- `v2.0`：只有在变更 function calling schema、输出结构或 L1/L2 边界时才升级。

## 安全与合规

维护时必须保留以下边界：

- 不输出违法、欺诈、胁迫、隐私侵犯或市场操纵建议。
- 不建议虚假融资叙事、伪造竞争报价、虚假背书或误导性公关。
- 裁员、融资、教育、医疗、金融、数据安全、反垄断等高风险场景必须提示专业审查。
- 允许使用竞争策略语言，但最终建议必须转译为合法商业动作、风控和退出路径。
