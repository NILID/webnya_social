require 'test_helper'

class MainControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user=users(:dima)
  end

  test "should get index" do
    sign_in @user
    ability = Ability.new(@user)

    get :index
    assert_response :success
  end

end
