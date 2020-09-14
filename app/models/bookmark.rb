# Bookmarks from Chrome & Firefox
class Bookmark < ApplicationRecord

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

  # @!attribute folders
  #   @return [Array<String>]

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

  # @!method self.chrome()
  #   @return [self]
  scope(:chrome, -> { where(source: "chrome") })

  # @!method self.firefox()
  #   @return [self]
  scope(:firefox, -> { where(source: "firefox") })

  # @!endgroup Scopes

  # ============================================================================
  # Class Methods
  # ============================================================================

  # @param path [String,Pathname]
  # @param source [String]
  # @return [void]
  def self.from_netscape_file(path, source)
    html      = IO.read(path)
    parser    = BookmarkMachine::NetscapeParser.new(html)
    bookmarks = parser.bookmarks
    bookmarks.each do |bookmark|
      self.create!(
        source:                source,
        url:                   bookmark.url,
        title:                 bookmark.name,
        folders:               bookmark.folders,
        tags:                  bookmark.tags,
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

end
