class Category < ActiveRecord::Base
  has_many :subcategories
  validates_presence_of :name
  has_attached_file :photo, :styles => { :medium => "240x240>"}
end
