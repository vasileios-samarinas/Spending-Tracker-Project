require_relative( '../db/sql_runner' )

class Transaction

  attr_reader

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @zombie_id = options['zombie_id'].to_i
    @victim_id = options['victim_id'].to_i
    @amount=options['amount']
  end
