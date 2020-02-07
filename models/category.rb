require_relative( '../db/sql_runner' )

class Category

  attr_accessor :name ,:id

  def initialize(options)
    @name= options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
      sql = "INSERT INTO categories
      (
        name
      )
      VALUES
      (
        $1
      )
      RETURNING id"
      values = [@name]
      results = SqlRunner.run(sql, values)
      @id=results.first()['id'].to_i
    end

def self.delete_all()
  sql = "DELETE FROM categories"
  SqlRunner.run(sql)
end


end
