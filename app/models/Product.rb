class Product
  attr_accessor :item, :id, :description, :price, :condition, 
  :dimension_w, :dimension_l, :dimension_h, :quantity, :category,
  :sales_price


  def sales_price 
   if condition = "good"
    then
      sales_price = [(price * 0.90)]

    elsif condition = "average"
      sales_price = price * 0.80

    else price = "price"
    
    end
    
  end

  # @product

end