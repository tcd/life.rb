class CreatePaymentCategories < ActiveRecord::Migration[6.0]
  def change()
    create_table(:payment_categories, id: :uuid) do |t|
      t.string("name", null: false, index: { unique: true })
    end
  end
end
