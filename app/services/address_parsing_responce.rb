require 'rest-client'

class AddressParsingResponce
  def self.parse_address(geo_data)
    street = nil
    house_number = nil
    postcode = nil
    city = nil
    country = nil

    # Iterate over JSON to retrieve the right values for each variable
    address_components = geo_data['results'][0]['address_components']

    address_components.each do |component|
      if component['types'] == ['route']
        street = component['long_name']
      elsif component['types'] == ['street_number']
        house_number = component['long_name']
      elsif component['types'] == ['postal_code']
        postcode = component['long_name']
      elsif component['types'] == ['locality', 'political']
        city = component['long_name']
      elsif component['types'] == ['country', 'political']
        country = component['long_name']
      end
    end

    # instance variables to create the addresses
    full_address = geo_data['results'][0]['formatted_address']

    {
      full_address: full_address,
      street: street,
      house_number: house_number,
      postcode: postcode,
      city: city,
      country: country
    }
  end
end
