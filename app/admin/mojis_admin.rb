Trestle.resource(:mojis) do

  menu do
    item(:mojis, icon: "mdi mdi-emoticon-cool")
  end

  table do
    column(:emoji, align: :center)
    column(:name, truncate: false)
  end

  # # @param moji [Moji]
  # form do |moji|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # params do |params|
  #   params.require(:moji).permit(:name, ...)
  # end

end
