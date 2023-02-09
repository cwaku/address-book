require_relative './modules/contact'
require 'json'

module SaveContacts
  def save_contact(contacts)
    data = []

    contacts.each do |contact|
      data << ({
        first_name: contact.first_name,
        last_name: contact.last_name,
        contact_number: contact.contact_number
      })
    end

    File.write('./data/contacts.json', JSON.generate(data))
  end
end
