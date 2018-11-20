class SalesSummaryChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sales_summary'
  end

  def request
    SalesSummaryStreamJob.perform_later
  end

  def unsubscribed
    stop_all_streams
  end
end
