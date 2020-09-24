if Rails.env.development?
  module ActiveSupport::TaggedLogging::Formatter

    def call(severity, time, progname, data)
      new_data = {
        level: severity,
        time: time,
        progname: progname,
      }
      if severity == "FATAL"
        msg = data.dig(:msg) || msg
        trace = msg&.split("\n")&.reject(&:blank?)
        new_data[:trace] = trace unless trace.blank?()
      elsif data.is_a?(Hash)
        new_data.merge!(data)
      else
        new_data[:msg] = data.to_s()
      end
      tags = current_tags
      new_data[:tags] = tags if tags.present?
      _call(severity, time, progname, new_data)
    end

  end
end
