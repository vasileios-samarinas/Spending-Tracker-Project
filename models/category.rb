require_relative( '../db/sql_runner' )

class Category

  attr_accessor :name
  attr_reader :id 

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

  def delete()
    sql="DELETE FROM categories WHERE id =$1"
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def update()
    sql="UPDATE categories SET name=$1 WHERE id=$2"
    values=[@name,@id]
    SqlRunner.run(sql,values)
  end


  def self.delete_all()
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

  def self.all()
    sql="SELECT * FROM categories"
    category_data = SqlRunner.run(sql)
    return Category.map_items(category_data)
  end

  def self.find(id)
    sql="SELECT*FROM categories where id=$1"
    values=[id]
    results= SqlRunner.run(sql,values)
    return Category.new(results.first)
  end

  def self.map_items(category_data)
    result = category_data.map{|category| Category.new(category)}
    return result
  end

end
