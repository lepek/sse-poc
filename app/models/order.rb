class Order < ActiveRecord::Base

  def self.find_orders_since(order)
    if order.nil?
      Order.all
    else
      Order.where('created_at > ?', order.created_at).order('created_at DESC')
    end
  end

end