class Country::COUNTRY

    attr_accessor :name, :currencies, :languages, :flag, :population, :capital, :region, :subregion
    
    @@all = []
    
    def initialize(attr_hash)
        attr_hash.each do |attribute, value|
            # binding.pry
            if self.respond_to?(attribute)
                self.send(("#{attribute}="), value)
            end
        end
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
    def self.all_country_names
        # binding.pry
        self.all.each_with_index do |country, i|
            puts "#{i+1}. #{country.name}" 
        end
    end
    
    def self.search_by_name(name)
        self.all.detect{|country| country.name == name}
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
end 