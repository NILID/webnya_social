class AddIconcolorToSettings < ActiveRecord::Migration[4.2]
  def change
    add_column :settings, :icon_color, :string, default: '#FFFFFF'
    add_column :settings, :icon_size, :integer, default: 50
  end
end
