Trestle.resource(:tracked_times) do

  menu do
    item("Time", icon: "mdi mdi-timer")
  end

  table do
    column(:source)
    column(:duration, &:duration_string)
    column(:start_time, align: :center)
    column(:end_time, align: :center)
    column(:employer)
    column(:client)
    column(:project)
    column(:description)
  end

  # @param tracked_time [TrackedTime]
  form do |tracked_time|

    tab(:time) do
      # text_field(:title)
      # text_field(:description)
      # text_field(:url)
      # tag_select(:tags)
      # tag_select(:folders)
      render(JSONCodeBlock::Component.new(data: tracked_time.as_json))
    end

    tab(:metadata) do
      render(JSONCodeBlock::Component.new(data: tracked_time.as_json))
    end

  end

  # params do |params|
  #   params.require(:tracked_time).permit(:name, ...)
  # end

end
