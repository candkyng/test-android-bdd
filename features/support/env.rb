require "appium_lib"

def opts
{
    caps: {
      deviceName: "Anyname",
      platformName: :android,
      app: (File.join(File.dirname(__FILE__ ),"PreciseUnitConversion.apk")),
      appPackage: "com.ba.universalconverter",
      appActivity: "MainConverterActivity",
      newCommandTimeout: 3600,
      automationName: "UiAutomator2"
    },
    appium_lib: {
        wait_timeout: 30,
        wait_interval: 1
    }
}
end

Appium::Driver.new(opts, true)
Appium.promote_appium_methods Object

def wait_explicitly(seconds)
  Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
end

def find_in_list(value)

  if !exists{ find_element(xpath: "//android.widget.TextView[@text='#{value}']") }

    # Scroll to the top
    3.times{ Appium::TouchAction.new.swipe(start_x:0.5,start_y:0.2,end_x:0.5,end_y:0.8,duration:600).perform }

    current_screen = get_source
    previous_screen = ""
    item = nil
    # Scroll down until target unit is found or it's the end of list when there is no update to the screen after scrolling
    until (exists{ find_element(xpath: "//android.widget.TextView[@text='#{value}']") }) || (current_screen == previous_screen) do
      Appium::TouchAction.new.swipe(start_x:0.5,start_y:0.8,end_x:0.5,end_y:0.2,duration:600).perform
      previous_screen = current_screen
      current_screen = get_source
    end

  end
  find_element(xpath: "//android.widget.TextView[@text='#{value}']").click
end