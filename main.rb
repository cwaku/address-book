require 'sinatra'
require_relative './models/contact'

class Main
  def initialize
    @contacts = ContactDB.new
  end

  def start
    puts 'Welcome to Address Book'
    loop do
      option = list_options
      break if option == 5

      # print invalid option if option is not 1, 2, 3, 4 or 5
      invalid_option unless [1, 2, 3, 4, 5].include?(option)

      add_contact_routine if option == 1
      edit_contact if option == 2
      list_contacts_routine if option == 3
      delete_contact_routine if option == 4
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
    puts 'Enter last name'
    last_name = gets.chomp
    puts 'Enter contact number'
    contact_number = gets.chomp

    confirmation = action_confirmation('save')
    @contacts.add_contact(first_name, last_name, contact_number) if confirmation == 'y'
    exit_to_menu = return_to_menu('save') if confirmation == 'n'

    return if exit_to_menu == 'm'

    send(:add_contact_routine) if exit_to_menu == 'a'
  end

  def list_contacts_routine
    @contacts.list_contacts
  end

  def delete_contact_routine
    list_contacts_routine

    puts 'Enter the contact id to delete'
    id = gets.chomp.to_i

    @contacts.delete_contact(id)
  end

  def edit_contact
    list_contacts_routine

    puts 'Enter the contact id to edit'
    id = gets.chomp.to_i
    contact = @contacts.get_contact(id)

    puts "(#{contact.first_name}):"
    new_first_name = gets.chomp
    puts "(#{contact.last_name}):"
    new_last_name = gets.chomp
    puts "(#{contact.contact_number}):"
    new_contact_number = gets.chomp

    confirmation = action_confirmation('edit')
    @contacts.edit_contact(id, new_first_name, new_last_name, new_contact_number) if confirmation == 'y'

    exit_to_menu = return_to_menu('edit') if confirmation == 'n'

    return if exit_to_menu == 'm'

    send(:edit_contact) if exit_to_menu == 'a'
  end

  private

  def invalid_option
    puts '---------------------------------'
    puts 'Invalid Option. Please try again'
    puts '---------------------------------'
  end

  def action_confirmation(action)
    puts "Are you sure you want to #{action} this contact? (y/n)"
    gets.chomp
  end

  def return_to_menu(action)
    puts "Would you like to return to the menu or #{action} another contact? (m/a)"
    gets.chomp
  end

  def redo_action(method)
    puts 'Please choose between the provided options'
    puts '-----------------------------------------'
    send(method)
  end
end

main = Main.new
main.start
