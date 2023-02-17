require 'sinatra'
require 'sinatra/activerecord'


class ContactDB
  class Contact < ActiveRecord::Base
  end
 
  def add_contact(first_name, last_name, contact_number)
    # TODO: Check by index to see if comtact number already exists
    # before adding.
    # contact = Contact.find_by(contact_number: contact_number)
    if Contact.create(first_name: first_name, last_name: last_name, contact_number: contact_number)
      puts 'Added successfully'
    else
      puts 'Not added'
    end
  end

  def get_contact(id)
    return contact = Contact.find(id)
  end

  def list_contacts
    contacts = Contact.all

    if contacts.empty?
      puts 'Contact List is Empty. Please add some to be able to delete'
    else
      contacts.each_with_index do |contact, index|
        puts '-------------------------------------------------------------------------------------------------------------'
        puts "Contact ID: #{contact.id}"
        puts "First Name: #{contact.first_name}, Last Name: #{contact.last_name}, Contact Number:#{contact.contact_number}"
        puts '-------------------------------------------------------------------------------------------------------------'
      end
    end
  end

  def edit_contact(id, new_first_name, new_last_name, new_contact_number)
    contact = Contact.find(id)
    if contact.update(first_name: new_first_name, last_name: new_last_name, contact_number: new_contact_number)
      puts 'Contact edited succesfully'
      else
        puts 'Unable to edit contact'
    end
  end

  def delete_contact(id)
    # contact = Contact.find(id)

    if Contact.destroy(id)
      puts 'Contact Deleted Successfully'
    else
      puts 'Unable to delete'
    end
  end

  private

  def generate_summary
    puts " First Name: #{first_name} \n Last Name: #{last_name} \n Contact Number: #{contact_number}"
  end
end
