class CreateMerchants < ActiveRecord::Migration[6.0]
  def change()
    create_table("merchants", id: :uuid) do |t|
      t.string("name", null: false, index: { unique: true })
      t.string("official_name")
      t.string("description")
      t.string("category")
      t.string("website")
      t.jsonb("metadata", default: "{}")
      t.timestamps()
    end
  end
end
