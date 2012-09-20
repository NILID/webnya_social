class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.attachment :bg
      t.references :user
    end
    add_index :settings, :user_id
  end
end
