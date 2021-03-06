require "test/unit/assertions"
require "minitest/autorun"

And(/^I open History$/) do
  Appium::TouchAction.new.swipe(start_x:0.01,start_y:0.5,end_x:0.6,end_y:0.5,duration:600).perform
  if !exists { find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='Unit Converter']" ) }
    # try one more time if menu does not open
    Appium::TouchAction.new.swipe(start_x:0.01,start_y:0.5,end_x:0.6,end_y:0.5,duration:600).perform
  end
  find_menu_item("History").click

end

And(/^I see no history right now$/) do
  message = find_element(id: "text_info_history").text
  assert_equal "No history right now", message
end

When(/^I convert "([^"]*)" "([^"]*)" from "([^"]*)" to "([^"]*)"$/) do |conversion, value, leftUnit, rightUnit|
  convert_value(conversion,leftUnit,rightUnit,value)

end

Then(/^Conversion "([^"]*)" \("([^"]*)" to "([^"]*)"\) is listed \#(\d) in History$/) do |conversion, leftUnit, rightUnit, nth|
  sleep(1)
  history_items = find_elements(id: "history_single_line")
  index = nth.to_i - 1
  name = history_items[index].find_element(id: "history_item_hint").text

  assert_equal conversion, name
  units = history_items[index].find_element(id: "history_item_name").text

  if !units.start_with?(leftUnit)
    fail("left unit is not #{leftUnit}")
  end
  if !units.end_with?(rightUnit)
    fail("right unit is not #{rightUnit}")
  end

end


When(/^I click on conversion "([^"]*)" \("([^"]*)" to "([^"]*)"\) in the History$/) do |conversion, leftUnit, rightUnit|
  find_in_history(conversion, leftUnit, rightUnit).click
end

And(/^I should see source value "([^"]*)"$/) do |value|
  assert_equal value, source_value
end

When(/^I create a new custom conversion Weight2$/) do
  create_custom_conversion_data1
end

When(/^I click on "([^"]*)" in My Conversions$/) do |conversion|
  get_conversion_in_custom(conversion).click
end

When(/^I run conversions "([^"]*)" using default units$/) do |conversions_str|
  conversions = conversions_str.split(",")
  conversions.each do |conversion|
    convert_value_default_units(conversion,"1")
  end
end


And(/^I remove conversion "([^"]*)" \("([^"]*)" to "([^"]*)"\) from History$/) do |conversion, leftUnit, rightUnit|
  remove_conversion(conversion, leftUnit, rightUnit)
end

Then(/^conversion "([^"]*)" \("([^"]*)" to "([^"]*)"\) is not found in History$/) do |conversion, leftUnit, rightUnit|
  assert_nil find_in_history(conversion, leftUnit, rightUnit)
end

And(/^I press on Clear History button$/) do
  clear_history_button.click

end

Then(/^I see Delete history confirmation dialog$/) do
  text("Delete history?")
  text("All conversions will be deleted from history")
end

When(/^I press on ([^"]*) on Delete history confirmation dialog$/) do |button|
  delete_all_dialog_button(button).click

end
