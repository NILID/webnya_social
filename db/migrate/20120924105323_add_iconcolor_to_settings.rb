class AddIconcolorToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :icon_color, :string, default: '#FFFFFF'
    add_column :settings, :icon_size, :integer, default: 50
  end
end
