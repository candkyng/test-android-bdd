require "test/unit/assertions"
require "minitest/autorun"

And(/^I open History$/) do
  find_element(accessibility_id: "Open navigation drawer").click
  find_menu_item("History").click
end

And(/^I see no history right now$/) do
  message = find_element(id: "text_info_history").text
  assert_equal "No history right now", message
end

When(/^I convert "([^"]*)" "([^"]*)" from "([^"]*)" to "([^"]*)"$/) do |conversion, value, leftUnit, rightUnit|
  find_element(accessibility_id: "Open navigation drawer").click
  find_menu_item(conversion).click
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{conversion}']" )
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(leftUnit)
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(rightUnit)
  digits = value.split("")
  digits.each do |digit|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{digit}']").click
  end
end

Then(/^Conversion "([^"]*)" \("([^"]*)" to "([^"]*)"\) is listed \#(\d) in History$/) do |conversion, leftUnit, rightUnit, nth|
  sleep(1)
  history_items = find_elements(id: "history_single_line")
  index = nth.to_i - 1
  name = history_items[index].find_element(id: "history_item_hint").text
  log(name)
  assert_equal conversion, name
  units = history_items[index].find_element(id: "history_item_name").text
  log(units)
  if !units.start_with?(leftUnit)
    fail("left unit is not #{leftUnit}")
  end
  if !units.end_with?(rightUnit)
    fail("right unit is not #{rightUnit}")
  end
  sleep(1)
end


Then(/^I see "([^"]*)" conversions in the history$/) do |conversion|
  pending
end

When(/^I click on conversion "([^"]*)" \("([^"]*)" to "([^"]*)"\) in the History$/) do |conversion, leftUnit, rightUnit|
  pending
end

And(/^I should see input value "([^"]*)"$/) do |value|
  pending
end

When(/^I create a new custom conversion Weight$/) do
  pending
end

When(/^I click on "([^"]*)" in My Conversions$/) do |conversion|
  pending
end

When(/^I run conversions "([^"]*)" using default units$/) do |conversions|
  pending
end

