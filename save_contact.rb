require_relative './modules/contact'
require 'json'

module SaveContacts

  # TODO: Fix this
  def load_contacts
    data = []

    if File.exist?('./data/contacts.json')
      JSON.parse(File.read('./data/contacts.json')).each do |contact|
        contact_class = Contact.new(contact['first_name'], contact['last_name'], contact['contact_number'])
        data << contact_class
      end
    else
      File.write('./data/contacts.json', [])
    end
    data
  end
end
