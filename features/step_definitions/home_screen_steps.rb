require "test/unit/assertions"
require "minitest/autorun"


Then('Left unit picker value should be {string}') do |string|
  actual_picker_text  = find_elements(id: "select_unit_spinner")[0].text
  assert_equal actual_picker_text, string
end

Then('Right unit picker value should be {string}') do |string|
  actual_picker_text  = find_elements(id: "select_unit_spinner")[1].text
  assert_equal actual_picker_text, string
end

Then(/^Show All button should be (enabled|disabled|undefined)$/) do |state|
  log('Show All button is ' + state)
end

When('I press on Clear button') do
  log('I press on Clear button')
end


When(/^I type ([^"]*) to target text field$/) do |target|
  log("target is " + target)
end

Then(/^I should see result as ([^"]*)$/) do |result|
  log("I see result " + result)
end

When(/^Change Left unit picker to "([^"]*)"$/) do |arg|
  log("Left unit picker is " + arg)
end

And(/^Change Right unit picker to "([^"]*)"$/) do |arg|
  log("Right unit picker is " + arg)
end

Then(/^I press on Add to Favorites icon$/) do
  find_element(id: "action_add_favorites").click
end

Then(/^I press on Favorite conversions$/) do
  text("Favorite conversions").click
end

And(/^I verify "([^"]*)" added to Favorite conversions list$/) do |unit_conversion|
  text(unit_conversion)
end

And(/^"([^"]*)" is not added to Favorite$/) do |unit_conversion|

end

When(/^I press on search button$/) do
  find_element(id: "action_search").click
end

And(/^I enter "([^"]*)" in search field$/) do |search_text|
  find_element(id: "search_src_text").send_keys(search_text)
end

And(/^I press return button on soft keyboard$/) do
  sleep(2)
  Appium::TouchAction.new.tap(x:0.99,y:0.99, count:1).perform
end

Then(/^I verify "([^"]*)" is the current conversion$/) do |conversion|
  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{conversion}']" )
end