class CreateSnippets < ActiveRecord::Migration[6.0]
  def change()
    create_table("snippets", id: :uuid) do |t|
      t.string("name")
      t.string("description")
      t.string("content", null: false)
      t.string("trigger")
      t.boolean("emoji")
      t.boolean("textmate")
      t.string("for_use_with", array: true, default: [])
      t.jsonb("metadata", default: "{}")
      t.timestamps()
    end
  end
end
