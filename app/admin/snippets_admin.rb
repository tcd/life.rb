Trestle.resource(:snippets) do

  menu do
    item(:snippets, icon: "mdi mdi-code-braces")
  end

  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # # @param snippet [Snippet]
  # form do |snippet|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # params do |params|
  #   params.require(:snippet).permit(:name, ...)
  # end

end
