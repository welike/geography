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
end