class City < ApplicationRecord
  scope :search_name, ->(url_name) { where('url_name LIKE ?', "%#{url_name}%") }

  def to_geoJSON
    {
      type: :Feature,
      geometry: {
        type: :Point,
        coordinates: [longitude, latitude]
      },
      properties: {
        name: name
      }
    }
  end
end
