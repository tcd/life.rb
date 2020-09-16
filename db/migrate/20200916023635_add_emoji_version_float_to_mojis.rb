class AddEmojiVersionFloatToMojis < ActiveRecord::Migration[6.0]
  def change
    add_column(:mojis, :unicode_version_float, :float)
    add_column(:mojis, :emoji_version_float, :float)
    Moji.all.each { |m| m.update!(emoji_version_float: m.emoji_version.to_f) }
  end
end
