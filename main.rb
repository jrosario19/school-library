require './store'
require './book'
require './person'
require './teacher'
require './student'
require './rental'

class App
  attr_reader :store

  def initialize
    @store = Store.new
  end

  def main_menu
    puts ''
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    main_selection
  end

  def main_selection # rubocop:disable Metrics/CyclomaticComplexity
    selection = gets.chomp
    case selection
    when '1' then list_all_books
    when '2' then list_all_people
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_all_rentals_by_id
    when '7' then abort('Thanks for your business. Goodbye!')
    else
      puts 'Invalid selection'
      main_selection
    end
  end

  def list_all_books
    @store.books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
    main_menu
  end

  def list_all_people
    @store.people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    main_menu
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    selection = gets.chomp
    case selection
    when '1' then create_student
    when '2' then create_teacher
    else
      puts 'Invalid selection'
      create_person
    end
    main_menu
  end

  def create_student
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Has parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(age, 'n/a', name, parent_permission: parent_permission)
    @store.people << student
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age: '
    age = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @store.people << teacher
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    store.books << book
    puts 'Book created successfully'
    main_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    store.books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_selection = gets.chomp.to_i
    puts ''
    puts 'Select a person from the following list by number (not id)'
    store.people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_selection = gets.chomp.to_i
    puts ''
    print('Enter the date of the rental (YYYY-MM-DD): ')
    rental_date = gets.chomp
    Rental.new(rental_date, store.books[book_selection], store.people[person_selection])
    puts 'Rental created successfully'
    main_menu
  end

  def list_all_rentals_by_id
    puts 'Select a person from the following list by number (not id)'
    store.people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    print 'Enter the id of the person: '
    person_selection = gets.chomp.to_i
    puts 'Rentals:'
    person = store.people[person_selection]
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
    main_menu
  end

  def run
    main_menu
  end
end

def main
  App.new.run
end

main
