require "test_helper"

module Tests
  module Models
    class MojiTest < ActiveSupport::TestCase

      test ".parse_emoji_data" do
        data = file_fixture("smileys.txt").read
        Moji.parse_emoji_data(data)
        assert_equal(162, Moji.count)
      end

    end
  end
end
