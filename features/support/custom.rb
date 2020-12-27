def create_custom_conversion_link
  return find_element(id: "btn_new_custom_conversion")
end

def new_conversion_name_text_field
  return find_element(id: "edit_custom_conversion_category_name")
end

def new_unit_button
  return find_element(id: "btn_new_custom_unit")
end

def new_unit_name
  return find_element(id: "edit_custom_conversion_unit_dtls_name")
end

def new_unit_symbol
  return find_element(id: "edit_custom_conversion_unit_dtls_symbol")
end

def new_unit_value
  return find_element(id: "edit_custom_conversion_unit_dtls_value")
end

def new_unit_confirm
  return find_element(id: "action_confirm_custom_unit")
end

def new_conversion_confirm
  return find_element(id: "btn_custom_conversion_details_ok")
end

def get_conversion_in_custom(conversion)
  list = find_elements(id: "custom_category_item_name")
  list.each do |item|
    if item.text == conversion
      return item
    end
  end
  fail("Cannot find conversion #{conversion}")
end

def create_custom_conversion_data1

    create_custom_conversion_link.click
    sleep(1)
    new_conversion_name_text_field.click
    new_conversion_name_text_field.send_keys("Weight2")
    new_unit_button.click
    sleep(1)
    new_unit_name.send_keys("Pound")
    new_unit_symbol.send_keys("lb")
    new_unit_value.send_keys("453.592")
    new_unit_confirm.click
    sleep(1)
    new_unit_button.click
    sleep(1)
    new_unit_name.send_keys("Gram")
    new_unit_symbol.send_keys("g" )
    new_unit_value.send_keys("1")
    new_unit_confirm.click

    sleep(1)
    new_conversion_confirm.click
    sleep(1)

end

