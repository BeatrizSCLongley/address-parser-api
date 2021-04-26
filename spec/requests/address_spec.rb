require 'spec_helper'
# require 'rest-client'

feature 'External request' do
  let(:full_address) { 'Julie-Wolfthorn-Straße 1, Berlin' }

  it 'queries full address on Google Geocoding API' do
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(full_address)}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"

    response = Net::HTTP.get(url)

    expect(response).to be_an_instance_of(String)
  end
end

# expect(Gexpect(GeoApiCLient).to receive(:get).and_return({}) # allows us to test an empty response
# expect(GeoApiCLient).to receive(:get).and_return({"error_message"=>"This API project is not authorized to use this API.", "results"=>[], "status"=>"REQUEST_DENIED"}) # allows to test the exceptions rescuing
# expect(GeoApiCLient).to receive(:get).and_return(valid_responce) # allows to test the normal response without making a real requestApiCLient).to receive(:get).and_return(valid_responce) # allows to test the normal response without making a real request
