require_relative 'test_vending_machine.rb'

class Drink < VendingMachine
    # def initialize(name,price)
    #   @name = name
    #   @price = price
    # end
    #
    # def cola
    # end

    attr_reader :name, :price
    
    def self.cola
      self.new 120, :cola
    end


    #初期値
    def initialize (price:, name:)
      sel.name = name
      selfprice = price
    end
    
    def info
      return "#{self.name} #{self.price}円 "
    end


  end