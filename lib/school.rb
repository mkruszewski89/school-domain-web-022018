require 'pry'

 class School
   attr_reader :name, :roster

   def initialize(name)
     @name = name
     @roster = {}
   end

   def add_student(student, grade)
     @roster[grade] ? @roster[grade].push(student) : @roster[grade] = [student]
   end

   def grade(grade)
     @roster.collect do |grade_level, students|
       @roster[grade] if grade_level == grade
     end.compact[0]
   end

   def sort
     sorted_students = {}
     @roster.sort.to_h.each do |grade_level, students|
       sorted_students[grade_level] = students.sort
     end
     sorted_students
   end
 end
