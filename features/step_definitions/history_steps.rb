require "test/unit/assertions"
require "minitest/autorun"

And(/^I see no history right now$/) do
  message = find_element(id: "text_info_history").text
  assert_equal "No history right now", message
end