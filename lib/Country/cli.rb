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
        while(user_input != 11)
            case user_input
            when 1
                list_all_country_names
            when 2
                search_by_name
            when 3
                search_by_suffix
            when 4
                search_by_currency_name
            when 5
                search_by_currency_symbol
            when 6
                search_by_language
            when 7
                puts "In development"
            when 8
                puts "In development"
            when 9
                puts "In development"
            when 10
                puts "In development"
            when 11
                puts "In development"
            when 12
            else
                puts "Option does not exist. Please enter a correct option."
            end 
            display_options
            user_input = gets.chomp.to_i
        end
        goodbye
    end 
    
    def display_options 
        puts "Enter an option (1-12): "
        puts "1. All country names"
        puts "2. Search country by name"
        puts "3. Search countries that start with given letter"
        puts "4. Search countries with given currency name"
        puts "5. Search countries with given currency symbol"
        puts "6. Search countries with given language"
        puts "7. Search countries with certain population"
        puts "8. All countries sorted by population(lowest or highest)"
        puts "9. Search by capital"
        puts "10. Search by region"
        puts "11. Search by subregion"
        puts "12. Exit"
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
    
    def search_by_currency_symbol
        puts "Please enter the currency symbol: "
        input = gets.chomp
        countries = Country::COUNTRY.search_all_with_currency_symbol(input)
        if countries
            countries.each do |country|
                country.info
                puts "\n"
            end 
        else 
            puts "No countries with given currency symbol were found."
        end 
    end 
    
    def search_by_currency_name
        puts "Please enter the currency name: "
        input = gets.chomp
        countries = Country::COUNTRY.search_all_with_currency_name(input)
        if countries
            countries.each do |country|
                country.info
                puts "\n"
            end 
        else 
            puts "No countries with given currency name were found."
        end 
    end 
    
    def search_by_language
        puts "Please enter a language: "
        input = gets.chomp
        countries = Country::COUNTRY.search_all_with_language(input)
        if countries
            countries.each do |country|
                country.info
                puts "\n"
            end 
        else 
            puts "No countries with given language were found."
        end
    end 
    
    def goodbye
        puts "Exited the gem. Have a nice day! =)"
    end 
end 

