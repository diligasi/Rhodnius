require 'test_helper'

class SetLanguageControllerTest < ActionController::TestCase
  test "should get english" do
    get :english
    assert_response :success
  end

  test "should get portuguese" do
    get :portuguese
    assert_response :success
  end

  test "should get spanish" do
    get :spanish
    assert_response :success
  end

  test "should get set_session_and_redirect" do
    get :set_session_and_redirect
    assert_response :success
  end

end
