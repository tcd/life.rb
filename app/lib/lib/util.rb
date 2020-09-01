module Lib
  # Utility functions for use throughout the app.
  module Util

    # @param params [Array<Symbol>]
    # @return [Object]
    def self.get_credential(*params)
      return Rails.application.credentials.dig(Rails.env.to_sym, *params)
    end

    # Write out data to a JSON file in `ActiveStorage::Blob` for the current `Rails.env`.
    # Prepends a unique timestamp to the filename.
    #
    # @param data [Object]
    # @param name [String]
    # @return [String]
    def self.save_to_file(data, name)
      base_name = File.basename(name)
      file_name = "#{Time.zone.now.to_i}.#{base_name}"
      name.gsub!(base_name, file_name)
      path = Rails.root.join("storage", "saved_files", name)
      FileUtils.mkdir_p(path.parent)
      File.write(path, f.write(data), mode: "a")
      return path.to_s
    end

  end
end
