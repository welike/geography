class Geography::DataLoaders::Continents
  def self.load(source, filename=nil)
    if source == 'internal'
      Geography::DataLoaders::Continents.load_from_internal
    end
  end
    
  def self.load_from_internal
    puts "Loading Continents from internal"
    # We currently don't read from a source since the values are so low in quantity.
    # This might change in the future if we decide to add a significant amount of data for
    # continents, such as statistics, etc.

    count_updated = 0
    count_new = 0
    
    continents = [
      { :name => 'Africa', :iso_3166_code => 'AF' },
      { :name => 'Antararctica', :iso_3166_code => 'AN' },
      { :name => 'Asia', :iso_3166_code => 'AS' },
      { :name => 'Europe', :iso_3166_code => 'EU' },
      { :name => 'North America', :iso_3166_code => 'NA' },
      { :name => 'South America', :iso_3166_code => 'SA' },
      { :name => 'Oceania', :iso_3166_code => 'OC' }
    ]
    
    continents.each do |continent|
      c = Continent.find_by_name(continent[:name])
      if c
        if continent[:description]
          c.description = continent[:description]
        end
        c.iso_3166_code = continent[:iso_3166_code]
        c.save
        count_updated += 1
      else
        c = Continent.create(continent)
        count_new += 1
      end
    end
    
    puts "Load stats: Continents, #{count_new} new, #{count_updated} updated"
  end
end