Trestle.resource(:people) do

  active_storage_fields do
    [:photo]
  end

  menu do
    item :people, icon: "mdi mdi-human-male-female"
  end

  table do
    column(:photo, header: nil, align: :center) do |person|
      avatar(fallback: person.initials) { image_tag(person.photo_url) if person.has_photo? }
    end
    column(:display_name, header: "Name")
    actions()
  end

  # @param [Person]
  form do |person|

    tab(:person) do
      text_field(:first_name)
      text_field(:middle_name)
      text_field(:last_name)
      active_storage_field(:photo)
    end

    sidebar do
      form_group(:name, label: false, class: "text-center") do
        content_tag(:h1) { person.display_name }
      end
      if person.has_photo?()
        form_group(:photo, label: false) do
          link_to(image_tag(person.photo_url), person.photo_url, data: { behavior: "zoom" })
        end
      end
    end

  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:person).permit(:name, ...)
  # end
end
