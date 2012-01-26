class Subcategory < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name
  has_attached_file :photo, :styles => { :medium => "240x240>"}
end
