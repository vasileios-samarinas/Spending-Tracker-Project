require_relative( '../db/sql_runner' )


class Transaction

  attr_reader :id
  attr_accessor :category_id,:merchant_id,:amount

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @category_id=options['category_id'].to_i
    @merchant_id=options['merchant_id'].to_i
    @amount=options['amount']
  end

  def save()
    sql = "INSERT INTO transactions
    (category_id,merchant_id,amount)
    VALUES
    ($1, $2 ,$3)
    RETURNING id"
    values =[@category_id, @merchant_id, @amount]
    results = SqlRunner.run(sql,values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end


  end
