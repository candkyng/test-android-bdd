def left_spinner_selected_text
  return find_elements(id: "select_unit_spinner")[0].text
end

def right_spinner_selected_text
  return find_elements(id: "select_unit_spinner")[1].text
end

def source_value
  return find_element(id: "source_value").text
end

def target_value
  return find_element(id: "target_value").text
end

def switch_unit_button
  return find_element(accessibility_id: "Swap units")
end

def show_all_button
  return find_element(id: "btn_show_all")
end

def tap_key(value)
  digits = value.split("")
  digits.each do |digit|
    find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{digit}']").click
  end
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