class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change()
    create_table("bookmarks", id: :uuid) do |t|
      t.string("source")
      t.string("title")
      t.string("description")
      t.text("icon")
      t.string("url", null: false)
      t.string("tags",    array: true, default: [])
      t.string("folders", array: true, default: [])
      t.datetime("folder_name_date")
      t.datetime("created_on_browser_at")
      t.datetime("updated_on_browser_at")
      t.jsonb("metadata", default: "{}")
      t.timestamps()
    end
  end
end
