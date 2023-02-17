require 'sinatra'
require_relative './models/contact'
# require_relative './routines'
require_relative './save_contact'

class Main
  # include Routines
  #include SaveContacts

  def initialize
    @contacts = ContactDB.new
  end

  def start
    puts 'Welcome to Address Book'
    loop do
      options = list_options
      break if options == 5

      # invalid option if any other number
      next unless (1..4).include?(options)

      add_contact_routine if options == 1
      edit_contact if options == 2
      list_contacts_routine if options == 3
      delete_contact_routine if options == 4
    end
  end

  def list_options
    puts '1. Add Contact'
    puts '2. Edit Contact'
    puts '3. List Contacts'
    puts '4. Delete Contact'
    puts '5. Exit'

    gets.chomp.to_i
  end

  def add_contact_routine
    puts 'Enter first name'
    first_name = gets.chomp
    puts first_name
    puts 'Enter last name'
    last_name = gets.chomp
    puts last_name
    puts 'Enter contact number'
    contact_number = gets.chomp
    puts contact_number
    # contact_params = 
    # contact = Contact.new

    # temp_hash = {
    #   first_name: first_name,
    #   last_name: last_name,
    #   contact_number: contact_number
    # }
    # contacts = ContactDB.new
    @contacts.add_contact(first_name, last_name, contact_number)
    # load_contacts
    # puts 'Contact added successfully'
  end

  def list_contacts_routine
    # contacts = ContactDB.new
    @contacts.list_contacts
  end

  def delete_contact_routine
    list_contacts_routine

    if @contacts.empty?
      puts 'Nothing to delete'
    else
      puts 'Enter the contact id to delete'
      id = gets.chomp.to_i

      remove_contact(id)
      puts 'Contact deleted successfully'
    end
  end

  def edit_contact
    list_contacts_routine
    # contacts = ContactDB.new

    puts 'Enter the contact id to edit'
    id = gets.chomp.to_i
    contact = @contacts.get_contact(id)

    puts "(#{contact.first_name}):"
    new_first_name = gets.chomp
    # contact.first_name = new_first_name unless new_first_name.empty?
    puts "(#{contact.last_name}):"
    new_last_name = gets.chomp
    # contact.last_name = new_last_name unless new_last_name.empty?
    puts "(#{contact.contact_number}):"
    new_contact_number = gets.chomp

    @contacts.edit_contact(id, new_first_name, new_last_name, new_contact_number)
    # contact.contact_number = new_contact_number unless new_contact_number.empty?

    # contact.add_contact
    # contact.generate_summary
  end
end

main = Main.new
main.start
