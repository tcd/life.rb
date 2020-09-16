Trestle.resource(:mojis) do

  menu do
    item(:mojis, icon: "mdi mdi-emoticon-cool")
  end

  table do
    column(:emoji, align: :center)
    column(:name, truncate: false)
    column(:category, align: :center)
    column(:unicode_version, align: :center)
  end

  # # @param moji [Moji]
  form do |moji|

    tab(:emoji) do
      # if moji.new_record?
      # else
      #   static_field("Emoji", moji.emoji || "")
      # end
      text_field(:emoji)
      text_field(:unicode_code_point)
      divider()
      # text_field(:name)
      text_field(:unicode_name)
      text_field(:personal_name)
      divider()
      text_field(:category)
      divider()
      text_field(:unicode_version)
      text_field(:emoji_version)
    end

    tab(:metadata) do
      render(JSONCodeBlock::Component.new(data: moji.as_json))
    end

    sidebar do
      form_group(:name, label: false, class: "text-center") do
        content_tag(:h1) { moji.name }
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
