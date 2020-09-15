Trestle.admin(:dashboard) do

  # menu do
  #   item(
  #     :dashboard,
  #     icon: "mdi mdi-desktop-mac-dashboard",
  #     priority: :first,
  #   )
  # end

  controller do

    # @return [void]
    def index()
      @models = [
        # ======================================================================
        # Core
        # ======================================================================
        # {
        #   link:  Trestle.lookup(:bookmarks).path,
        #   title: "Bookmarks",
        #   count: Bookmark.count,
        #   icon_classes: "mdi mdi-bookmark-multiple",
        # },
        {
          link:  trestle.bookmarks_admin_index_path,
          title: "Bookmarks",
          count: Bookmark.count,
          icon_classes: "mdi mdi-bookmark-multiple",
        },
        {
          link:  trestle.mojis_admin_index_path,
          title: "Emoji",
          count: Moji.count,
          icon_classes: "mdi mdi-emoticon-cool",
        },
        {
          link:  trestle.snippets_admin_index_path,
          title: "Snippets",
          count: Snippet.count,
          icon_classes: "mdi mdi-code-braces",
        },
        {
          link:  trestle.tracked_times_admin_index_path,
          title: "Time",
          count: TrackedTime.count,
          icon_classes: "mdi mdi-timer",
        },
      ]
    end

  end

end
