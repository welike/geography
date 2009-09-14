require File.dirname(__FILE__) + '/test_helper.rb'

class CountryTest < Test::Unit::TestCase
  load_schema 
  
  def test_woodpecker 
    assert_kind_of Country, Country.new 
  end
end 