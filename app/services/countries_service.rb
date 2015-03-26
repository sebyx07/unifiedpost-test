require 'singleton'
class CountriesService
  include Singleton

  def get_countries
    Country.translations
  end
end
