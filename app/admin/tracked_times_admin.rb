Trestle.resource(:tracked_times) do

  menu do
    item("Time", icon: "mdi mdi-timer")
  end

  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # @param tracked_time [TrackedTime]
  # form do |tracked_time|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # params do |params|
  #   params.require(:tracked_time).permit(:name, ...)
  # end

end
