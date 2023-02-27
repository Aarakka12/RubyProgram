# Sales Tax calculator

class TaxCalculator
    Basic_Tax_Rate = 0.1
    Import_Tax_Rate = 0.05
    Rounding_Factor = 0.05
    
    
    def self.calculate_sales_tax(item)
        item.product? ? 0 :rounded_tax(item.price * Basic_Tax_Rate)
    end

    def self.calculate_import_tax(item)
        item.imported ? rounded_tax(item.price * Import_Tax_Rate):0
    end

    def self.rounded_tax(tax)
        (tax / Rounding_Factor).ceil * Rounding_Factor
    end
end

class Item
    attr_reader :name, :price, :quantity, :imported

    def initialize(name, price, quantity, imported: false)
        @name = name
        @price = price
        @quantity = quantity
        @imported = imported
    end

    def sales_tax
        TaxCalculator.calculate_sales_tax(self)
    end

    def import_tax
        TaxCalculator.calculate_import_tax(self)
    end

    def total_price
        price * quantity + sales_tax * quantity + import_tax * quantity
    end

    def to_s
        "#{quantity} #{name}: #{'%.2f' % total_price}"
    end

    def product?
        name =~ /book|chocolate|pills|medicine|tablets/
    end
end

class Receipt
    attr_reader :items

    def initialize(items)
        @items = items.map{|item| Item.new(item[:name], item[:price], item[:quantity], imported: item[:imported])}        
    end

    def total_sales_tax
        items.map{|item| item.sales_tax * item.quantity}.sum        
    end

    def total_cost
        items.map{|item| item.total_price}.sum
    end

    def to_s
        receipt = items.map(&:to_s).join("\n") 
        "Receipt: \n#{receipt}\nSales Taxes:#{'%.2f' %total_sales_tax}\nTotal: #{'%.2f' %total_cost}"       
    end
end

class InputReader
    def self.read_input
        input = ""
        loop do
            line = gets
            break if line.strip.empty?
            input += line
        end
        input
    end
end

class UserInput
    def self.user(input)
        items = []
        input.each_line do |line|
            line.match(/(?<quantity>\d+)(?<name>.+) at (?<price>\d+(\.\d{2})?)$/) do |m|
                quantity = m[:quantity].to_i
                name = m[:name]
                price = m[:price].to_f
                imported = name.include?("imported")

                items << {name: name, price: price, quantity: quantity, imported: imported}
            end
        end
        items
    end 
end

input = InputReader.read_input
items = UserInput.user(input)
receipt = Receipt.new(items)       

puts receipt
