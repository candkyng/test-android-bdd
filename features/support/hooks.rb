

Before do
  $driver.start_driver
end

After do |scenario|
  if scenario.failed?
    if !File.directory?("screenshots")
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screenshots", screenshot_name)
    $driver.screenshot(screenshot_file)

    log(%Q[<img src="#{screenshot_file}">])
  end
  $driver.driver_quit
end

AfterConfiguration do
  #cleanup screenshots directory
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end