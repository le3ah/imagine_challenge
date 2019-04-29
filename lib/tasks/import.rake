require 'csv'

desc "Imports all data from CSV files"

task :all => :environment do
  CSV.foreach('./db/data/carriers.csv', :headers => true) do |row|
    Carrier.create!(row.to_h)
  end

  CSV.foreach('./db/data/clients.csv', :headers => true) do |row|
    Client.create!(row.to_h)
  end

  CSV.foreach('./db/data/policies.csv', :headers => true) do |row|
    Policy.create!(row.to_h)
  end
end
