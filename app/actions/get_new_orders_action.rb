class GetNewOrdersAction < Cramp::Action
  self.transport = :sse

  use_fiber_pool do |pool|
    # Called everytime after a fiber is done a callback
    pool.generic_callbacks << proc { ActiveRecord::Base.clear_active_connections! }
  end

  periodic_timer :start, :every => 10

  def start
    @latest_order ||= nil
    new_orders = Order.find_orders_since(@latest_order)
    unless new_orders.empty?
      @latest_order = new_orders.first
      render new_orders.to_json
    else
      render 'No new orders'
    end
  end

end