class Api::V1::AddressesController < Api::V1::BaseController
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def create
    # @address = Address.create(address_params)

    # Using service address_creator to parse the address and create the components:
    @address_api = AddressApiRequest.api_request(params[:full_address])
    @full_address = AddressParsingResponce.parse_address(@address_api)
    @address = Address.new(@full_address)

    if @address.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  # def address_params
  #   params.require(:address).permit(:full_address)
  # end

  def render_error
    render json: { errors: @address.errors.full_message }, status: unprocessable_entity
  end
end
