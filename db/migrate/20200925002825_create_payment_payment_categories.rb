class CreatePaymentPaymentCategories < ActiveRecord::Migration[6.0]
  def change()
    create_table(:payment_payment_categories, id: :uuid) do |t|
      t.references("payment", foreign_key: true, type: :uuid)
      t.references("payment_category", foreign_key: true, type: :uuid)
    end
  end
end
