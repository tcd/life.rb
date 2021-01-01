class CreateAccounts < ActiveRecord::Migration[6.0]
  def change()
    create_table("accounts", id: :uuid) do |t|
      t.references("person", foreign_key: true, type: :uuid)
      t.string("bank", null: false)
      t.string("account_number", null: false)
      t.string("name")
      t.boolean("credit",   default: false)
      t.boolean("debit",    default: false)
      t.boolean("checking", default: false)
      t.boolean("savings",  default: false)
      t.jsonb("metadata", default: "{}")
      t.timestamps()
    end
  end
end
