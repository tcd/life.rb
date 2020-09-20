class AddShortcodesToMoji < ActiveRecord::Migration[6.0]
  def change
    add_column :mojis, :github_shortcode, :string
    add_column :mojis, :slack_shortcode, :string
    add_column :mojis, :teams_shortcode, :string
    add_column :mojis, :personal_shortcode, :string
  end
end
