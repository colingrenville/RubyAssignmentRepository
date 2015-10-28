class Person
attr_accessor :name
	def greeting 
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
		def learn 
			puts "I get it!"
		end
end


class Instructor < Person
		def teach
			puts "Everything in Ruby is an object"
		end
end

instructor = Instructor.new
student = Student.new

instructor.learn
student.teach 

#Callin teach for student and learn for instructor didn't work because both teach and learn are locally defined methods. They can't be called across classes.