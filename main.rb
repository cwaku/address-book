class Main
  
  def initialize
  end

  def start

    puts "Welcome to Address Book"

    loop do
      list_options
      if list_options == 5
        break
      end

      add_contact if list_options == 1
      edit_contact if list_options == 2
      list_contacts if list_options == 3
      delete_contact if list_options == 4
    end
  end

    def list_options
      puts "1. Add Contact"
      puts "2. Edit Contact"
      puts "3. List Contacts"
      puts "4. Delete Contact"
      puts "5. Exit"

      print "Enter your choice: "
      choice = gets.chomp.to_i
    end

    
end

main = Main.new
main.start
