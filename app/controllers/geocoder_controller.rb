class GeocoderController < ApplicationController

  require 'net/http'

  before_action :authenticate_user!

  def index
  end

  def geocode
    uri = URI('https://geocoder.api.here.com/6.2/geocode.json')
    get_params = {app_id: "gh55ocfueeAXQ2JSPW0n", app_code: "L2n2DIL0EltSWjQ3eIE0FA", searchtext: params[:location_string]}
    uri.query = URI.encode_www_form(get_params)
    res = Net::HTTP.get_response(uri)
    if res.code != "200"
      @result = "Sth went wrong, please contact the admin \n #{res.code}"
    else
      @result = "Result are here \n #{res.code}"
    end

    render 'geocoder/geocode'
  end

  def geocoder_params
    params.require(:geocoder).permit(:location_string)
  end

  private

  def parse_result(res)
    
  end

end
