require_relative './modules/contact'
require_relative './routines'
require_relative './save_contact'

class Main
  include Routines
  include SaveContacts

  def initialize
    @contacts = load_contacts
  end

  def start
    puts 'Welcome to Address Book'
    loop do
      options = list_options
      break if options == 5

      # invalid option if any other number
      next unless (1..4).include?(options)

      add_contact if options == 1
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
end

main = Main.new
main.start
