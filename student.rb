require_relative './person'
class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @rentals = []
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
  end
end
