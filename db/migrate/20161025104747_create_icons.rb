class CreateIcons < ActiveRecord::Migration[4.2]
  def change
    create_table :icons do |t|
      t.string :title
      t.text :url
      t.integer :xposition
      t.integer :yposition
      t.string :icon

      t.timestamps
    end

    Icon.create!(title: 'Main', url: '/', xposition: 0, yposition: 0, icon: 'icon-home')
  end
end
