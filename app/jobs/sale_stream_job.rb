class SaleStreamJob < ApplicationJob
  queue_as :default

  def perform(sale)
    ActionCable.server.broadcast 'sales', sale.to_geoJSON
  end
end
