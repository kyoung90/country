require_relative 'country'
require 'open-uri'
require 'json'

# CLI Controller
class CountriesCli::COUNTRIESAPI
    
    def self.collect_countries_from_api
        # Get all countries from API in JSON format
        page = open("https://restcountries.eu/rest/v2/all")
        countries = JSON.parse(page.read)
        # Parse JSON to objects
        countries.each do |country|
            CountriesCli::COUNTRY.new(country)
        end 
    end 
    
end 