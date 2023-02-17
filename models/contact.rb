# require_relative './address'
require 'sinatra'
require 'sinatra/activerecord'


class ContactDB
  class Contact < ActiveRecord::Base
  end
  # attr_accessor :first_name, :last_name, :contact_number

  # def initialize()
  #   # @first_name = first_name
  #   # @last_name = last_name
  #   # @contact_number = contact_number
  #   # @contacts = []
  # end

  

  def add_contact(first_name, last_name, contact_number)
    if Contact.create(first_name: first_name, last_name: last_name, contact_number: contact_number)
      puts 'Added successfully'
    else
      puts 'Not added'
    end

    # puts self
    # hash_={first_name: "Jerry", last_name: }
    # @contacts << self


    # save_contact(self)
  end

  def edit_contact(id)
    contact = @contacts[id - 1]
    edit_contact(contact)
    # save_contact(self)
  end

  private

  def generate_summary
    puts " First Name: #{first_name} \n Last Name: #{last_name} \n Contact Number: #{contact_number}"
  end

  def save_contact(contact)
    # @contact = Contact.new(first_name: contact.first_name, last_name: contact.last_name, contact_number: contact.contact_number)
    # @contact = contact
    if @contact.save
      puts "Contact saved succesfully"
    else
      puts 'Contact not saved'
    # end
    # temp_hash = {
    #   first_name: contact.first_name,
    #   last_name: contact.last_name,
    #   contact_number: contact.contact_number
    # }

    # File.open('./data/contacts.txt', 'a') do |file|
    #   file.puts(temp_hash.to_json)

    # user.find_by
    end
  end
end
