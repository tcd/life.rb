# An entity that we give money in exchange for goods & services.
class Merchant < ApplicationRecord

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute name
  #   @return [String]
  validates("name", presence: true, uniqueness: true)

  # @!attribute official_name
  #   @return [String]

  # @!attribute description
  #   @return [String]

  # @!attribute website
  #   @return [String]

  # @!attribute category
  #   @return [String]

  # @!attribute metadata
  #   @return [Hash]

  # @!endgroup Attributes

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.icon_class()
    return "mdi mdi-store"
  end

end
