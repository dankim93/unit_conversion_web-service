require 'test_helper'

class UnitsControllerTest < ActionDispatch::IntegrationTest
  test "should get si" do
    get units_si_url
    assert_response :success
  end

end
