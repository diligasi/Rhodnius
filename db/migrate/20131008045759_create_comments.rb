class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.text :comment
      t.references :camera

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :camera_id
  end
end
