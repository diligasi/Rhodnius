class AddTypeAndFullUrlToCameras < ActiveRecord::Migration
  def change
    add_column :cameras, :type, :string
    add_column :cameras, :full_url, :string
  end
end
