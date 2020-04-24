require 'minitest/autorun'

# require "./lib/drink.rb"

class Drink 
  # < VendingMachine
  attr_reader :name,:price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    self.new(:cola,120)
  end

  def self.redbull
    self.new(:redbull,200)
  end

  def self.water
    self.new(:water,100)
  end

end


class VendingMachine
  # require_relative 'drink'

  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze
 # これで投入合計額、売上金額をメソッドで呼び出せる。
  attr_accessor :total, :sale_amount
  # :drink_table
    
    #[初期値]
    def initialize
      @total = 0
      @sale_amount = 0
      @drink_table = {}
      5.times { drink_stock Drink.cola }
      # v1.drink_table[0][:stock]で確認できる
    end
  
    #[お金を受け取る] 
    def insert(money)
      if VendingMachine::AVAILABLE_MONEY.include?(money)
        @total += money
      else
        puts "#{money}円は使えません"
      end
    end

    #[払い戻し]
    def refund     
      if @total == 0
        puts "払い戻すお金はありません"
        else
        puts "#{@total}円を払い戻し"
        @total = 0
      end
    end

    def drink_table
      @drink_table
    end

    #[ドリンクストック情報]
    #ハッシュにしたい。
    def stock_info
      @drink_table.map {|name, n| [name, { price: n[:price], stocks: n[:stocks].size }]}
    end


    # [ドリンクを在庫に入れる]　#v1.drink_stock(Drink.cola) で確認！
    def drink_stock(drink)
      unless @drink_table.has_key?(drink.name)
        @drink_table[drink.name] = { price: drink.price, stocks:[] }
      end
      @drink_table[drink.name][:stocks] << drink.name
    end
    
    def purchasable_drink
      @drink_table.select{|name, n| n[:price] <= total && n[:stocks].size >= 1 }.keys
    end

    #[引数に入れたドリンクは購入可能か？]　#購入可能ドリンクにそのドリンク名が含まれてるか確認
    def purchasable?(drink_name)
      purchasable_drink.include? drink_name
    end

    #[ドリンク購入]
    #@ドリンクテーブルの ドリンクネームのドリンクス情報の最後の部分取り出し、それをドリンクに代入する
    #売り上げ金額、合計金額計算→ドリンクと払い戻しを戻り値にする
    def purchase(drink_name)
      if purchasable?(drink_name)
        drink_price = @drink_table[drink_name][:price]
        @sale_amount += drink_price
        @total -= drink_price
        @drink_table[drink_name][:stocks].delete_at(0)
        [drink_name, refund]
      end
    end

    #[売り上げ確認]
    def sale_amount
      @sale_amount
    end

end

v1 = VendingMachine.new

    # def purchase
    #   #購入したいドリンクをドリンク名で選んでもらう。
    #   #購入可能ドリンクの表示

    #   if money_check && stock
    #     # total金額から購入する（選択した）ドリンクの料金を引く
    #     @total -= drink_table[:price]
    #     # 選んだドリンクのストックを1本減らす
    #     @drink_table[:stock] -= 1
    #     # 選んだドリンクの料金分売り上げが増える
    #     @sale_amount += drink_table[:price]
    #     # puts "残りは、#{@drink_table[:stock]}本です"
    #   else
    #     puts "購入できません"
    #   end
    # end


  end

  v = VendingMachine.new
  # d = Drink.new("water",100)
  d = Drink.new(name, price)






    # def drink_stock(drink)
    #   unless @drink_table.include?(Drink.name)
    #     @drink_stock[drink.name] = drink_table.select { |x| x[:name].include?(drink.name) }
    #   end
    #   #   @drink_stock[drink.name] = { price: drink.price, drinks: [] } 
    #   #   # @drink_table << { name: drink.name, price: drink.price, stock: 5 }.to_h
    #   # end
    #   # @drink_table[drink.name][:stock] << drink.name
      
    #[購入可能ドリンク]
    #ドリンク金額
    #投入した合計金額　且つ ドリンク情報以下のドリンクを選択して表示。keysを取り出す
    #投入した合計金額とドリンク情報より、価格が低い（購入可能な）ドリンク情報のkeyをセレクトして表示
    #バリューに情報を取り出す。priceキーの値（バリュー）を取り出す


    #購入する　  #投入金額は商品金額以上か？ #お釣り&在庫確認！！
#     def purchase
#         # puts "メニューの番号を選択してください"
#         # order = gets.chomp.to_i
#         # selected_menu = menus[order]
#         # puts "選択したメニュー: #{selected_menu.name}"
#         # puts "料金は#{selected_menu.price}円です"
#         # while true　　#purchases.each do |purchase|  #購入作業を繰り返す
#         # info[:price] <= total && info[:stock].size > 0

#         if @total >= @drink_table[:cola][:price][:size]
#           #購入できる
#           @total -= @drink_table[:cola][:price]  #total金額の減少
#           @drink_table[:cola][:stock] -= 1     #在庫の減少

#           puts "コーラを購入しました"
#           puts "もう一本購入しますか？"
#           @sales_amount += @drink_table[:cola][:price]
#           #お釣りが必要な場合は減少させる
#           # @stock_coin = 

#           #金額が足りない
#         else 
#           puts "金額が足りませんので商品を購入できません"
#           purchase = false
#           break
#         end
#       end
#     end
    


# #     #ドリンクラインナップ
    # drink1 = Drink.new(name: "cola", price: 120)
    # drink2 = Drink.new(name: "water", price: 100)
    # menus = [drink1, drink2]

# #     def info
# #       return "#{self.name} #{self.price}円 "
# #     end
  
# #     #メニュー表記
# #     index = 0
# #     menus.each do |menu|
# #       puts "#{index}. #{drink.info}"
# #       index += 1
# #     end

#     #購入する　  #投入金額は商品金額以上か？ #お釣り&在庫確認！！
#     def purchase
#       if stock_coin && drink_stock 

#         puts "メニューの番号を選択してください"
#         order = gets.chomp.to_i
    
#         selected_menu = menus[order]
#         puts "選択したメニュー: #{selected_menu.name}"
#         puts "料金は#{selected_menu.price}円です"

#         while true　　#purchases.each do |purchase|  #購入作業を繰り返す
#         if @total >= @drink_table[:cola][:price]
#           #購入できる
#           @total -= @drink_table[:cola][:price]  #total金額の減少
#           @drink_table[:cola][:stock] -= 1     #在庫の減少

#           puts "コーラを購入しました"
#           puts "もう一本購入しますか？"
#           @sales_amount += @drink_table[:cola][:price]
#           #お釣りが必要な場合は減少させる
#           # @stock_coin = 

#           #金額が足りない
#         else 
#           puts "金額が足りませんので商品を購入できません"
#           purchase = false
#           break
#         end
#       end
#     end
    






#     # #コインの枚数が減ったら教えてほしい 
#     # def stock_coin
#     #   if VendingMachine::AVAILABLE_MONEY[0].count >= 9 ||
#     #      VendingMachine::AVAILABLE_MONEY[1].count >= 1 ||
#     #      VendingMachine::AVAILABLE_MONEY[2].count >= 9 ||
#     #      VendingMachine::AVAILABLE_MONEY[3].count >= 1 
#     #   else
#     #     puts "釣り銭が足りません"
#     #   end
#     # end

#     #コーラはありますか？
  
#     def drink_stock
#       if @drink_table[:cola][:stock] == 0
#         puts "コーラは売り切れです"
#       else
#         puts "コーラ,価格:1本#{@drink_table[:cola][:price]}円,在庫:#{@drink_table[:cola][:stock]}本"
#       end
#     end



#       #在庫ストック増加
#     def add_drink_stock()   
#       if @drink_table[:cola][:stock]==0
#         @drink_table[:cola][:stock] += 5
#       end
#     end

#     #購入できるか？
#     def purchase
#       if @total >= @drink_table[:cola][:price]
#           puts "購入できます"
#       else
#           puts "お金が足りません"  
#       end
#     end




#     vend = VendingMachine.new
#     stock = Stock.new
#     money = Money.new

#     #「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行。
#     # next_purchase = true 
#     # while next_purchase
#     #   next_purchase = janken.pon(player.hand, enemy.hand)
#     # end
