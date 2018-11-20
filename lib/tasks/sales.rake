namespace :sales do
  desc "Generate random sales"
  task random: :environment do
    loop do
      # Random price between 2000 and 35000
      price             = rand(2000..35000)
      # Random Origin city
      origin_city       = City.order(Arel.sql('random()')).limit(1).pluck(:id).first
      # Random Destination city <> Origin city
      destination_city  = City.where('id <> ?', origin_city).order(Arel.sql('random()')).limit(1).pluck(:id).first

      # Create new sales
      Sale.new(
        origin_id: origin_city,
        destination_id: destination_city,
        price: price
      ).save

      # Sleep random time between 1 and 5 seconds
      sleep(rand(1..5))
    end
  end
end
