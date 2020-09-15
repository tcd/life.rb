Rails.application.config.generators do |g|

  g.orm(:active_record, primary_key_type: :uuid)

  g.template_engine(:erb)

  g.stylesheets = false
  g.javascripts = false
  g.helper      = false
  g.assets      = false

  g.system_tests = false
  # g.factory_bot(false)

end
