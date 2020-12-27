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
        wait: 5,
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

def find_menu_item(value)
  item = find_menu_item_scroll(value,"up")
  if item.nil?
    item = find_menu_item_scroll(value,"down")
    if item.nil?
      fail("menu item #{value} not found.")
    end
  end
  return item
end

def find_menu_item_scroll(value,scroll_direction)
  if (scroll_direction == "up")
    y1 = 0.25
    y2 = 0.75
  else
    y1 = 0.75
    y2 = 0.25
  end
  current_screen = get_source
  previous_screen = ""
  until (current_screen == previous_screen) do
    menu_items = find_elements(id: "drawerCategoryName")
    menu_items.each do |menu_item|

      if (menu_item.text == value)
        return menu_item
      end
    end
    Appium::TouchAction.new.swipe(start_x:0.5,start_y:y1,end_x:0.5,end_y:y2,duration:600).perform
    previous_screen = current_screen
    current_screen = get_source
  end

end


