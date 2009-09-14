class CreateContinents < ActiveRecord::Migration
  def self.up
    create_table :continents do |t|
      t.string :name, :null => false
      t.string :description, :null => true
      t.string :iso_3166_code, :null => false
      t.timestamps
    end    
  end

  def self.down
    drop_table :continents
  end
end
