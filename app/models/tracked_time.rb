class TrackedTime < ApplicationRecord

  # ==========================================================================
  # Attributes
  # ==========================================================================

  # @!group Attributes

  # @!attribute source [rw]
  #   One of:
  #
  #   - Harvest
  #   - Clockify
  #   @return [String]

  # @!attribute description [rw]
  #   @return [String]

  # @!attribute employer [rw]
  #   @return [String]

  # @!attribute client [rw]
  #   @return [String]

  # @!attribute project [rw]
  #   @return [String]

  # @!attribute task [rw]
  #   @return [String]

  # @!attribute timezone [rw]
  #   @return [String]

  # @!attribute date [rw]
  #   @return [Date]

  # @!attribute start_time [rw]
  #   @return [Time]

  # @!attribute end_time [rw]
  #   @return [Time]

  # @!attribute total_seconds [rw]
  #   @return [Integer]

  # @!attribute metadata [rw]
  #   @return [Hash]

  # @!endgroup Attributes

  # ==========================================================================
  # Scopes
  # ==========================================================================

  # @!group Scopes

  # ----------------------------------------------------------------------------
  # Sources
  # ----------------------------------------------------------------------------

  # @!method self.from_harvest()
  #   @return [ActiveRecord::Relation]
  scope(:from_harvest, -> { where(source: "Harvest") })

  # @!method self.from_clockify()
  #   @return [ActiveRecord::Relation]
  scope(:from_clockify, -> { where(source: "Clockify") })

  # @!group Scopes

  # ==========================================================================
  # Class Methods
  # ==========================================================================

  # @return [String]
  def self.icon_class()
    return "mdi mdi-timer"
  end

  # @param file [String,Pathname]
  # @return [void]
  def self.import_vbi_time_from_harvest_time(file)
    rows = Lib::FlatFile::CSV.from_file(file)
    rows.filter! { |row| row["Client"] == "VBI" }
    rows.each do |row|
      start_time = nil
      end_time   = nil
      unless row["Started At"].blank?
        start_time = Time.parse("#{row['Date']} #{row['Started At']}")
      end
      unless row["Ended At"].blank?
        end_time = Time.parse("#{row['Date']} #{row['Ended At']}")
      end
      self.create!(
        metadata:      row.to_h,
        source:        "Harvest",
        employer:      "VBI",
        client:        row["Project"],
        description:   row["Notes"],
        date:          Date.parse(row["Date"]),
        total_seconds: (row["Hours"].to_f * 60 * 60).floor,
        start_time:    start_time,
        end_time:      end_time,
      )
    end
  end

  # ============================================================================
  # Instance Methods
  # ============================================================================

  # @return [String]
  def duration_string()
    return Time.at(self.total_seconds).utc.strftime("%H:%M:%S") # .sub(/00:(?=\d\d:\d\d)/, "")
  end

end
