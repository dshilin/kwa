class AddPhotoToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :photo_file_name, :string
    add_column :categories, :photo_content_type, :string
    add_column :categories, :photo_file_size, :integer
    add_column :categories, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :categories, :photo_updated_at
    remove_column :categories, :photo_file_size
    remove_column :categories, :photo_content_type
    remove_column :categories, :photo_file_name
  end
end
