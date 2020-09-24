namespace("misc") do

  desc("Seed the Moji db table")
  task(seed_emoji: :environment) do
    # Emoji.all.each do |emoji|
    #   Moji.create!(
    #     name:  emoji.description,
    #     emoji: emoji.raw,
    #     # group: emoji,
    #   )
    # end
    data = FlatFile::JSON.from_file(Rails.root.join("ignore/emoji.json"))
  end

  desc("Set 'group' values for existing Moji")
  task(more_emoji_data: :environment) do
    emoji_data = JSON.parse(File.read(Rails.root.join("ignore/emoji.json")))
    emoji_data.each do |emoji|
      if (moji = Moji.find_by(emoji: emoji["emoji"]))
        moji.update!(
          category: emoji["category"],
          unicode_version: emoji["unicode_version"].to_f(),
        )
      end
    end
  end

end
