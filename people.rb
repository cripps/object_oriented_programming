class Person
  def initialize(name)
    @name = name
  end
  def greeting
    puts "Hi, my name is #{@name}."
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end

end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object!"
  end
end


chris = Instructor.new("Chris")
chris.greeting
cristina = Student.new("Cristina")
cristina.greeting
chris.teach
cristina.teach
# The teach method does not work on Cristina (the student) because the method does not exist in the Student class and only exists in the
