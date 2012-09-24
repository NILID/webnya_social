class AddIconcolorToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :icon_color, :string
    add_column :settings, :icon_size, :integer
  end
end
