require "appium_lib"

def caps
{ caps: {
      deviceName: "Anyname",
      platformName: "Android",
      app: (File.join(File.dirname(__FILE__ ),"PreciseUnitConversion.apk")),
      appPackage: "com.ba.universalconverter",
      appActivity: "MainConverterActivity",
      newCommandTimeout: 3600,
      automationName: "UiAutomator2"

}}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

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
    y1 = 0.2
    y2 = 0.8
  else
    y1 = 0.8
    y2 = 0.2
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


