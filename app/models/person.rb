# Important People
class Person < ApplicationRecord

  # @!attribute photo [rw]
  #   @return [ActiveStorage::Attached::One]
  has_one_attached(:photo)

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute first_name [rw]
  #   @return [String]

  # @!attribute middle_name [rw]
  #   @return [String]

  # @!attribute last_name [rw]
  #   @return [String]

  # @!attribute name [rw]
  #   @return [String]
  validates("name", presence: true)

  # @!endgroup Attributes

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.icon_class()
    return "mdi mdi-human-male-female"
  end

  # ============================================================================
  # Instance Methods
  # ============================================================================

  # @return [String]
  def full_name()
    return [
      self.first_name,
      self.middle_name,
      self.last_name,
    ].join(" ")
  end

  # @return [String]
  def initials()
    return [
      self.first_name&.[](0),
      self.middle_name&.[](0),
      self.last_name&.[](0),
    ].join("")
  end

  # @return [String]
  def display_name()
    return self.full_name()
  end

  # @return [Boolean]
  def has_photo?()
    return self.photo.attached?()
  end

  # @return [String,nil]
  def photo_url()
    if self.has_photo?
      return self.photo.attachment.service_url()
    else
      return nil
    end
  end

end
