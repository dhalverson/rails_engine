require 'csv'    
desc 'Import CSV'
task :import => :environment do


  CSV.foreach(filename, :headers => true) do |row|
    Moulding.create!(row.to_hash)
  end
end

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end