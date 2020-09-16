Trestle.resource(:bookmarks) do

  menu do
    item(:bookmarks, icon: "mdi mdi-bookmark-multiple")
  end

  search do |query|
    query ? collection.pg_search(query) : collection
  end

  scopes do
    scope(:all, { default: true })
    scope(:chrome)
    scope(:firefox)
  end

  table do
    column(:source, sort: :source, align: :center) do |m|
      case m.source
      when "firefox" then icon("mdi mdi-firefox")
      when "chrome" then  icon("mdi mdi-google-chrome")
      else                icon("mdi mdi-help-circle-outline")
      end
    end
    column(:title)
    # column(:description)
    column(:url)
    # column(:tags)
    # column(:folders)
    column(:folder, &:folder_string)
    actions
  end

  # @param bookmark [Bookmark]
  form do |bookmark|
    tab(:bookmark) do
      text_field(:title)
      text_field(:description)
      text_field(:url)
      tag_select(:tags)
      tag_select(:folders)
      divider()
      static_field("Created On Browser At", bookmark.created_on_browser_at || "")
      static_field("Updated On Browser At", bookmark.updated_on_browser_at || "")
      divider()
      static_field("Created At", bookmark.created_at || "")
      static_field("Updated At", bookmark.updated_at || "")
    end
    tab(:metadata) do
      render(JSONCodeBlock::Component.new(data: bookmark.as_json))
    end
  end

  # params do |params|
  #   params.require(:bookmark).permit(:name, ...)
  # end

end
