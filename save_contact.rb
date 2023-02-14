require_relative './modules/contact'
require 'json'

module SaveContacts
  def list_contacts
    @contacts = load_contacts
    @contacts.each_with_index do |contact, index|
      puts "Contact ID: #{index + 1}"
      puts "First Name: #{contact['first_name']} Last Name: #{contact['last_name']} Contact Number: #{contact['contact_number']}"
      puts '---------------------'
    end
  end

  def remove_contact(id)
    @contacts = load_contacts

    contact = @contacts[id - 1]
  # remove contact from file
    File.open('./data/contacts.txt.tmp', 'w') do |file|
      File.foreach('./data/contacts.txt') do |line|
        file.puts(line) unless line.chomp == "{\"first_name\":\"#{contact['first_name']}\",\"last_name\":\"#{contact['last_name']}\",\"contact_number\":\"#{contact['contact_number']}\"}"
      end
    end
    File.delete('./data/contacts.txt')
    File.rename('./data/contacts.txt.tmp', './data/contacts.txt')
  end


  # TODO: Fix this
  def load_contacts
    data = []

    if File.exist?('./data/contacts.txt')
      File.foreach('./data/contacts.txt') do |line|
        data << JSON.parse(line)
      end
    # end
    else
      File.open('./data/contacts.txt', 'w')
    end

    data
  end
end




# File.open('./data/contacts.txt.tmp', 'w') do |out_file|
#   File.foreach('./data/contacts.txt') do |line|
#     out_file.puts(line) unless line.chomp == "{\"first_name\":\"#{contact['first_name']}\",\"last_name\":\"#{contact['last_name']}\",\"contact_number\":\"#{contact['contact_number']}\"}"
#       puts line
#   end
# end
# end
# File.delete('./data/contacts.txt')
# File.rename('./data/contacts.txt.tmp', './data/contacts.txt')
# end