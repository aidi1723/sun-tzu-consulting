#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'yaml'
require 'find'

skill_dir = File.expand_path('..', __dir__)
root_dir = File.expand_path('..', skill_dir)
l2_dir = File.join(root_dir, 'thirty-six-strategies')

def abort_with(message)
  warn "Validation failed: #{message}"
  exit 1
end

def read(path)
  File.read(path)
rescue Errno::ENOENT
  abort_with("missing required file: #{path}")
end

skill_md = File.join(skill_dir, 'SKILL.md')
skill_text = read(skill_md)
abort_with('SKILL.md must start with YAML frontmatter') unless skill_text.start_with?("---\n")

frontmatter = skill_text.match(/\A---\n(.*?)\n---/m)
abort_with('SKILL.md frontmatter is not closed') unless frontmatter

metadata = YAML.safe_load(frontmatter[1])
abort_with('frontmatter name must be sun-tzu-consulting') unless metadata['name'] == 'sun-tzu-consulting'
abort_with('frontmatter description must be present') unless metadata['description'].is_a?(String) && !metadata['description'].strip.empty?

Find.find(skill_dir) do |path|
  next unless path.end_with?('.md')

  fence_count = read(path).scan(/^```/).length
  abort_with("unbalanced Markdown code fences in #{path}") unless fence_count.even?
end

YAML.safe_load(read(File.join(skill_dir, 'agents/openai.yaml')))

schema_md = read(File.join(skill_dir, 'references/schema.md'))
schema_json = schema_md[/```json\n(.*?)\n```/m, 1]
abort_with('references/schema.md must contain a json code block') unless schema_json

JSON.parse(schema_json)

if Dir.exist?(l2_dir)
  l2_schema_md = read(File.join(l2_dir, 'references/schema.md'))
  l2_schema_json = l2_schema_md[/```json\n(.*?)\n```/m, 1]
  abort_with('L2 references/schema.md must contain a json code block') unless l2_schema_json

  l2_schema = JSON.parse(l2_schema_json)
  l2_fields = l2_schema.fetch('parameters').fetch('properties').keys
  handoff_text = read(File.join(skill_dir, 'references/workflow-handoff.md'))
  own_schema_text = read(File.join(skill_dir, 'references/schema.md'))

  missing_fields = l2_fields.reject do |field|
    handoff_text.include?("`#{field}`") && own_schema_text.include?("\"#{field}\"")
  end
  abort_with("L1 handoff does not document L2 schema fields: #{missing_fields.join(', ')}") unless missing_fields.empty?

  stale_fields = %w[business_dilemma stakeholders client_bottom_line].select do |field|
    handoff_text.include?("`#{field}`") || own_schema_text.include?("\"#{field}\"")
  end
  abort_with("L1 handoff still contains stale fields: #{stale_fields.join(', ')}") unless stale_fields.empty?

  handoff_json_blocks = own_schema_text.scan(/```json\n(.*?)\n```/m).flatten
  handoff_example = handoff_json_blocks.map { |block| JSON.parse(block) }.find { |object| object['invoke_skill'] == 'thirty-six-strategies' }
  abort_with('references/schema.md must include a parseable thirty-six-strategies handoff example') unless handoff_example

  missing_handoff_fields = l2_fields.reject { |field| handoff_example.key?(field) }
  abort_with("handoff example does not include L2 fields: #{missing_handoff_fields.join(', ')}") unless missing_handoff_fields.empty?
end

puts 'Validation passed'
