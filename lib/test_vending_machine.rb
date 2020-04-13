require "./test.drink"

class VendingMachine
    AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze
    
    #初期値
    def initialize
      # @payment = Money.new(0) #追加
      @total = 0
      @drink_table = { cola: { price: 120, stock: 5 }}
      @sale_amount = 0　#売り上げ金額
      @stock_coin =    #お釣り計算用
    end
  

    #ドリンクラインナップ
    drink1 = Drink.new(name: "cola", price: 120)
    drink2 = Drink.new(name: "", price: 000)
    menu = [drink1, drink2]

    def info
      return "#{self.name} #{self.price}円 "
    end
    
    
    #メニュー表記
    index = 0
    menus.each do |menu|
      puts "#{index}. #{drink.info}"
      index += 1
    end



    #お金を受け取る 繰り返し
    def insert(money)
      money.each do |money|    #繰り返し処理？
      if VendingMachine::AVAILABLE_MONEY.include?(money)
        @total += money
      else
        puts "#{money}円は使えません"
      end
    end
    end



    def initialize price, name
      @name = name
      @price = price
    end

  
    #購入する　  #投入金額は商品金額以上か？
    def purchase
      if stock_coin && drink_stock  #お釣り&在庫確認！！

        puts "メニューの番号を選択してください"
        order = gets.chomp.to_i
    
        selected_menu = menus[order]
        puts "選択したメニュー: #{selected_menu.name}"
        puts "料金は#{selected_menu.price}円です"

      while true　　#purchases.each do |purchase|  #購入作業を繰り返す
        if @total >= @drink_table[:cola][:price]
          #購入できる
          @total -= @drink_table[:cola][:price]  #total金額の減少
          @drink_table[:cola][:stock] -= 1     #在庫の減少

          puts "コーラを購入しました"
          puts "もう一本購入しますか？"
          @sales_amount += @drink_table[:cola][:price]
          #お釣りが必要な場合は減少させる
          @stock_coin = 

        else #金額が足りない
          puts "金額が足りませんので商品を購入できません"　#金額を入れるに戻る
          purchase = false
          break
        end
      end
      end
    end



  #払い戻し
    def refund     
      if @total == 0
        puts "払い戻すお金はありません"
        else
        puts "#{@total}円を払い戻し"
        @total = 0
      end
    end


    #コインの枚数が減ったら教えてほしい 
    def stock_coin
      if VendingMachine::AVAILABLE_MONEY[0].count >= 9 ||
         VendingMachine::AVAILABLE_MONEY[1].count <>= 1 ||
         VendingMachine::AVAILABLE_MONEY[2].count >= 9 ||
         VendingMachine::AVAILABLE_MONEY[3].count >= 1 
      else
        puts "釣り銭が足りません"
      end
    end

    #コーラはありますか？
  
    def drink_stock
      if @drink_table[:cola][:stock] == 0
        puts "コーラは売り切れです"
      else
        puts "コーラ,価格:1本#{@drink_table[:cola][:price]}円,在庫:#{@drink_table[:cola][:stock]}本"
    end
  end

   #在庫ストック減少
  def decrease_drink_stock()       
    @drink_table[:cola][:stock] -= 1
  end

    #在庫ストック増加
  def add_drink_stock()   
    if @drink_table[:cola][:stock]==0
       @drink_table[:cola][:stock] += 5
    end
  end

   #購入できるか？
  def purchase
    if @total >= @drink_table[:cola][:price]
        puts "購入できます"
    else
        puts "お金が足りません"  
    end
  end




  vend = VendingMachine.new
  stock = Stock.new
  money = Money.new

  #「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行。
  next_purchase = true 
  while next_purchase
    next_purchase = janken.pon(player.hand, enemy.hand)
  end