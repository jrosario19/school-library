require './teacher'

describe Teacher do
  it 'should have a name' do
    teacher = Teacher.new(24, 'Mathematician', 'John')
    expect(teacher.name).to eq('John')
  end

  it 'should have an id' do
    teacher = Teacher.new(45, 'Doctor', 'Pedro')
    expect(teacher.id.class).to eq(String)
  end

  it 'should have an age' do
    teacher = Teacher.new(45, 'Doctor', 'Juan')
    expect(teacher.age).to eq(45)
  end

  it 'should have a specialization' do
    teacher = Teacher.new(45, 'Doctor', 'Juan')
    expect(teacher.specialization).to eq('Doctor')
  end

  it ':can_use_services? should return true if the teacher is 24 or older' do
    teacher = Teacher.new(45, 'Doctor', 'Juan')
    expect(teacher.can_use_services?).to eq(true)
  end
end
