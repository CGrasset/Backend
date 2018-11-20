class Sale < ApplicationRecord
  belongs_to :origin_city, foreign_key: :origin_id, primary_key: :id, class_name: 'City'
  belongs_to :destination_city, foreign_key: :destination_id, primary_key: :id, class_name: 'City'
  validates :origin_id, :destination_id, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  after_create_commit :stream_to_channels

  def to_geoJSON
    {
      type: :FeatureCollection,
      features: [
        origin_city.to_geoJSON, destination_city.to_geoJSON,
        {
          type: :Feature,
          geometry: {
            type: :LineString,
            coordinates: [
              [origin_city.latitude, origin_city.longitude],
              [destination_city.latitude, destination_city.longitude]
            ]
          },
          properties: {
            name: "#{origin_city.name} - #{destination_city.name}",
            popupContent: "#{origin_city.name} - #{destination_city.name}"
          }
        }
      ]
    }
  end

  private
    def stream_to_channels
      SaleStreamJob.perform_later(self)
      SalesSummaryStreamJob.perform_later
    end
end
