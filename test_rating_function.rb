load "main.rb"
load "library.rb"

casey = Borrower.new("Casey")

caseys_book = Book.new("The New Game","Casey McNeil")


casey.rate(caseys_book, 5, "This book is incredible.  Pure, pure genius.  *slow clap*")

caseys_book.see_rating
