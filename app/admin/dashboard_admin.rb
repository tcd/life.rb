Trestle.admin(:dashboard) do

  menu do
    item(
      :dashboard,
      icon: "mdi mdi-home",
      priority: :first,
    )
  end

  controller do

    # @return [void]
    def index()
      @models = Trestle.admins.map do |name, admin|
          next if name == "dashboard"
          {
            link:         admin.path,
            title:        admin.model.name.pluralize.titlecase,
            count:        admin.model.count,
            icon_classes: admin.model.icon_class,
          }
        end
        .compact
        .sort_by { |x| x[:title] }
    end

  end

end
