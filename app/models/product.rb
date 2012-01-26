class Product < ActiveRecord::Base
  validates_presence_of :name, :price, :description, :category_id, :subcategory_id
  has_many :line_items
  has_attached_file :photo, :styles => { :medium => "140x180>"}
  cattr_reader :per_page
  @@per_page = 20

  def self.find_products_for_sale
    find(:all, :order)
  end

end
