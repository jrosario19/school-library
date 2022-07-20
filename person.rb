require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals, :classroom, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true, id: rand(1..1000))
    super()
    @id = id.to_s
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
