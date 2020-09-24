require "lograge/sql/extension"

Rails.application.configure do

  config.lograge.enabled = true
  config.lograge.formatter = Class.new do |fmt|
    def fmt.call(data)
      return {
        msg: "Request",
        request: data.except(:sql_queries_count),
      }
    end
  end
  # config.lograge.formatter = Lograge::Formatters::Json.new()
  config.lograge.ignore_actions = ["HealthcheckController#index"]
  config.lograge.custom_options = lambda do |event|
    if !event.payload[:exception].blank?()
      {
        exception: {
          class:   event.payload[:exception]&.[](0),
          message: event.payload[:exception]&.[](1),
          object:  event.payload[:exception_object],
        },
      }
    end
  end

  # Format the array of extracted events
  config.lograge_sql.formatter = proc { |sql_queries| sql_queries }

  # Instead of extracting event as Strings, extract as Hash.
  config.lograge_sql.extract_event = proc do |event|
    {
      # name: event.payload[:name],
      duration: event.duration.to_f.round(2),
      sql: event.payload[:sql],
    }
  end

end
