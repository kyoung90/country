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
end 