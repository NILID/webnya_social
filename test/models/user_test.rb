require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user=users(:dima)
  end

  test "name should be less than 255 chars" do
    @user.login = 'a'*10
    assert !@user.valid?
    assert @user.errors[:login].any?
  end

  test "new user must has role 'user'" do
    user = User.new
    assert (user.role? :user)
  end

  test "user can be admin" do
    user = User.new
    assert (!user.role? :admin)
    user.roles_mask = 1
    assert (user.role? :admin)
  end

  test "login must be uniqueness" do
    user = User.new
    user.login = "dima"
    assert !user.valid?
    assert user.errors[:login].any?
  end

  test "user must have login" do
    @user.login = ""
    assert !@user.valid?
    assert @user.errors[:login].any?
  end

  test "user must have login with letters or integers" do
    @user.login = "%$#$sd"
    assert !@user.valid?
    assert @user.errors[:login].any?

    @user.login = "dima123"
    assert @user.valid?
    assert !@user.errors[:login].any?
  end


end
