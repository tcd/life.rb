module Lib
  module FlatFile
    module TSV

      # Read a TSV file and return its contents as an array of hashes.
      #
      # @param filepath [String] Path to the TSV file.
      # @param delim [String] ("\t")
      # @return [Array<Hash{String => String}>]
      def self.from_file(filepath, delim: "\t")
        return ::CSV.read(
          filepath,
          col_sep: delim,
          headers: true,
          quote_char: "\x00",
        ).map(&:to_hash)
      end

    end
  end
end
