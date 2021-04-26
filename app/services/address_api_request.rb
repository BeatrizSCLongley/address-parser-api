require 'rest-client'

class AddressApiRequest
  def self.api_request(full_address)
    # URI.encode will deal with non-ASCII characters
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(full_address)}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    JSON.parse(RestClient.get(url, { accept: :json }))
  end
end
