# Emoji characters up to Unicode v13.0
#
# See:
#
# - [Unicode Full Emoji List](https://unicode.org/emoji/charts/full-emoji-list.html)
#     - [Unicode Emoji Chart Format](https://unicode.org/emoji/format.html#col-name)
# - [Unicode Emoji Data Files](https://unicode.org/Public/emoji/)
# - [Emojipedia](https://emojipedia.org/)
# - [GitHub Emoji Cheatsheet](https://gist.github.com/rxaviers/7360908)
# - [About Unicode Emoji](https://blog.emojipedia.org/unicode-behind-the-curtain/)
# - [github/gemoji](https://github.com/github/gemoji) - Emoji images and names.
# - [ticky/ruby-emoji-regex](https://github.com/ticky/ruby-emoji-regex) - 💎 A pair of Ruby regular expressions for matching Unicode Emoji symbols.
#
# https://util.unicode.org/UnicodeJsps/character.jsp?a=1F916
class Moji < ApplicationRecord

  # @return [String]
  NEWEST_UNICODE_EMOJI_DATA = "https://unicode.org/Public/emoji/13.0/emoji-test.txt".freeze()

  # @return [String]
  NEWEST_GEMOJI_EMOJI_DATA  = "https://raw.githubusercontent.com/github/gemoji/master/db/emoji.json".freeze()

  # @return [Regexp]
  UNICODE_DATA_PATTERN = /^(?<code_points>([[:xdigit:]]{4,5}\s)+)\s+; (?<status>\S+)\s+# (?<emoji>\S+)\s+E(?<emoji_version>\S+)\s(?<name>.*)$/.freeze()

  # ============================================================================
  # Callbacks
  # ============================================================================

  before_validation(:init)

  # @return [void]
  def init()
    self.unicode_name&.downcase!
    self.name&.downcase!
    super()
  end

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute unicode_name
  #   NOTE: This will be lowercase.
  #
  #   *CLDR* (*Common Locale Data Repository*) Short Name;
  #   A unique, official identifier for a given Emoji (or unicode character)
  #   @return [String]
  validates("unicode_name", presence: true)

  # @!attribute emoji
  #   @return [String]
  validates("emoji", presence: true)

  # @!attribute unicode_code_point
  #   @return [String]
  validates("unicode_code_point", presence: true)

  # @!attribute unicode_code_points
  #   @return [Array<String>]
  attribute(:unicode_code_points, :string, array: true)

  # @!attribute status [rw]
  #   One of the following values:
  #
  #   - *component* - An Emoji_Component, excluding Regional_Indicators, ASCII, and non-Emoji
  #   - *fully-qualified* - A fully-qualified emoji (see ED-18 in UTS #51), excluding Emoji_Component
  #   - *minimally-qualified* - A minimally-qualified emoji (see ED-18a in UTS #51)
  #   - *unqualified* - A unqualified emoji (See ED-19 in UTS #51)
  #
  #   @return [String]

  # @!attribute group
  #   @return [String]

  # @!attribute sub_group
  #   @return [String]

  # @!attribute unicode_version
  #   @return [String]

  # @!attribute emoji_version
  #   @return [String]

  # @!attribute category
  #   Examples include:
  #
  #   - Smileys & Emotion
  #   - People & Body
  #   - Animals & Nature
  #   - Food & Drink
  #   - Travel & Places
  #   - Activities
  #   - Objects
  #   - Symbols
  #   - Flags
  #
  #   @return [String]

  # @!attribute name
  #   @return [String]

  # @!attribute personal_name
  #   @return [String]

  # @!attribute tags
  #   @return [Array<String>]
  attribute(:tags, :string, array: true)

  # @!attribute aliases
  #   @return [Array<String>]
  attribute(:aliases, :string, array: true)

  # @!endgroup Attributes

end
