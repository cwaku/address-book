# Description: This module contains all the methods that are used to perform the CRUD operations on the contact list

module Routines

  def delete_contact
    list_contacts

    if @contacts.empty?
      puts 'Nothing to delete'
    else
      puts 'Enter the contact id to delete'
      id = gets.chomp.to_i
      @contacts.delete_at(id - 1)

      save_contact(@contacts)
      puts 'Contact deleted successfully'
    end
  end

  

  # TODO: Fix this(Purpose => To ask for confirmation before action are taken)
  def confirmation(action)
    puts "Are you sure you want to #{action}? (y/n)"
    gets.chomp.downcase == 'y'
  end
end
