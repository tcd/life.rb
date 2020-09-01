class Snippet < ApplicationRecord

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute name [rw]
  #   @return [String]

  # @!attribute description [rw]
  #   @return [String]

  # @!attribute content [rw]
  #   @return [String]
  validates(:content, presence: true)

  # @!attribute trigger [rw]
  #   @return [String]

  # @!attribute emoji [rw]
  #   @return [Boolean]

  # @!attribute textmate [rw]
  #   @return [Boolean]

  # @!attribute for_use_with [rw]
  #   @return [Array<String>]

  # @!attribute metadata [rw]
  #   @return [Hash]

  # @!endgroup Attributes

end
