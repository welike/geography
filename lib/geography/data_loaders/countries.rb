class Geography::DataLoaders::Countries
  def self.load_from_wikipedia_file(filename)
    count_updated = 0
    count_new = 0
    
    data = File.open(filename).readlines
    data.each do |line|
      items = line.split(' ', 5)
      c = Country.find_by_name(items[4].chomp)
      if c
        #puts "Country '#{items[4].chomp}' already exists!"
        c.continent = Continent.find_by_iso_3166_code(items[0])
        c.save
        count_updated += 1
      else
        #puts "Creating new country '#{items[4].chomp}'"
        c = Country.create(:name => items[4].chomp, 
                         :iso_3166_continent_alpha_code => items[0],
                         :iso_3166_1_alpha_2 => items[1],
                         :iso_3166_1_alpha_3 => items[2],
                         :iso_3166_1_numeric_code => items[3]
                         )
        c.continent = Continent.find_by_iso_3166_code(items[0])
        c.save
        count_new += 1
      end
    end
    
    puts "Load stats: Countries, #{count_new} new, #{count_updated} updated"
  end
end