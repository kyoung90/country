class Country::COUNTRY

    attr_accessor :name, :currencies, :languages, :flag, :population, :capital, :region, :subregion
    
    @@all = []
    
    def initialize(attr_hash)
        attr_hash.each do |attribute, value|
            if self.respond_to?(attribute)
                self.send(("#{attribute}="), value)
            end
        end
        if self.capital == ""
            self.capital = "n/a"
        end 
        if self.region == ""
            self.region = "n/a"
        end 
        if self.subregion == ""
            self.subregion = "n/a"
        end 
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
    def self.all_country_names
        self.all.each_with_index do |country, i|
            puts "#{i+1}. #{country.name}" 
        end
    end
    
    def self.search_by_name(name)
        self.all.detect{|country| country.name.downcase == name.downcase}
    end 
    
    def info
        puts "Name: #{self.name}"
        puts "Capital: #{self.capital}"
        puts "Currencies: #{self.currencies}"
        puts "Languages: #{self.languages}"
        puts "Population: #{self.population}"
        puts "Flag: #{self.flag}"
        puts "Region: #{self.region}"
        puts "Subregion: #{self.subregion}"
    end 
    
    def self.search_by_suffix(suffix)
        self.all.detect{|country| country.name.match(/^(#{suffix})/)}
    end 
    
    def self.search_all_with_currency_symbol(currency_symbol)
        self.all.select do |country| 
            bool = false
            country.currencies.each do |currency_info|
                if currency_info["symbol"] == currency_symbol
                    bool = true
                end
            end 
            bool
        end 
    end 
    
    def self.search_all_with_currency_name(currency_name)
        self.all.select do |country| 
            bool = false
            country.currencies.each do |currency_info|
                if currency_info["name"] && currency_info["name"].downcase == currency_name.downcase
                    bool = true
                end
            end 
            bool
        end 
    end 
    
    def self.search_all_with_language(language)
        self.all.select do |country| 
            bool = false
            country.languages.each do |language_info|
                if language_info["name"] && (language_info["name"].downcase == language.downcase || language_info["nativeName"].downcase == language.downcase)
                    bool = true
                end
            end 
            bool
        end 
    end 
    
    def self.search_all_with_population(comparison, population)
        if comparison == "l" 
            self.all.select{|country| country.population < population}.sort_by{|country| country.population}
        elsif comparison == "g" 
            self.all.select{|country| country.population > population}.sort_by{|country| country.population}
        end 
    end 
    
    def self.search_by_capital(capital)
        self.all.detect{|country| country.capital.downcase == capital.downcase}
    end 
    
    def self.search_by_region(region)
        self.all.select{|country| country.region.downcase == region.downcase}
    end 
    
    def self.search_by_subregion(subregion)
        self.all.select{|country| country.subregion.downcase == subregion.downcase}
    end 
end 