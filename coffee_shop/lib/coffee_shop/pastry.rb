class CoffeeShop::Pastry

    attr_accessor :name, :description, :url

    @@all =[]

    def initialize(name, url)
        @name = name
        @url = url
    end 

    def save
		@@all << self
	end
	
	def self.all
		@@all
	end

	def self.clear_all
		@@all.clear
	end

end