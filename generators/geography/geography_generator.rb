class GeographyGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.migration_template 'continents.rb', "db/migrate", 
                      :migration_file_name => "create_continents"
    end
  end

  private
    def custom_file_name
      custom_name = class_name.underscore.downcase
      custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names
    end

end