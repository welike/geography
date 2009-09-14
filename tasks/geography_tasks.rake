namespace :geo do
  namespace :load do
    desc "Load countries from a file"
    task :countries => :environment do
      Geography::DataLoaders::Countries.load_from_wikipedia_file('db/raw/Wikipedia-countries_for_continents.tsv')
    end
  end
end