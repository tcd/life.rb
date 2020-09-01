require "test_helper"

module Tests
  module Lib
    class UtilTest < ActiveSupport::TestCase

      test ".get_credential" do
        secret_key_base = Rails.application.credentials.dig(Rails.env.to_sym, :secret_key_base)
        assert_equal(secret_key_base, ::Lib::Util.get_credential(:secret_key_base), "::Lib::Util.get_credential failed")
      end

      test ".get_credential raises no exceptions when a credential doesn't exist" do
        assert_nil(::Lib::Util.get_credential(:fake_value, :nested, :deeply_nested))
      end

    end
  end
end
