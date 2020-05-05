require_relative( '../db/sql_runner' )


class Transaction

  attr_accessor :category_id,:merchant_id,:amount,:transaction_date, :id

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @category_id=options['category_id'].to_i
    @merchant_id=options['merchant_id'].to_i
    @amount=options['amount']
    @transaction_date=options['transaction_date']
  end

  def save()
    sql = "INSERT INTO transactions
    (category_id,merchant_id,amount,transaction_date)
    VALUES
    ($1, $2 ,$3,$4)
    RETURNING id"
    values =[@category_id, @merchant_id, @amount,@transaction_date]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql="DELETE FROM transactions WHERE id =$1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql="UPDATE transactions SET (category_id,merchant_id,amount,transaction_date)=($1,$2,$3,$4) WHERE id=$5"
    values=[@category_id, @merchant_id, @amount,@transaction_date,@id]
    SqlRunner.run(sql,values)
  end

  def category()
    sql="SELECT * FROM categories where id=$1"
    values=[@category_id]
    results=SqlRunner.run(sql,values)
    return Category.new(results.first)
  end

  def merchant()
    sql="SELECT * FROM merchants where id=$1"
    values=[@merchant_id]
    results=SqlRunner.run(sql,values)
    return Merchant.new(results.first)
  end


  def self.total_amount()
    sql="SELECT amount FROM transactions"
    amounts_data=SqlRunner.run(sql)
    return amounts_data.reduce(0) {|total, hash| total += hash['amount'].to_i}
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.all()
    sql="SELECT * FROM transactions"
    transaction_data = SqlRunner.run(sql)
    return Transaction.map_items(transaction_data)
  end

  def self.find(id)
    sql="SELECT * FROM transactions WHERE id=$1"
    values=[id]
    results=SqlRunner.run(sql,values)
    return Transaction.new(results.first)
  end

  def self.map_items(transaction_data)
    result = transaction_data.map{|transaction| Transaction.new(transaction)}
    return result
  end


end
