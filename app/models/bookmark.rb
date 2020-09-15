# Bookmarks from Chrome & Firefox
class Bookmark < ApplicationRecord

  include Lib::Helpers::Stripper

  include PgSearch::Model

  pg_search_scope(
    :pg_search,
    against: [
      :url,
      :title,
      :description,
      :tags,
      :folders,
    ],
    using: {
      tsearch: {
        # prefix: true,
        any_word: true,
        tsvector_column: "tsv",
      },
    },
  )

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute url
  #   The bookmarked address
  #   @return [String]
  validates("url", presence: true)

  # @!attribute title
  #   @return [String]

  # @!attribute description
  #   Additional description of the bookmark
  #   @return [String]

  # @!attribute icon
  #   @return [String]

  # @!attribute source
  #   Browser where the bookmark was created
  #   @return [String]

  # @!attribute metadata
  #   @return [Hash]

  # @!attribute tags
  #   @return [Array<String>]
  attribute(:tags, :string, array: true)

  # @!attribute folders
  #   @return [Array<String>]
  attribute(:folders, :string, array: true)

  # @!attribute folder_name_date
  #   @return [Time]

  # @!attribute updated_on_browser_at
  #   @return [Time]

  # @!attribute created_on_browser_at
  #   @return [Time]

  # @!endgroup Attributes

  # ==========================================================================
  # Scopes
  # ==========================================================================

  # @!group Scopes

  # ----------------------------------------------------------------------------
  # Browsers
  # ----------------------------------------------------------------------------

  # @!method self.chrome()
  #   @return [self]
  scope(:chrome, -> { where(source: "chrome") })

  # @!method self.firefox()
  #   @return [self]
  scope(:firefox, -> { where(source: "firefox") })

  # ----------------------------------------------------------------------------
  # Websites
  # ----------------------------------------------------------------------------

  # @!method self.github()
  #   @return [self]
  scope(:github, -> { where("url ILIKE 'https://github.com/%'") })

  # @!method self.medium()
  #   @return [self]
  scope(:medium, -> { where("url ILIKE 'https://medium.com/%'") })

  # @!method self.wikipedia()
  #   @return [self]
  scope(:wikipedia, -> { where("url ILIKE 'https://en.wikipedia.org/%'") })

  # @!endgroup Scopes

  # ============================================================================
  # Class Methods
  # ============================================================================

  # @param path [String,Pathname]
  # @param source [String]
  # @return [void]
  def self.from_netscape_file(path, source, tags: [])
    html      = IO.read(path)
    parser    = BookmarkMachine::NetscapeParser.new(html)
    bookmarks = parser.bookmarks
    bookmarks.each do |bookmark|
      if bookmark.tags.blank?
        bookmark_tags = tags
      else
        bookmark_tags = bookmark.tags + tags
      end
      self.create!(
        source:                source,
        url:                   bookmark.url,
        title:                 bookmark.name,
        folders:               bookmark.folders,
        tags:                  bookmark_tags,
        # icon:                  bookmark.icon,       # Wasted space
        created_on_browser_at: bookmark.created_at,
        updated_on_browser_at: bookmark.updated_at,
      )
    end
  end

  # ============================================================================
  # Instance Methods
  # ============================================================================

  # @return [String]
  def display_name()
    return self.title
  end

  # @return [String,nil]
  def folder_string()
    return self.folders.join("/")
  end

end
