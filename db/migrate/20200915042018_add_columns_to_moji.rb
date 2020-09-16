class AddColumnsToMoji < ActiveRecord::Migration[6.0]
  def change()
    add_column("mojis", "unicode_code_point", :string)
    add_column("mojis", "unicode_code_points", :string, array: true, default: [])
    add_column("mojis", "unicode_name", :string)
  end
end
