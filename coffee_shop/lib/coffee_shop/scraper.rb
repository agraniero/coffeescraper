class CoffeeShop::Scraper

    def self.scrape_coffee
        html = open('https://www.starbucks.com/menu/catalog/product?drink=brewed-coffee#view_control=product&drink=espresso&page=undefined')
        doc = Nokogiri::HTML(html)

        doc.css('div.category.drinks li a').each do |link|
            url = link.attr('href')
            name = link.css('span').text
            CoffeeShop::Coffee.new(name, url).save
        end
        scrape_coffee_details
    end

    def self.scrape_pastries
        
        html = open('https://www.starbucks.com/menu/catalog/product?food=bakery#view_control=product')
        doc = Nokogiri::HTML(html)

        doc.css('div.category.food li a').each do |link|
            url = link.attr('href')
            name = link.css('span').text
            CoffeeShop::Pastry.new(name, url).save
        end
        scrape_pastry_details
    end

    def self.scrape_coffee_details
        
        CoffeeShop::Coffee.all.each do |drink|
            html = open('https://www.starbucks.com' + drink.url)
            doc = Nokogiri::HTML(html)
            drink.description = doc.css('h2').text
        end
    end

    def self.scrape_pastry_details 
        CoffeeShop::Pastry.all.each do |pastry|
            html = open('https://www.starbucks.com' + pastry.url)
            doc = Nokogiri::HTML(html)
            pastry.description = doc.css('h2').text 
        end
    end
end
