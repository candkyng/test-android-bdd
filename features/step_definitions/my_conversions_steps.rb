Given(/^I open My conversions$/) do
  find_element(accessibility_id: "Open navigation drawer").click
  find_menu_item("My conversions").click
end

When(/^I press on Create Your First Conversion button$/) do
  create_custom_conversion_link.click

end

Then(/^I enter "([^"]*)" as Conversion Name$/) do |name|
  new_conversion_name_text_field.click
  new_conversion_name_text_field.send_keys(name)
end

When(/^I press on New Unit button$/) do
  new_unit_button.click

end

Then(/^I enter "([^"]*)" as Name$/) do |name|
  new_unit_name.send_keys(name)
end

And(/^I enter "([^"]*)" as Symbol$/) do |symbol|
  new_unit_symbol.send_keys(symbol)
end

And(/^I enter "([^"]*)" as Value$/) do |value|
  new_unit_value.send_keys(value)
end

And(/^I press on checkmark on top right corner$/) do
  new_unit_confirm.click

end

And(/^I press on OK button$/) do
  new_conversion_confirm.click

end

Then(/^I see "([^"]*)" listed in My Conversions$/) do |conversion|
  get_conversion_in_custom(conversion)
end


