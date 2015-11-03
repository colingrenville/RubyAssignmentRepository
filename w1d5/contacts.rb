class Contact
 
	attr_accessor :first_name, :last_name, :email, :notes, :id

	@@contacts = []
	@@id = 1


	def initialize(first_name, last_name, options = {})
		@id = @@id
		@first_name = first_name
		@last_name = last_name
		@email = [:email]
		@notes = [:notes]
		@@id +=1 
	end

	def self.create(first_name, last_name, options = {})
		new_contact = Contact.new(first_name, last_name, options)
		@@contacts << new_contact
	end

	def self.all
		@@contacts
	end

end