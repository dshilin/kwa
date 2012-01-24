class Category < ActiveRecord::Base
  belongs_to :product
  has_many :subcategories
  validates_presence_of :name
  has_attached_file :photo
end