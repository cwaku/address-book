require_relative './models/contact'
require 'json'

module SaveContacts
  def list_contacts
    contacts = Contact.all
    puts contacts
    # contacts.each_with_index do |contact, index|
    #   puts "Contact ID: #{index + 1}"
    #   puts "First Name: #{contact['first_name']} Last Name: #{contact['last_name']} Contact Number: #{contact['contact_number']}"
    #   puts '---------------------'
    # end
  end

  def remove_contact(id)
    @contacts = load_contacts

    contact = @contacts[id - 1]
    # remove contact from file
    File.open('./data/contacts.txt.tmp', 'w') do |file|
      File.foreach('./data/contacts.txt') do |line|
        unless line.chomp == "{\"first_name\":\"#{contact['first_name']}\",\"last_name\":\"#{contact['last_name']}\",\"contact_number\":\"#{contact['contact_number']}\"}"
          file.puts(line)
        end
      end
    end
    File.delete('./data/contacts.txt')
    File.rename('./data/contacts.txt.tmp', './data/contacts.txt')
  end

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
