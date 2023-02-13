require_relative './modules/contact'
require 'json'

module SaveContacts

  # TODO: Fix this
  def load_contacts
    data = []

    if File.exist?('./data/contacts.txt')
      File.foreach('./data/contacts.txt') {
        |line| data << JSON.parse(line)
      }
    # end
    else
      File.open('./data/contacts.txt', 'w')
    end

    data
  end
end
