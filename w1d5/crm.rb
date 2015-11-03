require_relative 'contacts.rb'
require 'sinatra'

get '/' do
	erb :index
end

class CRM
	def initialize(name)
		@name = name
		@@contacts = []
	end

	def print_main_menu
			puts "1. Add a contact"
			puts "2. Modify a contact"
			puts "3. Display all contacts"
			puts "4. Display contact"
			puts "5. Display contact attribute"
			puts "6. Delete a contact."
			puts "7. Exit"
	end

	def main_menu
		while true
			print_main_menu
			print "Choose an option: "
			user_input = gets.chomp.to_i
			break if user_input == 7
			choose_option(user_input)
		end
	end	

	def choose_option(user_input)
		case user_input
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_all
			when 4 then display_contact
			when 5 then display_contact_attribute
			when 6 then delete_contact
			when 7 then exit
			else "Sorry I can't do that"
		end
	end

	def add_contact
		puts "First Name:"
		@first_name = gets.chomp
		puts "Last Name:"
		@last_name = gets.chomp
		puts "Email:"
		@email = gets.chomp
		puts "Notes:"
		@notes = gets.chomp
		options = {email: @email, notes: @notes}
		new_contact = Contact.create(@first_name, @last_name, options)
	end

	def modify_contact
		puts "What is the id of the contact that you wish to modify?"
		@id_number = gets.chomp
		#Need to figure out how to use @id_number to select the id and allow me to edit it.
	end

	def confirm
		puts "Confirm you wish to change this contact by entering YES, if you wish to return to the main menu, enter NO"
		confirm = gets.chomp.upcase
		if confirm == "NO"	
			main_menu
		end
		puts "How would you like to change this contact?"
		puts "Enter 1 to change the first name"
		puts "Enter 2 to change the second name"
		puts "Enter 3 to change the email"
		puts "Enter 4 to change the notes"
		change_input = gets.chomp.to_i
		id_getter
	end

	def id_getter
		#Not sure if this makes sense to do, not sure how iteration works with optional inputs like notes and email.
		@@contacts.each do |id, first, last, email, notes| 
			if @id == @id_number
			select_modify
			else
			main_menu 
			end
		end
	end

	def select_modify
		case change_input
		when 1 then modify_first_name
		when 2 then modify_second_name
		when 3 then modify_email
		when 4 then modify_notes
		end
	end

		def modify_first_name
			"Enter the new first name"
			new_first_name = gets.chomp
			@first_name = new_first_name
			if new_first_name.upcase == "NO"
				main_menu
			end
		end

		def modify_last_name
			"Enter the new last name"
			new_last_name = gets.chomp
			@last_name = new_last_name
			if new_last_name.upcase == "NO"
				main_menu
			end
		end

		def modify_email
			"Enter the new email"
			new_email = gets.chomp
			@email = new_email
			if new_email.upcase == "NO"
				main_menu
			end
		end

		def modify_notes
			"Enter the new notes"
			new_notes = gets.chomp
			@new_notes = new_notes
			if new_first_name.upcase == "NO"
				main_menu
			end
		end

	def display_all 
		# Same issue with iterating over non-required objects as before. 
		@@contacts.each do |a,b,c,d,e|
		puts "ID: #{a}"
		puts "First Name: #{b}" 
		puts "Last Name: #{c}"
		puts "Email: #{d}"
		puts "Notes: #{e}"
		end
	end
end


