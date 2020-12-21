Given('I am on Home screen') do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When(/^I press on menu icon$/) do
  find_element(accessibility_id: "Open navigation drawer").click
end

Then(/^I land on "([^"]*)" screen$/) do |title|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{title}']" )
end

And(/^I see no personal conversion created yet$/) do
  find_element(id: "btn_new_custom_conversion")
  find_element(id: "text_info_no_custom_conversions")
end

Then(/^I select "([^"]*)" from menu$/) do |button|
  text(button).click
end

And(/^I see message to select conversions as favorite$/) do
  message = find_element(id: "text_info_favorites").text
  assert_equal "Select conversions as favorite and they will appear here", message
end

