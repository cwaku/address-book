class Item

  attr_accessor :id

  def initialize()
    @id = Random.rand(1..1000)
  end
    
end