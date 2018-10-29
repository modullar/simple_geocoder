class GeocoderController < ApplicationController

  require 'net/http'

  before_action :authenticate_user!

  def index
  end

  def geocode
    response = Net::HTTP.get_response(built_req)
    determine_result(response)
    render 'geocoder/geocode'
  end

  def geocoder_params
    params.require(:geocoder).permit(:location_string)
  end

  private

  def built_req
    uri = URI('https://geocoder.api.here.com/6.2/geocode.json')
    get_params = {app_id: "gh55ocfueeAXQ2JSPW0n",
                  app_code: "L2n2DIL0EltSWjQ3eIE0FA",
                  searchtext: params[:location_string]}
    uri.query = URI.encode_www_form(get_params)
    uri
  end

  def determine_result(response)
    if response.code != "200"
      @result = "Sth went wrong, please contact the admin \n #{response}"
    else
      results = parse_result(response)
      if results && results&.count > 0
        @result = results.first["Location"]["DisplayPosition"]
        @result = "Result are here \n #{@result}"
      else
        @result = "No result were found try to modify your search"
      end
    end
  end

  def parse_result(res)
    JSON.parse(res.body)&.dig("Response")&.dig("View")&.first&.dig("Result")
  end

end
