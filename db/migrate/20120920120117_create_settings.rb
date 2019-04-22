class CreateSettings < ActiveRecord::Migration[4.2]
  def change
    create_table :settings do |t|
      t.attachment :bg
      t.references :user
    end
    add_index :settings, :user_id
  end
end
