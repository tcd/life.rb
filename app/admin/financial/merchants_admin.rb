Trestle.resource(:merchants) do

  menu do
    item(
      :merchants,
      icon: "mdi mdi-store",
      group: :financial,
    )
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # # @param [Merchant]
  # form do |merchant|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  params do |params|
    params.require(:merchant)
    .permit(
      :name,
      :official_name,
      :description,
      :category,
      :website,
    )
  end
end
