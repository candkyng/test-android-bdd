def find_in_history(conversion, leftUnit, rightUnit)
  # scroll down only if not found
  y1 = 0.8
  y2 = 0.2

  current_screen = get_source
  previous_screen = ""
  until (current_screen == previous_screen) do
    sleep(1)
    # find item in current history screen
    history_items = find_elements(id: "history_single_line")
    history_items.each do |history_item|
      name = history_item.find_element(id: "history_item_hint").text
      if name == conversion
        units = history_item.find_element(id: "history_item_name").text
        if units.start_with?(leftUnit) && units.end_with?(rightUnit)
          return history_item
        end
      end
    end
    # end find
    Appium::TouchAction.new.swipe(start_x:0.5,start_y:y1,end_x:0.5,end_y:y2,duration:600).perform
    previous_screen = current_screen
    current_screen = get_source
  end

end

def remove_conversion(conversion, leftUnit, rightUnit)
  this_conversion = find_in_history(conversion, leftUnit, rightUnit)
  this_conversion.find_element(id: "deleteIcon").click
end

def clear_history_button
  return find_element(id: "btn_clear_history")
end

def delete_all_dialog_button(text)
  return find_element(xpath: "//android.widget.Button[@text='#{text}']")
end

