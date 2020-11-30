Then('Left unit picker value should be {string}') do |string|
  log('Left unit picker value is ' + string)
end

Then('Right unit picker value should be {string}') do |string|
  log('Right unit picker value is ' + string)
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