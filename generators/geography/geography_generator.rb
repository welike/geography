class GeographyGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.template 'models/continent.rb', 'app/models/continent.rb'
      m.template 'models/country.rb', 'app/models/country.rb'
      m.template 'models/state.rb', 'app/models/state.rb'
      m.template 'models/region.rb', 'app/models/region.rb'
      m.template 'models/county.rb', 'app/models/county.rb'
      
      m.migration_template 'migrations/continents.rb', "db/migrate", :migration_file_name => "create_continents"
      m.migration_template 'migrations/countries.rb', "db/migrate", :migration_file_name => "create_countries"
      m.migration_template 'migrations/states.rb', "db/migrate", :migration_file_name => "create_states"
      m.migration_template 'migrations/regions.rb', "db/migrate", :migration_file_name => "create_regions"
      m.migration_template 'migrations/counties.rb', "db/migrate", :migration_file_name => "create_counties"
    end
  end

  private
    def custom_file_name
      custom_name = class_name.underscore.downcase
      custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names
    end

end