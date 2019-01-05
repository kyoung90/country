require_relative 'country'
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
        while(user_input != 12)
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
                search_by_certain_population
            when 8
                list_all_countries_sorted_by_population
            when 9
                search_by_capital
            when 10
                search_by_region
            when 11
                search_by_subregion
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
        puts "1. Display all country names"
        puts "2. Search country by name"
        puts "3. Search country by suffix"
        puts "4. Search countries with given currency name"
        puts "5. Search countries with given currency symbol"
        puts "6. Search countries with given language"
        puts "7. Search countries with certain population"
        puts "8. Display all countries sorted by population(ascending or descending)"
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
            puts "\n"
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
            puts "\n"
        else 
            puts "Country with given suffix not found."
        end 
    end 
    
    def search_by_currency_symbol
        puts "Please enter the currency symbol: "
        input = gets.chomp
        countries = Country::COUNTRY.search_all_with_currency_symbol(input)
        if countries.count > 0
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
        if countries.count > 0
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
        if countries.count > 0
            countries.each do |country|
                country.info
                puts "\n"
            end 
        else 
            puts "No countries with given language were found."
        end
    end 
    
    def search_by_certain_population
        puts "Greater(g) than or lower(l) than?"
        input = gets.chomp
        
        if input.downcase == "l" || input.downcase == "lower" || input.downcase == "g" || input.downcase == "greater" || input.downcase == "h" || input.downcase == "higher"
            puts "Enter population (ex: 10000): "
            population = gets.chomp.to_i
            countries = Country::COUNTRY.search_all_with_population(input, population)
            if countries.count > 0
                countries.each do |country|
                    country.info
                    puts "\n"
                end 
            else 
                puts "No countries with the specified population were found."
            end
        else
            puts "Wrong input. Please try again.\n"
            search_by_certain_population
        end 
    end 
    
    def list_all_countries_sorted_by_population
        puts "Ascending(a) or descending(d)?"
        input = gets.chomp
        if input == "d" 
            countries_sorted = Country::COUNTRY.all.sort{|country1, country2| country2.population <=> country1.population}
            countries_sorted.each do |country|
                country.info
                puts "\n"
            end 
        elsif input == "a" 
            countries_sorted = Country::COUNTRY.all.sort{|country1, country2| country1.population <=> country2.population}
            countries_sorted.each do |country|
                country.info
                puts "\n"
            end 
        else
            puts "Did not understand command. Please enter a or d."
            list_all_countries_sorted_by_population
        end
    end 
    
    def search_by_capital
        puts "Please enter the capital: "
        input = gets.chomp
        country = Country::COUNTRY.search_by_capital(input)
        if country
            country.info
            puts "\n"
        else 
            puts "Invalid capital. Please enter a valid capital."
        end
    end 
    
    def search_by_region
        puts "Please enter the region: "
        input = gets.chomp
        countries = Country::COUNTRY.search_by_region(input)
        if countries.count > 0
            countries.each do |country|
                country.info
                puts "\n"
            end
        else 
            puts "Invalid region. Please enter a valid region."
        end
    end
    
    def search_by_subregion
        puts "Please enter the subregion: "
        input = gets.chomp
        countries = Country::COUNTRY.search_by_subregion(input)
        if countries.count > 0
            countries.each do |country|
                country.info
                puts "\n"
            end
        else 
            puts "Invalid subregion. Please enter a valid subregion."
        end
    end
    
    def goodbye
        puts "Exited the gem. Have a nice day! =)"
    end 
end 

