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

    File.open('./data/contacts.json', 'w') do |file|
      file.write(JSON.generate(data))
    end
  end
end
