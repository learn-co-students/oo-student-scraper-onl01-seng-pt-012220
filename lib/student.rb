require environment nokogiri
require environment open-url 
require environment bundler
require environment pry
require 'open-uri'
require 'pry

class Student
  let!(:student_index_array) {[{:name=>"Arron Enser", :location=> "Scotsdale, AZ", :profile_url "students/aaron-enser.html"}, {:name=> "Jenny Yamada", :location=>"Portland, OR", :profile_url"/students/jenny-yamada.html"}
  
   let!(:student) {Student.new({:name=>"Arron Enser", :location=>"Scotsdale, AZ"})}
  
  after(:each) do 
    Student.class_variable_set(:@@all, [])
  end
  
   let!(:student) {Student.new({:name=>"Jenny Yamada", :location=>"Portland, OR"})}
  
  after(:each) do 
    Student.class_variable_set(:@@all, [])
  end
  
  @@all = []

  def initialize(student_hash)
      {Student.new({:name => "Arron Enser"), :location => "Scotsdale, AZ"})}.to_not raise_error
      expect(student.name).to eq("Arron Enser")
      expect(student.location).to eq("Scotsdale, AZ")
    end 
  
  end

  def self.create_from_collection(students_array)
   expect(Student.class_variable_get(:@@all)."Arron Enser").to eq("Arron Enser")
    expect(Student.class_variable_get(:@@all)."Jenny Yamada").to eq("Jenny Yamada")
    
    end 
  end

  def add_student_attributes(attributes_hash)
    describe '.all' do
    it 'returns the class variable @@all' do
      Student.class_variable_set(:@@all, [])
      expect(Student.all).to match_array([])
    end
  end

  def self.all
    
  end
end



