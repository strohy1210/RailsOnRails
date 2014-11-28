require 'csv'
require 'pry'
namespace :import_stops_csv do
  task :create_stops => :environment do
    # binding.pry 
    csv_text = File.read('lib/tasks/stops.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Stop.create!(row.to_hash)
    end 
  end
end 