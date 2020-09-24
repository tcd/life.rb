Trestle.resource(:mojis) do

  menu do
    item(:mojis, icon: "mdi mdi-emoticon-cool")
  end

  table do
    column(:emoji, align: :center)
    column(:display_name, header: "Name", truncate: false)
    column(:status)
    column(:emoji_version, sort: :emoji_version_float)
  end

  # @param moji [Moji]
  form do |moji|

    tab(:emoji) do
      # text_field(:emoji)
      form_group(:unicode, label: false) do
        content_tag(:h1) { "Unicode" }
      end
      static_field(:unicode_name)
      static_field(:unicode_code_points)
      text_field(:unicode_version)
      text_field(:emoji_version)
      divider()
      form_group(:personal, label: false) do
        content_tag(:h1) { "Personal" }
      end
      text_field(:personal_name)
      divider()
      text_field(:category)
      divider()
    end

    tab(:metadata) do
      render(JSONCodeBlock::Component.new(data: moji.as_json))
    end

    sidebar do
      form_group(:name, label: false, class: "text-center") do
        content_tag(:h1) { moji.display_name }
      end
      form_group(:emoji, label: false, class: "text-center") do
        content_tag(:span, class: "big-emoji") { moji.emoji }
      end
    end

  end

  # params do |params|
  #   params.require(:moji).permit(:name, ...)
  # end

end
