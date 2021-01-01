class Account < ApplicationRecord

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute name
  #   @return [String]

  # @!attribute bank
  #   @return [String]
  validates("bank", presence: true)

  # @!attribute account_number
  #   @return [String]
  validates("account_number", presence: true)

  # @!attribute checking
  #   @return [Boolean]

  # @!attribute credit
  #   @return [Boolean]

  # @!attribute debit
  #   @return [Boolean]

  # @!attribute savings
  #   @return [Boolean]

  # @!attribute person_id
  #   @return [String<UUID>]

  # @!attribute metadata
  #   @return [Hash]

  # @!endgroup Attributes

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.icon_class()
    return "mdi mdi-bank"
  end

end
