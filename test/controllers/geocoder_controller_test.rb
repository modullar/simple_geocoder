require 'test_helper'

class GeocoderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get geocoder_index_url
    assert_response :success
  end

end
