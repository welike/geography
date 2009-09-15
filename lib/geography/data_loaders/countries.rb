require 'open-uri'

class Geography::DataLoaders::Countries
  def self.load(source, filename)
    if source == 'wikipedia'
      Geography::DataLoaders::Countries.load_from_wikipedia_file(filename)
    end
  end
  
  def self.load_from_wikipedia_file(filename)
    puts "Loading Countries from wikipedia file #{filename}"
    count_updated = 0
    count_new = 0

    # Load the common names of countries
    openconcept_url = "http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt"
    puts "Loading Countries common names from #{openconcept_url}"
    common_names = Geography::DataLoaders::Countries.load_common_names_from_openconcept_webfile(openconcept_url)
    
    # Load the countries from the wikipedia file
    data = File.open(filename).readlines
    data.each do |line|
      items = line.split(' ', 5)
      c = Country.find_by_official_name(items[4].chomp)
      if c
        #puts "Country '#{items[4].chomp}' already exists!"
        c.continent = Continent.find_by_iso_3166_code(items[0])
        count_updated += 1
      else
        #puts "Creating new country '#{items[4].chomp}'"
        c = Country.new(:official_name => items[4].chomp, 
                         :iso_3166_continent_alpha_code => items[0],
                         :iso_3166_1_alpha_2 => items[1],
                         :iso_3166_1_alpha_3 => items[2],
                         :iso_3166_1_numeric_code => items[3]
                         )
        c.continent = Continent.find_by_iso_3166_code(items[0])
        count_new += 1
      end
      c.name = common_names[c.iso_3166_1_alpha_2] ? common_names[c.iso_3166_1_alpha_2] : c.official_name
      c.save
    end
    
    puts "Load stats: Countries, #{count_new} new, #{count_updated} updated"
  end
  
  def self.load_common_names_from_openconcept_webfile(url)
    common_names = {}
    open(url) do |countries|
      countries.read.each_line do |country|
        code, name = country.chomp.split("|")
        common_names[code] = name
      end
    end
    return common_names
  end
end