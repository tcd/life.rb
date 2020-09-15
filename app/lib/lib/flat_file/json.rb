module Lib
  module FlatFile
    module JSON

      # Return a hash parsed from a given JSON file.
      #
      # @param file [String]
      # @return [ActiveSupport::HashWithIndifferentAccess]
      def self.from_file(file)
        data = ::JSON.parse(File.read(file))
        return data&.with_indifferent_access || data
      end

    end
  end
end
