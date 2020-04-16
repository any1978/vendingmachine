

# require_relative 'vending_machine.rb'

class Drink
  attr_reader :name,:price

  # def initialize(attributes)
  #   @name = attributes.fetch(:name,'nil')
  #   @price = attributes.fetch(:price,'nil')
  # end

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    self.new(:cola,120)
  end

  # def self.redbull
  #   self.new(:redbull,200)
  # end

  # def self.water
  #   self.new(:water,100)
  # end

end


# class Drink < VendingMachine
#     # def initialize(name,price)
#     #   @name = name
#     #   @price = price
#     # end
#     #
#     # def cola
#     # end

#     attr_reader :name, :price
    
#     def self.cola
#       self.new 120, :cola
#     end


#     #初期値
#     def initialize (price:, name:)
#       sel.name = name
#       selfprice = price
#     end
    
#     def info
#       return "#{self.name} #{self.price}円 "
#     end

