class CitiesService
  include Singleton

  def get_cities_names country_id
    cities = Cities.cities_in_country(country_id)

    big_cities = cities.values.select { |c| c.population && c.population > 20000 }

    big_cities.map { |c| c.name }
  end
end