require 'spec_helper'
# require 'rest-client'

describe 'Addresses API', type: :request do
  it 'should get a Stubbed request based on uri only and with the default response' do
    full_address = 'Julie-Wolfthorn-Straße 1, Berlin'

    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(full_address)}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"

    stub_request(:get, url).
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: "", headers: {})
  end
end

# expect(Gexpect(GeoApiCLient).to receive(:get).and_return({}) # allows us to test an empty response
# expect(GeoApiCLient).to receive(:get).and_return({"error_message"=>"This API project is not authorized to use this API.", "results"=>[], "status"=>"REQUEST_DENIED"}) # allows to test the exceptions rescuing
# expect(GeoApiCLient).to receive(:get).and_return(valid_responce) # allows to test the normal response without making a real requestApiCLient).to receive(:get).and_return(valid_responce) # allows to test the normal response without making a real request
