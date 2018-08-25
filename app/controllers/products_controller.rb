require "csv"

class ProductsController < ApplicationController
  
  def sales_price
    @products = fetch_products
  end


  def list
    @products = fetch_products
  end

  def detail
      @products = fetch_products
      @product = @products.find {|c| c.id == params[:id].to_i }
  end

  def fetch_products
    @products =[]
    counter = 1
    CSV.foreach(Rails.root + "vendor/faust_inventory.csv", headers: true) do |row|

    product = Product.new
    product.id = counter
    product.item = row.to_h["item"]
    product.description = row.to_h["description"]
    product.condition = row.to_h["condition"]
    product.dimension_w = row.to_h["dimension_w"]
    product.dimension_l = row.to_h["dimension_l"]
    product.dimension_h = row.to_h["dimension_h"]
    product.quantity = row.to_h["quantity"]
    product.category = row.to_h["category"]
    product.price = row.to_h["price"]
    product.sales_price = row.to_h["sales_price"]
    
      @products << product
      counter += 1
    end
    @products
  end
    

end
