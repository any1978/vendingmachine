class VendingMachine
  attr_reader :dispense_box
  attr_reader :refund_box
  attr_accessor :zaiko_count

  def initialize
    @zaiko_count = 1
  end

  def receive(coin)
    if has_zaiko()
      @dispense_box = "Cola"
      decrease_zaiko()
    else
      @refund_box = "100Yen"
    end
  end

  def has_zaiko()
    @zaiko_count > 0
  end

  def decrease_zaiko()
    @zaiko_count -= 1
  end

  def receive_zaiko()
    @zaiko_count += 1
  end
end