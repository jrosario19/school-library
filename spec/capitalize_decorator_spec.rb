require './capitalize_decorator'
require './student'

describe CapitalizeDecorator do
  it 'has a :correct_name method' do
    decorator = CapitalizeDecorator.new(Nameable.new)
    expect(decorator.respond_to?(:correct_name)).to eq(true)
  end

  it 'can recieve an object to decorate' do
    student = Student.new('40', '', 'Juan', parent_permission: true)
    decorator = CapitalizeDecorator.new(student)
    expect(decorator.nameable).to eq(student)
  end

  it 'should capitalize the name' do
    student = Student.new('40', '', 'Juan', parent_permission: true)
    decorator = CapitalizeDecorator.new(student)
    expect(decorator.correct_name).to eq('Juan')
  end
end