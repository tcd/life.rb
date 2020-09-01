class ApplicationRecord < ActiveRecord::Base

  self.abstract_class = true

  self.implicit_order_column = "created_at"

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute id [rw]
  #   @return [Integer]

  # @!attribute created_at [rw]
  #   @return [Time]

  # @!attribute updated_at [rw]
  #   @return [Time]

  # @!endgroup Attributes

  # ==========================================================================
  # Instance Methods
  # ==========================================================================

  # @return [String]
  def display_name()
    return ""
  end

end
