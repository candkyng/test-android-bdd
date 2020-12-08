Given('I am on Home screen') do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When(/^I press on menu icon$/) do
  find_element(accessibility_id: "Open navigation drawer").click
end

Then('I should see left side menu') do
  text("Unit Converter")
end

When('I press on My conversions button') do
  text("My conversions").click
end

Then('I land on My conversions screen') do
  text("My conversions")
end

And(/^I see no personal conversion created yet$/) do
  find_element(id: "btn_new_custom_conversion")
  find_element(id: "text_info_no_custom_conversions")
end