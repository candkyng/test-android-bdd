Before do
  log("Before hook is executed")
  $driver.start_driver
end

After do
  log("After hook is executed")
  sleep 3
  $driver.driver_quit
end
