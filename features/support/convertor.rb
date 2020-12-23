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