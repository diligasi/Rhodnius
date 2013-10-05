class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name
      t.string :host
      t.string :port
      t.string :camera_user
      t.string :camera_user_password
      t.text   :description

      t.timestamps
    end
  end
end
