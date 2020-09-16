class AddCategoryToMoji < ActiveRecord::Migration[6.0]
  def change()
    add_column("mojis", "category", :string)
    Moji.all.each { |m| m.update(category: m.group) }
  end
end
