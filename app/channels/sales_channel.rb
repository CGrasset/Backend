class SalesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sales'
  end

  def request
  end

  def unsubscribed
    stop_all_streams
  end
end
