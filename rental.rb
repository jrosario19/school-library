class Rental
    attr_accessor :date
  
    def initialize(date, book, student)
      @date = date
  
      @book = book
      @book.rentals << self
  
      @student = student
      @student.rentals << self
    end
  end