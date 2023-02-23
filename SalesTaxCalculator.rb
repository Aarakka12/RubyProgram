# Sales Tax calculator
# food = [chocolate bar,chocolate box]
class Item
    attr_reader :name, :price, :tax_rate, :imported

    Basic_Tax_Rate = 0.1
    Import_Tax_Rate = 0.05
    Rounding_Factor = 0.05

    def initialize(name, price, tax_rate: Basic_Tax_Rate, imported: false)
        @name = name
        @price = price
        @tax_rate = tax_rate
        @imported = imported
    end

    def sales_tax
        product? ? 0:rounded_tax(price * tax_rate)
    end

    def import_tax
        imported ? rounded_tax(price * Import_Tax_Rate) : 0
    end

    def total_price
        price + sales_tax + import_tax
    end

    def to_s
        "#{name}: #{'%.2f'%total_price}"
    end

    private

    def product?
        name =~/book|chocolate|pills|medicine|tablets/
    end

    def rounded_tax(tax)
        (tax / Rounding_Factor).ceil * Rounding_Factor
    end
end

class Receipt
    attr_reader :items

    def initialize(items)
        @items = items        
    end

    def total_sales_tax
        items.map(&:sales_tax).sum        
    end

    def total_cost
        items.map(&:total_price).sum
    end

    def to_s
        receipt = items.map(&:to_s).join("\n") 
        "Receipt: \n#{receipt}\nSales Taxes:#{'%.2f' %total_sales_tax}\nTotal: #{'%.2f' %total_cost}"       
    end
end

items = []
puts "Enter n:"
n = gets.chomp.to_i
while n>0
    puts "Enter  item name:"
    name = gets.chomp.downcase
    # break if name ==  "done"

    puts "Enter item price:"
    price = gets.chomp.to_f

    items << Item.new(name, price)

    puts ""
    n-=1
end

receipt = Receipt.new(items)

puts receipt