# Description: This module contains all the methods that are used to perform the CRUD operations on the contact list

module Routines
  

  def list_contacts
    puts 'Contact List is empty' if @contacts.empty?
    @contacts.each_with_index do |contact, i|
      puts "#{i + 1}. Name: #{contact.first_name} #{contact.last_name} Number: #{contact.contact_number}"
    end
  end

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

  def edit_contact
    list_contacts

    if @contacts.empty?
      puts 'Nothing to edit'
    else
      puts 'Enter the contact id to edit'
      id = gets.chomp.to_i
      contact = @contacts[id - 1]
      puts "(#{contact.first_name}):"
      new_first_name = gets.chomp
      contact.first_name = new_first_name unless new_first_name.empty?
      puts "(#{contact.last_name}):"
      new_last_name = gets.chomp
      contact.last_name = new_last_name unless new_last_name.empty?
      puts "(#{contact.contact_number}):"
      new_contact_number = gets.chomp
      contact.contact_number = new_contact_number unless new_contact_number.empty?

      save_contact(@contacts)
      puts 'Contact edited successfully'

      contact.generate_summary
    end
  end

  # TODO: Fix this(Purpose => To ask for confirmation before action are taken)
  def confirmation(action)
    puts "Are you sure you want to #{action}? (y/n)"
    gets.chomp.downcase == 'y'
  end
end
