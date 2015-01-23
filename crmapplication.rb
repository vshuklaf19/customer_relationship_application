require_relative './rolodex.rb'#Looks in current directory for Rolodec class file.
require_relative './contact.rb'
class CRM
  attr_reader :name

  def initialize(name)
    @name=name # @name is a instance variable
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display one contact"
    puts "[5] Display contacts by attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "Enter a number: "
  end

  def main_menu
    puts "Welcome to #{@name}"

    while true
    print_main_menu
    input = gets.chomp.to_i
    choose_option(input)
    return if input == 7
    end
  end

  def choose_option(option)
    case option
    when 1 then add_contact
    when 2 then modify_contact
    when 3 then display_contacts
    when 4 then display_contact
    when 5 then display_attribute
    when 6 then delete_contact
    when 7 then 
      puts "Goodbye!"
      return # There so we exit the program
    else 
      puts "Incorrect option, try again!"
    end
  end

  def add_contact
    puts "Provide Contact Details"

    print "First Name:"
    first_name = gets.chomp 

    print "Last Name:"
    last_name = gets.chomp 
    print "Email:"
    email = gets.chomp 
    print "Note:"
    note = gets.chomp 

    new_contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(new_contact)
  end

  def modify_contact
    puts "Enter an id: "
    contact_id = gets.chomp.to_i 
    puts "Are you sure? [Y or N]"
    y_or_n = gets.chomp
    if y_or_n == "Y"
      @rolodex.modify_contact(contact_id)
    end
  end

  def display_contacts
    @rolodex.display_all_contacts
  end

  def display_contact
    puts "Enter an id: "
    contact_id = gets.chomp.to_i 
    puts @rolodex.find_contact(contact_id)
  end

  def display_attribute
    puts "Enter attribute: "
    attribute = gets.chomp
    @rolodex.display_info_by_attribute(attribute)
  end

  def delete_contact
    puts "Enter an id: "
    contact_id = gets.chomp.to_i 
    @rolodex.delete_contact(contact_id)
    puts "Contact deleted!"
  end
end
bitmaker = CRM.new("Bitmaker Labs CRM")
bitmaker.main_menu
puts bitmaker.name #Prints name of CRM instance

