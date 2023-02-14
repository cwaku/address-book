require_relative './address'

class Contact < Address
  attr_accessor :first_name, :last_name, :contact_number

  def initialize(first_name, last_name, contact_number)
    super()
    @first_name = first_name
    @last_name = last_name
    @contact_number = contact_number
    @contacts = []
  end

  def add_contact
    @contacts << self
    save_contact(self)
  end

  def delete_contact(id)
    @contacts.delete_at(id - 1)
    remove_contact(self)
  end

  def edit_contact(id)
    contact = @contacts[id - 1]
    edit_contact(contact)
    save_contact(self)
  end

  private

  def generate_summary
    puts " First Name: #{first_name} \n Last Name: #{last_name} \n Contact Number: #{contact_number}"
  end

  def save_contact(contact)
    # Append file to file
    temp_hash = {
      first_name: contact.first_name,
      last_name: contact.last_name,
      contact_number: contact.contact_number
    }

    File.open('./data/contacts.txt', 'a') do |file|
      file.puts(temp_hash.to_json)
    end
  end

  def remove_contact(contact)
    # remove contact from file
    File.open('./data/contacts.txt', 'r') do |file|
      file.each_line do |line|
        file.delete(line) if line.include?(contact.first_name)
      end
    end
  end
end
