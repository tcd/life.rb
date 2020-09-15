Trestle.resource(:bookmarks) do

  menu do
    item(:bookmarks, icon: "mdi mdi-bookmark-multiple")
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
    column(:description)
    column(:url)
    column(:tags)
    column(:folders)
  end

  # form do |bookmark|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:bookmark).permit(:name, ...)
  # end
end
