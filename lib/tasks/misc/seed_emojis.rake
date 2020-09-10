namespace("misc") do

  desc("Seed the Emoji db table")
  task(seed_emoji: :environment) do
    # Emoji.all.each do |emoji|
    #   Moji.create!(
    #     name:  emoji.description,
    #     emoji: emoji.raw,
    #     # group: emoji,
    #   )
    # end
    data = FlatFile::JSON.from_file("/Users/clay/TCD/life/ignore/emoji.json")
  end

end
