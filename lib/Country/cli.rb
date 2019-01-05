require_relative 'country'
require 'pry'
require 'open-uri'
require 'json'
# CLI Controller
class Country::CLI

    def initialize()
       # Get all countries from API in JSON format
        page = open("https://restcountries.eu/rest/v2/all")
        countries = JSON.parse(page.read)
        # Parse JSON to objects
        countries.each do |country|
            Country::COUNTRY.new(country)
        end 
    end 
    
    def call
        puts "Information about countries around the world!"
        display_options
        user_input = gets.chomp.to_i
        while(user_input != 10)
            case user_input
            when 1
                list_all_country_names
            when 2
                search_by_name
            when 3
                search_by_suffix
            when 4
                puts "In development"
            when 5
                puts "In development"
            when 6
                puts "In development"
            when 7
                puts "In development"
            when 8
                puts "In development"
            when 9
                puts "In development"
            when 10
            else
                puts "Option does not exist. Please enter a correct option."
            end 
            display_options
            user_input = gets.chomp.to_i
        end
        goodbye
    end 
    
    def display_options 
        puts "Enter an option (1-10): "
        puts "1. All country names"
        puts "2. Search country by name"
        puts "3. Search countries that start with given letter"
        puts "4. Search countries with given currency symbol"
        puts "5. Search countries with given language"
        puts "6. Search countries with certain population: highest, lowest, higher or lower than a given"
        puts "7. search by capital"
        puts "8. search by region"
        puts "9. search by subregion"
        puts "10. exit"
    end 
    
    def list_all_country_names
        Country::COUNTRY.all_country_names
    end 
    
    def search_by_name 
        puts "Please enter the name: "
        input = gets.chomp
        country = Country::COUNTRY.search_by_name(input)
        if country
            country.info
        else 
            puts "Invalid name. Please list all the countries and choose a name from there."
        end 
    end 
    
    def search_by_suffix
        puts "Please enter the suffix: "
        input = gets.chomp
        country = Country::COUNTRY.search_by_suffix(input)
        if country
            country.info
        else 
            puts "Country with given suffix not found."
        end 
    end 
    
    def goodbye
        puts "Exited the gem. Have a nice day! =)"
    end 
end 

