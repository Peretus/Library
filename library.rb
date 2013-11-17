class Library
  attr_reader :books, :available_books
  attr_accessor :borrowed_books
  def initialize
    @books = []
  end

  def books
  end

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author} is #{book.status}"
    end
  end

  def borrowed_books
    @books.each do |book|

      if book.status == "Unavailable"
        puts "#{book.title} is #{book.status}"
      # @borrowed_books = {}
      end
    end
  end

  def available_books

    @books.each do |book|
      if book.status == "Available"
        puts "#{book.title} is #{book.status}"
      end
    end
  end

  def add_book(book)
    @books << book
    puts "#{book.title} by #{book.author}has been added to the library!"
  end

  def check_out(user, book)
    if book.status == "Available" && user.borrowed_books_count < 2
      book.borrower = user
      user.borrowed_books << book
      # self.borrowed_books.merge!(:book => user)
      book.status = "Unavailable"
    else 
      puts "Sorry, #{book.title} is not avialble."
    end
  end

  def check_in(book)
    book.status = "Available"
    book.borrower = nil
    self.borrowed_books[book].remove
  end
end

class Borrower
  attr_reader :borrowed_books_list, :borrowed_books_count, :review
  attr_accessor :borrowed_books, :rate
  def initialize(name)
    @name = name
    @borrowed_books = []

    puts "A borrower named #{name} has been created."
  end

  def borrowed_books
     @borrowed_books
  end

  def name
    @name
  end

  def rate(book, rating, review = nil)
    @rating = rating
    @review = review
    book.rating_hash = {self.name => [rating, review]}
  end


  def borrowed_books_count
    @borrowed_books.length

  end

  def borrowed_books_list
    @borrowed_books.each do |book|
      puts book.title
    end
  end
end

class Book
  attr_reader :title, :author, :year_published, :edition
  attr_accessor :status, :borrower, :rating_hash, :review
  def initialize(title, author, edition = "No edition set", year_published = "No year set")
    @title = title
    @author = author
    @status = "Available"
    @borrower = nil
    @year_published = year_published
    @edition = edition
    @rating_hash = {}



    puts "A book named #{title} by #{author} has been created"

    def see_rating
      rating_hash.each do |key, value|
      puts "#{key} has rated #{self.title} #{value[0].to_s} stars and says #{value[1].to_s}"
    end
  end

  

  end
end
