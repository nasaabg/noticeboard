require 'test_helper'

class BannsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get revoke" do
    get :revoke
    assert_response :success
  end

end
