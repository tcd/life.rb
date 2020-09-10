# See
#
# - [Unicode Full Emoji List](https://unicode.org/emoji/charts/full-emoji-list.html)
# - [Unicode Emoji Data Files](https://unicode.org/Public/emoji/)
# - [Emojipedia](https://emojipedia.org/)
# - [GitHub Emoji Cheatsheet](https://gist.github.com/rxaviers/7360908)
# - [About Unicode Emoji](https://blog.emojipedia.org/unicode-behind-the-curtain/)
# - [github/gemoji](https://github.com/github/gemoji) - Emoji images and names.
# - [ticky/ruby-emoji-regex](https://github.com/ticky/ruby-emoji-regex) - 💎 A pair of Ruby regular expressions for matching Unicode Emoji symbols.
class Moji < ApplicationRecord

  # @return [String]
  NEWEST_UNICODE_EMOJI_DATA = "https://unicode.org/Public/emoji/13.0/emoji-test.txt".freeze()
  # @return [String]
  NEWEST_GEMOJI_EMOJI_DATA  = "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json".freeze()

end
