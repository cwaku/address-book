module Routines
  def add_contact
    puts 'Enter First Name: '
    first_name = gets.chomp
    puts 'Enter Last Name: '
    last_name = gets.chomp
    puts 'Enter Contact Number: '
    contact_number = gets.chomp
    contact = Contact.new(first_name, last_name, contact_number)
    @contacts << contact

    puts 'Contact added successfully'
    contact.generate_summary
  end

  def list_contacts
    puts 'Contact List is empty' if @contacts.empty?
    @contacts.each_with_index do |contact, i|
      puts "#{i + 1}. Name: #{contact.first_name} #{contact.last_name} Number: #{contact.contact_number}"
    end
  end

  def delete_contact
    list_contacts

    if @contacts.empty?
      puts "Nothing to delete"
    else
      puts 'Enter the contact id to delete'
      id = gets.chomp.to_i
      @contacts.delete_at(id - 1)
      puts 'Contact deleted successfully'
    end
  end

  def edit_contact
    list_contacts

    if @contacts.empty?
      puts "Nothing to edit"
    else
      puts 'Enter the contact id to edit'
      id = gets.chomp.to_i
      contact = @contacts[id - 1]
      puts "Enter First Name to replace \"#{contact.first_name}\" (Leave blank to keep old value):"
      new_first_name = gets.chomp
      contact.first_name = new_first_name unless new_first_name.empty?
      puts "Enter Last Name to replace \"#{contact.last_name}\" (Leave blank to keep old value):"
      new_last_name = gets.chomp
      contact.last_name = new_last_name unless new_last_name.empty?
      puts "Enter Contact Number to replace \"#{contact.contact_number}\" (Leave blank to keep old value):"
      new_contact_number = gets.chomp
      contact.contact_number = new_contact_number unless new_contact_number.empty?
      puts 'Contact edited successfully'
    end
  end
end
