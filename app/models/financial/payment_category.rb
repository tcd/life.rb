class PaymentCategory < ApplicationRecord

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute name [rw]
  #   @return [String]
  validates("name", presence: true, uniqueness: true)

  # @!endgroup Attributes

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.icon_class()
    return "mdi mdi-tag"
  end

end
