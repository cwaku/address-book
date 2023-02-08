require_relative './item'

class Contact < Item
  attr_accessor :first_name, :last_name, :contact_number

  def initialize(first_name, last_name, contact_number)
    super()
    @first_name = first_name
    @last_name = last_name
    @contact_number = contact_number
  end
end
