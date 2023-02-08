require_relative "./item.rb"

class Contact < Item

  attr_accessor :first_name, :last_name, :contact_name
  
  def initialize(first_name, last_name, contact_name)
    super()
    @first_name = first_name
    @last_name = last_name
    @contact_name = contact_name
  end
end