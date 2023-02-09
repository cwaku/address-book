require_relative './item'

class Contact < Item
  attr_accessor :first_name, :last_name, :contact_number

  def initialize(first_name, last_name, contact_number)
    super()
    @first_name = first_name
    @last_name = last_name
    @contact_number = contact_number
  end

  def generate_summary
    puts " First Name: #{first_name} \n Last Name: #{last_name} \n Contact Number: #{contact_number}"
  end

  def 
end
