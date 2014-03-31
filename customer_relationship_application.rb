require_relative "contact"
require_relative "rolodex"

class CRM

attr_accessor :note, :first_name, :last_name, :email, :id

def self.run
  crm = CRM.new
  crm.main_menu
end

def initialize
  @rolodex = Rolodex.new
  # @name = name_being_passed_in
end

def print_main_menu
  puts "[1] Add a new contact"
  puts "[2] Modify an existing contact"
  puts "[3] Delete a contact"
  puts "[4] Display all the contacts"
  puts "[5] Exit"
  puts "Enter a number: "
end

def main_menu
  print_main_menu
  user_selected = gets.chomp.to_i
  call_option(user_selected)
end

def call_option(user_selected)

  if user_selected == 5
  done = true
  end

  if user_selected == 1
  add_new_contact
  main_menu
  end

  if user_selected == 2
  modify_existing_contact
  main_menu
  end

  if user_selected == 3
  delete_a_contact
  main_menu
  end

  if user_selected == 4
  display_all_the_contacts
  main_menu
  end



end

  def add_new_contact

    puts "Enter Customer's First Name"
    first_name = gets.chomp
    puts ""
    # @rolodex.create_contact(first_name)

    print "Enter Customer's Last Name: "
    last_name = gets.chomp
    puts ""
    # @rolodex.create_contact(last_name)

    print "Enter Customer's Email Address: "
    email = gets.chomp
    puts""
    # @rolodex.create_contact(email)


    print "Enter Customer's Note: "
    note = gets.chomp
    puts""
    # @rolodex.create_contact(Note)

    puts "...................."

    contact = Contact.new(first_name, last_name, email, note)

    @rolodex.add_new_contact(contact)

  end

  def delete_a_contact
    puts "Enter contact's ID to remove it"
    id = gets.chomp.to_i
    @rolodex.remove_contact(id)
  end

  def display_all_the_contacts
    contacts = @rolodex.get_contacts
    contacts.each do |contact|
    puts contact
    end
  end

  def modify_existing_contact
    puts "Enter contact ID to edit"
    id = gets.chomp.to_i
    #@rolodex.edit_contact(id)
    puts "Enter new first name"
    new_first_name = gets.chomp
    puts "Enter new last name"
    new_last_name = gets.chomp
    puts "Enter new email address"
    new_email = gets.chomp
    puts "Enter new note"
    new_note = gets.chomp
    @rolodex.edit_contact(id, new_first_name, new_last_name, new_email, new_note)
  end

end

# a_crm_app = CRM.new
# a_crm_app.main_menu

CRM.run








