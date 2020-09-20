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

  # @!attribute unicode_code_points
  #   @return [Array<String>]
  attribute("unicode_code_points", :string, array: true)

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
  #   What I call the emoji.
  #   @return [String]

  # @!attribute personal_shortcode
  #   Shortcut that I use on Alfred.
  #   @return [String]

  # @!attribute github_shortcode
  #   Shortcut on GitHub.
  #   @return [String]

  # @!attribute slack_shortcode
  #   Shortcut on Slack.
  #   @return [String]

  # @!attribute teams_shortcode
  #   Shortcut on Microsoft Teams.
  #   @return [String]

  # @!attribute tags
  #   @return [Array<String>]
  attribute(:tags, :string, array: true)

  # @!attribute aliases
  #   @return [Array<String>]
  attribute(:aliases, :string, array: true)

  # @!endgroup Attributes

  # ============================================================================
  # Class Methods
  # ============================================================================

  # @return [String]
  def self.official_unicode_emoji_data()
    return HTTParty.get(NEWEST_UNICODE_EMOJI_DATA)
  end

  # @param data [String]
  # @return [void]
  def self.parse_emoji_data(data = official_unicode_emoji_data())
    current_group    = nil
    current_subgroup = nil
    lines            = data.split("\n")
    important_lines  = lines[lines.find_index("# group: Smileys & Emotion")..-1]

    important_lines.each do |line|

      if !current_group.blank?() &&
         !current_subgroup.blank?()

        if (matches = line.match(UNICODE_DATA_PATTERN))
          code_points = matches[:code_points].strip.split
          # code_point  = (code_points.length == 1) ? code_points.first : nil
          self.create!(
            # unicode_code_point:  code_point,
            unicode_code_points: code_points,
            group:               current_group,
            sub_group:           current_subgroup,
            unicode_name:        matches[:name].strip,
            emoji:               matches[:emoji].strip,
            status:              matches[:status].strip,
            emoji_version:       matches[:emoji_version].strip,
          )
          next
        end
      end

      if current_group.nil? &&
         line.length > 9 &&
         line[0..8] == "# group: "

        current_group = line[9..-1]
        next
      end

      if current_subgroup.nil? &&
         line.length > 12 &&
         line[0..11] == "# subgroup: "

        current_subgroup = line[12..-1]
        next
      end

      if !current_subgroup.nil? && line == ""

        current_subgroup = nil
        next
      end

      if !current_group.nil? && line.match?("# #{current_group}.*")

        current_group = nil
        next
      end

    end
    return nil
  end

  # @return [void]
  def self.add_gemoji_data()
    self.all.each do |moji|
      if (emoji = Emoji.find_by_unicode(moji.unicode_string))

      end
    end

  end

  # ============================================================================
  # Instance Methods
  # ============================================================================

  # @return [String]
  def display_name()
    return self.personal_name || self.unicode_name
  end

  # @return [String]
  def unicode_string()
    return self.unicode_code_points.map{ |cp| cp.to_i(16) }.pack("U*")
  end

end
