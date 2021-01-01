class CreatePayments < ActiveRecord::Migration[6.0]
  def change()
    create_table("payments", id: :uuid) do |t|

      t.references("person",   foreign_key: true, type: :uuid)
      t.references("merchant", foreign_key: true, type: :uuid)
      t.references("account",  foreign_key: true, type: :uuid)

      t.monetize("credit")
      t.monetize("debit")

      t.string("name")
      t.string("category")
      t.string("contact")
      t.string("description")
      t.boolean("work_expense", default: false)
      t.boolean("subscription", default: false)
      t.boolean("refunded", default: false)
      t.date("charge_date")
      t.date("transaction_date")
      t.datetime("charge_timestamp")
      t.datetime("transaction_timestamp")
      t.jsonb("metadata", default: "{}")
      t.timestamps()
    end
  end
end
