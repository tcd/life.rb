class AddMoreNameFieldsToPerson < ActiveRecord::Migration[6.0]
  def change()
    add_column(:people, :first_name, :string)
    add_column(:people, :middle_name, :string)
    add_column(:people, :last_name, :string)
    change_column_null(:people, :name, true)
  end
end
