class ShopController < ApplicationController
  def index
    @products = Product.paginate :page => params[:page], :order => 'created_at DESC'
    @cart = find_cart
  end

def products_by_category
  @category = Category.find_by_id(params[:id])
  @subcategories = @category.subcategories
  render :layout => "sub"
  #@products = Product.paginate :page => params[:page], :conditions=>{:category_id => params[:id]}, :order => 'created_at DESC'
end

def products_by_subcategory
  @category=Subcategory.find_by_id(params[:id]).category
  @products = Product.paginate :page => params[:page], :conditions=>{:subcategory_id => params[:id]}, :order => 'created_at DESC'
  render :layout => "sub"
end

def checkout
@cart = find_cart
if !logged_in?
redirect_to :controller => :sessions, :action => 'new'
end
end

def save_order
@cart = find_cart
@order = Order.new(params[:order])
@order.add_line_items_from_cart(@cart)
if @order.save
session[:cart] = nil
redirect_to_index("Спасибо за ваш заказ! Через некоторое время с Вами свяжется курьер." )
else
render :action => :checkout
end
end


  def add_to_cart
    begin
      product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid product #{params[:id]}" )
      redirect_to_index("Неправильный продукт" )
    else
    @cart = find_cart
    @current_item = @cart.add_product(product)
    respond_to { |format| format.js }
    end
  end
  
  def empty_cart
    session[:cart] = nil
    redirect_to_index
  end

end
