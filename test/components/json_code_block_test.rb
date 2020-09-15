require "test_helper"
require "view_component/test_case"

module Tests
  module Components
    class JSONCodeBlockTest < ViewComponent::TestCase

      test "component" do
        pretty_message = <<~TXT
          {
            "message": "Hey it's a message!"
          }
        TXT
        render_inline(JSONCodeBlock::Component.new(data: { message: "Hey it's a message!" }))
        assert_selector("pre.line-numbers")
        assert_selector("code.language-json")
        assert_text(pretty_message)
      end

    end
  end
end
