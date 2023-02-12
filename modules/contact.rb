require_relative './item'

class Contact < Address
  attr_accessor :first_name, :last_name, :contact_number

  def initialize(first_name, last_name, contact_number)
    super()
    @first_name = first_name
    @last_nzame = last_name
    @contact_number = contact_number
    @contacts = []
  end


  def add_contact(contact)
    @contacts << contact
    save_contact(contact)
  end

  def delete_contact(contact)
    @contacts.delete(contact)
  end

  def edit_contact(contact)
    puts "(#{contact.first_name}):"
    new_first_name = gets.chomp
    contact.first_name = new_first_name unless new_first_name.empty?
    puts "(#{contact.last_name}):"
    new_last_name = gets.chomp
    contact.last_name = new_last_name unless new_last_name.empty?
    puts "(#{contact.contact_number}):"
    new_contact_number = gets.chomp
    contact.contact_number = new_contact_number unless new_contact_number.empty?
  end





  def generate_summary
    puts " First Name: #{first_name} \n Last Name: #{last_name} \n Contact Number: #{contact_number}"
  end
end
