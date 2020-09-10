require "test_helper"

module Tests
  module Models
    class BookmarkTest < ActiveSupport::TestCase

      def bookmark_machine_data()
        # @created_at=2018-04-30 16:58:36 -0500,
        # @folders=["Bookmarks Bar", "Misc", "VBI", "misc", "Test"],
        # @icon=nil,
        # @name="Continuous Testing for Open Source Projects | Sauce Labs",
        # @tags=nil,
        # @updated_at=2018-04-30 16:58:36 -0500,
        # @url="https://saucelabs.com/open-source"
      end

    end
  end
end
