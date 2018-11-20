class SalesSummaryStreamJob < ApplicationJob
  queue_as :default

  def perform
    from  = Time.now.beginning_of_day
    to    = Time.now.end_of_day
    sales = Sale.where('sales.created_at BETWEEN ? AND ?', from, to)
    ActionCable.server.broadcast 'sales_summary', { sales: sales.count, sum: sales.sum(:price) }
  end
end
