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
      @id = results.first()['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM merchants"
      SqlRunner.run(sql)
    end


    end
