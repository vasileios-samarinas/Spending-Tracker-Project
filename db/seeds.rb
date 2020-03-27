require_relative("../models/category.rb")
require_relative("../models/merchant.rb")
require_relative("../models/transaction.rb")



Transaction.delete_all()
Merchant.delete_all()
Category.delete_all()

category1=Category.new({"name" => "Transport"})

category1.save()

category2=Category.new({"name" => "Groceries"})

category2.save()

category3=Category.new({"name" => "Clothing"})

category3.save()

category4=Category.new({"name" => "Entertainment"})

category4.save()

category5=Category.new({"name" => "Shopping"})

category5.save()


merchant1 = Merchant.new({
  "name" => "Amazon",
  "logo" => "https://images-eu.ssl-images-amazon.com/images/G/02/gc/designs/livepreview/amzn_logo_squid_noto_email_v2016_uk-main._CB463270308_.png"
})
merchant1.save()

merchant2 = Merchant.new({
  "name" =>"Asda",
  "logo" =>"https://cdn.corporate.walmart.com/11/26/b75216c34dc1826ca627dd9f6fb4/asda-logo-jpg.jpg"
})
merchant2.save()

merchant3 = Merchant.new({
  "name" =>"British Airways",
  "logo" => "https://i.pinimg.com/originals/4b/47/61/4b4761fa82dfdb5fabd96cbd8a0dde5a.jpg"
})
merchant3.save()

merchant4 = Merchant.new({"name" =>"Zara","logo" => "https://static.dezeen.com/uploads/2019/02/new-zara-logo-hero-1-852x479.jpg"})
merchant4.save()


transaction1 = Transaction.new({
  "category_id"=>category2.id ,
  "merchant_id"=>merchant2.id,
  "amount"=>"150",
  "transaction_date"=>"2020-01-02"
})

transaction1.save()

transaction2=Transaction.new({
  "category_id"=> category2.id,
  "merchant_id"=> merchant2.id,
  "amount" =>"50",
  "transaction_date"=>"2020-01-03"
})
transaction2.save()

transaction3=Transaction.new({
  "category_id"=> category3.id,
  "merchant_id"=> merchant4.id,
  "amount" =>"70",
  "transaction_date"=>"2020-01-05"
})
transaction3.save()

transaction4=Transaction.new({
  "category_id"=> category4.id,
  "merchant_id"=> merchant1.id,
  "amount" => "230",
  "transaction_date"=>"2020-01-09"
})
transaction4.save()

transaction5=Transaction.new({
  "category_id"=> category5.id,
  "merchant_id"=> merchant1.id,
  "amount" =>"50",
  "transaction_date"=>"2020-01-12"
})
transaction5.save()

transaction6=Transaction.new({
  "category_id"=> category2.id,
  "merchant_id"=> merchant3.id,
  "amount" =>"25",
  "transaction_date"=>"2020-02-01"
})
transaction6.save
