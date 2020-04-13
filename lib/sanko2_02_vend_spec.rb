# cola/spec/lib/vending_machine_sperb

require 'vending_machine'

describe VendingMachine, "cola wo uru" do
  before do
    @vending_machine = VendingMachine.new
  end

  context "shoki" do
    it "cola ga detekuru" do
      expect(@vending_machine.dispense_box).to eq(nil)
      expect(@vending_machine.refund_box).to eq(nil)
    end
  end

  context "kado" do
    context "zaiko ari" do
      it "100 Yen ireruto cola ga detekuru" do
        coin = "100Yen"
        @vending_machine.receive(coin)
        expect(@vending_machine.dispense_box).to eq("Cola")
        expect(@vending_machine.refund_box).to eq(nil)
      end
    end

    context "zaiko ari" do
      it "2kai ireruto cola ha denai" do
        coin = "100Yen"
        @vending_machine.receive(coin)
        @vending_machine.receive(coin)
        expect(@vending_machine.dispense_box).to eq("Cola")
        expect(@vending_machine.refund_box).to eq("100Yen")
      end
    end
  end
end

describe VendingMachine, "zaiko wo tasu" do
  context "zaiko ga kara" do
    it "zaiko ga 1 ni naru" do
      vending_machine = VendingMachine.new
      vending_machine.zaiko_count = 0
      vending_machine.receive_zaiko
      expect(vending_machine.zaiko_count).to eq(1)
    end
  end
end