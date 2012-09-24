class AddIconcolorToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :icon_color, :string
  end
end
