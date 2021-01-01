class Payment < ApplicationRecord

  # @!attribute receipts [rw]
  #   @return [ActiveStorage::Attached::Many]
  has_one_attached(:receipts)

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute debit
  #   @return [Money]
  monetize(:debit_cents)

  # @!attribute credit
  #   @return [Money]
  monetize(:credit_cents)

  # @!attribute metadata
  #   @return [Hash]

  # @!attribute category
  #   @return [String]

  # @!attribute contact
  #   @return [String]

  # @!attribute description
  #   @return [String]

  # @!attribute name
  #   @return [String]

  # @!attribute transaction_date
  #   @return [Date]

  # @!attribute transaction_timestamp
  #   @return [Time]

  # @!attribute charge_date
  #   @return [Date]

  # @!attribute charge_timestamp
  #   @return [Time]

  # @!attribute refunded
  #   @return [Boolean]

  # @!attribute subscription
  #   @return [Boolean]

  # @!attribute work_expense
  #   @return [Boolean]

  # @!attribute person_id
  #   @return [String<UUID>]

  # @!attribute account_id
  #   @return [String<UUID>]

  # @!attribute merchant_id
  #   @return [String<UUID>]

  # @!endgroup Attributes

  # ==========================================================================
  # Associations
  # ==========================================================================

  # @!group Associations

  # @!attribute person [rw]
  #   @return [Person]
  has_one(:person)

  # @!attribute account [rw]
  #   @return [Account]
  has_one(:account)

  # @!attribute merchant [rw]
  #   @return [Merchant]
  has_one(:merchant)

  # @!endgroup Associations

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.icon_class()
    return "mdi mdi-cash"
  end

end
