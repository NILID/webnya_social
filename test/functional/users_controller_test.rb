require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = users(:dima)
  end

  test "should not get index" do
    get :index
    assert_response 302
  end

  test "should not get show" do
    get :show, id: @user
    assert_response 302
  end

  test "should get index if reg user is owner" do
    sign_in @user
    ability = Ability.new(@user)
    assert ability.can? :index, User

    get :index
    assert_response :success
  end

  test "should get show if reg user is owner" do
    sign_in @user
    ability = Ability.new(@user)
    assert ability.can? :show, User

    get :show, id: @user
    assert_response :success
  end


end
