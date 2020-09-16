class AddStatusToMojis < ActiveRecord::Migration[6.0]
  def change
    add_column :mojis, :status, :string
  end
end
