namespace :geo do
  namespace :load do
    desc "Load all geography data"
    task :all => [:continents, :countries] do
    end
    
    desc "Load continents"
    task :continents => :environment do
      Geography::DataLoaders::Continents.load('internal')
    end
    
    desc "Load countries"
    task :countries => :environment do
      Geography::DataLoaders::Countries.load('wikipedia', 'db/raw/Wikipedia-countries_for_continents.tsv')
    end
  end
  
  desc "Statistics of the geography data"
  task :stats => :environment do
    puts "Geography Statistics"
    puts "========================="
    puts "Continents: #{Continent.count}"
    puts "Countries: #{Country.count}"
    puts "States / SubCountries: 0"
    puts "Regions: 0"
    puts "Counties: 0"
    puts "Cities: 0"
    puts "Postal Codes: 0"
    puts "========================="
  end
end