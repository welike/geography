class GeographyGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.migration_template 'migration:migration.rb', "db/migrate", {:assigns => continents_assigns,
        :migration_file_name => "create_continents"
       }
    end
  end

  private
    def custom_file_name
      custom_name = class_name.underscore.downcase
      custom_name = custom_name.pluralize if ActiveRecord::Base.pluralize_table_names
    end

    def continents_assigns
      returning(assigns = {}) do
        assigns[:migration_action] = "create"
        assigns[:class_name] = "CreateContinents"
        assigns[:table_name] = "continents"
        assigns[:attributes] = [Rails::Generator::GeneratedAttribute.new("name", "string")]
        assigns[:attributes] << Rails::Generator::GeneratedAttribute.new("description", "string")
        assigns[:attributes] << Rails::Generator::GeneratedAttribute.new("iso_3166_code", "string")
      end
    end
end