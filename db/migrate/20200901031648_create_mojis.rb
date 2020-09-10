class CreateMojis < ActiveRecord::Migration[6.0]
  def change()
    create_table("mojis", id: :uuid) do |t|
      t.string("name")
      t.string("personal_name")
      t.string("emoji")
      t.string("group")
      t.string("sub_group")
      t.string("unicode_version")
      t.string("emoji_version")
      t.string("aliases", array: true, default: [])
      t.string("tags", array: true, default: [])
      t.timestamps()
    end
  end
end
