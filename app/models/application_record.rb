class ApplicationRecord < ActiveRecord::Base

  include Lib::Helpers::Stripper

  self.abstract_class = true

  self.implicit_order_column = "created_at"

  # https://github.com/rubiety/nilify_blanks
  nilify_blanks()

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
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.display_name()
    return self.name.pluralize
  end

  # @return [String]
  def self.icon_class()
    raise NotImplementedError
  end

  # ==========================================================================
  # Instance Methods
  # ==========================================================================

  # @return [String]
  def display_name()
    return ""
  end

end
