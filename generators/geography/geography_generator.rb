class GeographyGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      
      # Models
      m.template 'models/continent.rb', 'app/models/continent.rb'
      m.template 'models/country.rb', 'app/models/country.rb'
      m.template 'models/state.rb', 'app/models/state.rb'
      m.template 'models/region.rb', 'app/models/region.rb'
      m.template 'models/county.rb', 'app/models/county.rb'

      # Migrations
      # Individual migrations are temporarily unavailable due to Rails bug #487
      # (http://www.google.com/url?sa=t&source=web&ct=res&cd=36&url=https%3A%2F%2Frails.lighthouseapp.com%2Fprojects%2F8994%2Ftickets%2F487-migration-timestamp-clash-problems-with-generators&ei=ZievSunQBYzQtgOkj6TLCw&usg=AFQjCNGz1QBjpeupLXjphKCsB0uPYwD18w)
      # Using a combined migration file instead.
      m.migration_template 'migrations/combined_v1.rb', "db/migrate", :migration_file_name => "create_geography_tables"
      #m.migration_template 'migrations/continents.rb', "db/migrate", :migration_file_name => "create_continents"
      #m.migration_template 'migrations/countries.rb', "db/migrate", :migration_file_name => "create_countries"
      #m.migration_template 'migrations/states.rb', "db/migrate", :migration_file_name => "create_states"
      #m.migration_template 'migrations/regions.rb', "db/migrate", :migration_file_name => "create_regions"
      #m.migration_template 'migrations/counties.rb', "db/migrate", :migration_file_name => "create_counties"

      # Tasks
      m.template 'load_geography_tasks.rake', 'lib/tasks/load_geography_tasks.rake'
    end
  end

  private
    def custom_file_name
      custom_name = class_name.underscore.downcase
      custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names
    end

end