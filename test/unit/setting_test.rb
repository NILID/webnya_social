require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  def setup
    @sett=settings(:sett_dima)
  end

  test "icon_size must be 30..100" do
    @sett.icon_size = 29
    assert !@sett.valid?
    assert @sett.errors[:icon_size].any?
    @sett.icon_size = 101
    assert !@sett.valid?
    assert @sett.errors[:icon_size].any?
    @sett.icon_size = 80
    assert @sett.valid?
    assert !@sett.errors[:icon_size].any?
  end

  test "icon_size must be integer" do
    @sett.icon_size = 'sdf23'
    assert !@sett.valid?
    assert @sett.errors[:icon_size].any?
    @sett.icon_size = 80
    assert @sett.valid?
    assert !@sett.errors[:icon_size].any?
  end


  test "icon_color must be as css color" do
    @sett.icon_color = 'sdf'
    assert !@sett.valid?
    assert @sett.errors[:icon_color].any?
    @sett.icon_color = '#CCCCCC'
    assert @sett.valid?
    assert !@sett.errors[:icon_color].any?
  end

end
