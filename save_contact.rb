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

  def remove_contact(contact)
    # remove contact from file
    File.open('./data/contacts.txt.tmp', 'w') do |out_file|
      File.foreach('./data/contacts.txt') do |line|
        out_file.puts(line) unless line.start_with? contact.to_s
        puts line
      end
    end
    # File.delete('./data/contacts.txt')
    # File.rename('./data/contacts.txt.tmp', './data/contacts.txt')
  end

  # TODO: Fix this
  def load_contacts
    data = []

    if File.exist?('./data/contacts.txt')
      File.foreach('./data/contacts.txt') {
        |line| data << JSON.parse(line)
      }
    # end
    else
      File.open('./data/contacts.txt', 'w')
    end

    data
  end
end
