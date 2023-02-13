require_relative './modules/contact'
require_relative './routines'
require_relative './save_contact'

class Main
  include Routines
  include SaveContacts

  def initialize
    # @contacts = load_contacts
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
      list_contacts if options == 3
      delete_contact if options == 4
    end
  end

  def list_options
    puts '1. Add Contact'
    puts '2. Edit Contact'
    puts '3. List Contacts'
    puts '4. Delete Contact'
    puts '5. Exit'

    # print 'Enter your choice: '

    gets.chomp.to_i
  end

  def add_contact_routine
    puts 'Enter first name'
    first_name = gets.chomp
    puts 'Enter last name'
    last_name = gets.chomp
    puts 'Enter contact number'
    contact_number = gets.chomp

    contact = Contact.new(first_name, last_name, contact_number)
    contact.add_contact
  end
end

main = Main.new
main.start
