require "test_helper"
require "view_component/test_case"

module Tests
  module Components
    class ExampleTest < ViewComponent::TestCase

      test "component renders something useful" do
        c = render_inline(Example::Component.new(title: "my title", content: "Hello, Components!"))
        assert_text("Hello, Components!")
        assert_selector("[title='my title']")
        assert_equal(%(<span title="my title">Hello, Components!</span>\n), c.to_html)
      end

    end
  end
end
