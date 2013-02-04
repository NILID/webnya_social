require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user=users(:dima)
    @setting = settings(:sett_dima)
  end

  test "should show setting" do
    sign_in @user
    ability = Ability.new(@user)
    get :show, user_id: @user, id: @setting
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    ability = Ability.new(@user)
    ability.can? :edit, @setting

    get :edit, user_id: @user, id: @user.setting
    assert_response :success
  end

  test "should update setting" do
    sign_in @user
    ability = Ability.new(@user)
    ability.can? :update, @setting

    put :update, user_id: @user, id: @setting.id, setting: { icon_size: 43 }
    assert_redirected_to user_setting_path(@user)
  end

end
