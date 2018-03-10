require 'test_helper'

class ChoisesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get choises_create_url
    assert_response :success
  end

  test "should get destroy" do
    get choises_destroy_url
    assert_response :success
  end

end
