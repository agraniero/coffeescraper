class CoffeeShop::CLI

    def start
        puts ""
        puts "Hi, and Welcome to the Unofficial Coffee Shop!  Snoop around and learn about Starbucks' most delicious drinks and pastries.  Populating a menu..."
        CoffeeShop::Scraper.scrape_pastries
        CoffeeShop::Scraper.scrape_coffee
        #CoffeeShop::Scraper.scrape_coffee
        choose_menu
    end 

    def coffee
        CoffeeShop::Coffee.all.each.with_index(1) {|value, index| puts "#{index}: #{value.name}"}
        puts "To see an item's description please enter the item's index..."
        item_num = gets.chomp.to_i
        if item_num > 0 && item_num <= CoffeeShop::Coffee.all.size
            drink = CoffeeShop::Coffee.all[item_num.to_i-1]
            puts ""
            puts ""
            puts ""
            puts "Drink Name: #{drink.name}"
            puts ""
            puts ""
            puts "Details: #{drink.description}"
            puts ""
            puts ""
            puts "URL: Starbucks.com#{drink.url}"
            puts ""
            puts ""
            sleep(5)
            puts ""
            puts ""
            puts "Pretty cool, huh?"
            puts ""
            puts ""
        else   
            puts "Please enter a valid item number!"
            sleep(5)
            puts "repopulating the planet... i mean, the list.  sorry...i... must be out of coffee..."
            sleep(3)
            coffee
        end 
        go_again?
    end 

    def pastries
        CoffeeShop::Pastry.all.each.with_index(1) {|value, index| puts "#{index}: #{value.name}"}
        puts ""
        puts "To see an item's description please enter the item's index..."
        item_num = gets.chomp.to_i
        if item_num > 0 && item_num <= CoffeeShop::Pastry.all.size
            goodie = CoffeeShop::Pastry.all[item_num.to_i-1]
            puts ""
            puts ""
            puts ""
            puts "Pastry Name: #{goodie.name}"
            puts ""
            puts ""
            puts "Details: #{goodie.description}"
            puts ""
            puts ""
            puts "URL: Starbucks.com#{goodie.url}"
            puts ""
            puts ""
            sleep(5)
            puts ""
            puts ""
            puts "Pretty cool, huh?"
            puts ""
            puts ""
            
        else   
            puts "Please enter a valid item number!"
            sleep(5)
            puts "repopulating the planet... i mean the list.  sugar crash..."
            sleep(3)
            pastries
        end 
        go_again?
    end

    def go_again?
        puts "Oh... you're still here?"
        sleep(5)
        puts "That's cool."
        sleep(5)
        puts "I just finished my 4th coffee."
        sleep(1)
        puts "Do you like zebras?"
        sleep(1)
        puts "Oh... wait... hey did you want another round?  y/n?"
        answer = gets.chomp.capitalize
        if answer == 'Y'
            puts "Cool. Okay lemme loop you back to a method that does that..."
            puts ""
            choose_menu
        elsif answer == 'N'
            puts "Aww, rully?  KTHXBYEEE!"
            CoffeeShop::Coffee.all.clear
            CoffeeShop::Pastry.all.clear
        else   
            puts "Not sure what you mean... instant karma loop comin' atcha, chief..."
        go_again?
        end    
    end 

    def choose_menu    
        puts "(C)offee, or (P)astries?"
        input = gets.chomp
        if input.capitalize == 'C'
            coffee

        elsif input.capitalize == 'P'
            pastries

        else
            puts "I don't think I know what you mean..."
            sleep(3)
            puts "To view a menu of Starbucks' dope coffees, hit the 'c' key and then press enter..."
            sleep(5)
            puts "or..."
            sleep(1)
            puts "To excite the insulin producing organelles in your body by way of overexposure to a sweet list of Starbucks pastries... "
            sleep(5)
            puts "if you really wanna do that..."
            sleep(3)
            puts "..."
            sleep(2)
            puts "yeah um enter the 'p' key..."
            sleep(3)
            puts "then hit the enter key,"
            sleep(1)
            puts ".............................................................lil' dumb dumb, lolol"
            puts ''
            choose_menu
        end
    end



end
