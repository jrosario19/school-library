require_relative './person'
class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom&.students&.push(self)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
  end
end
