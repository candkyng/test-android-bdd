When(/^I press on Create Your First Conversion button$/) do
  find_element(id: "btn_new_custom_conversion").click
  sleep(1)
end

Then(/^I enter "([^"]*)" as Conversion Name$/) do |name|
  find_element(id: "edit_custom_conversion_category_name").click
  find_element(id: "edit_custom_conversion_category_name").send_keys(name)
end

When(/^I press on New Unit button$/) do
  find_element(id: "btn_new_custom_unit").click
  sleep(1)
end

Then(/^I enter "([^"]*)" as Name$/) do |name|
  find_element(id: "edit_custom_conversion_unit_dtls_name").send_keys(name)
end

And(/^I enter "([^"]*)" as Symbol$/) do |symbol|
  find_element(id: "edit_custom_conversion_unit_dtls_symbol").send_keys(symbol)
end

And(/^I enter "([^"]*)" as Value$/) do |value|
  find_element(id: "edit_custom_conversion_unit_dtls_value").send_keys(value)
end

And(/^I press on checkmark on top right corner$/) do
  find_element(id: "action_confirm_custom_unit").click
  sleep(1)
end

And(/^I press on OK button$/) do
  find_element(id: "btn_custom_conversion_details_ok").click
  sleep(1)
end

Then(/^I see "([^"]*)" listed in My Conversions$/) do |conversion|
  text(conversion)
end

