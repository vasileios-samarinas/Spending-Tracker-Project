require_relative( '../db/sql_runner' )

class Merchant

attr_accessor :name,:logo,:id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name= options['name']
    @logo=options['logo']
  end

  def save()
      sql = "INSERT INTO merchants
      (
        name,
        logo
      )
      VALUES
      (
        $1,$2
      )
      RETURNING id"
      values = [@name,@logo]
      results = SqlRunner.run(sql,values)
      @id=results.first()['id'].to_i
    end

def delete()
  sql="DELETE FROM merchants WHERE id =$1"
  values=[@id]
  SqlRunner.run(sql,values)
end

def update()
sql="UPDATE merchants SET(name,logo)=($1,$2) WHERE id=$3"
values=[@name,@logo,@id]
SqlRunner.run(sql,values)
end

def self.delete_all()
  sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
end

def self.all()
  sql="SELECT * FROM merchants"
  merchant_data = SqlRunner.run(sql)
  return Merchant.map_items(merchant_data)
end

def self.find(id)
sql="SELECT * FROM merchants WHERE id=$1"
values=[id]
results=SqlRunner.run(sql,values)
return Merchant.new(results.first)
end

def self.map_items(merchant_data)
  result = merchant_data.map{|merchant| Merchant.new(merchant)}
return result
end


end
