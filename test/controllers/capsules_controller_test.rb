require 'test_helper'

class CapsulesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get capsules_create_url
    assert_response :success
  end

  test "should get destoy" do
    get capsules_destoy_url
    assert_response :success
  end

end
