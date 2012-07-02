class NewOrderAction < Cramp::Action

  use_fiber_pool do |pool|
    # Called everytime after a fiber is done a callback
    pool.generic_callbacks << proc { ActiveRecord::Base.clear_active_connections! }
  end

  def start
    order = Order.create(
        :client_id => 1,
        :user_id => 1,
        :description => 'Probando 1 2 3',
        :created_at => DateTime.now
    )
    render order.to_json
    finish
  end

end