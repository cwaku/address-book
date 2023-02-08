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
  end

  def list_contacts
    puts 'Contact List is empty' if @contacts.empty?
    @contacts.each_with_index do |contact, i|
      puts "#{i + 1}. Name: #{contact.first_name} #{contact.last_name} Number: #{contact.contact_number}"
    end
  end
end
