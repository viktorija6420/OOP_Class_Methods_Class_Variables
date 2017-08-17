# Create a class called Book.
# Your class should have two class variables: @@on_shelf and @@on_loan.
#Both should start as empty arrays. @@on_shelf will contain the collection
#of book objects that are available to be lent out and @@on_loan will contain
#the collection of books that are currently being borrowed.
class Book
  @@on_shelf = []
  @@on_loan = []
# Your class will also need reader and writer methods for due_date.
  def due_date(due_date)
    @due_date = due_date
  end

  def due_date
    @due_date
  end

  # This instance method makes a new book object. It should initialize
  # a book's title, author, and isbn.
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

# This instance method is how a book is taken out of the library. This method
#should use lent_out? to check if the book is already on loan, and if it is this
#method should return false to indicate that the attempt to borrow the book failed.
# Otherwise, use current_due_date to set the due_date of the book and move it from
# the collection of available books to the collection of books on loan, then return
# true.
  def borrow
    if self.lent_out?
      return
      false
  else
    @due_date = current_due_date
    @@on_loan << self
    @@on_shelf.delete(self)
    return
    true
  end
end


  def renew
    @due_date += (7*24*60*60) #1 week
  end

  # This instance method is how a book gets returned to the library.
  #It should call lent_out? to verify that the book was actually on loan.
  #If it wasn't on loan in the first place, return false. Otherwise, move
  # the book from the collection of books on loan to the collection of books
  #on the library shelves, and set the book's due date to nil before returning
  #true.
  def return_to_library
    if self.lent_out?
      @@on_loan.delete(self)
      @@on_shelf << self
      @due_date = nil
      return
      true
    else
      return
      false
    end
  end

  # This instance method return true if a book has already been borrowed and
  #false otherwise.
  def lent_out?(book_name1)
    @@on_loan.each do |book_name|
      if book_name == book_name1
        return true
      else false
      end
    end
  end

  # This class method is how new books are added to the library. This method
  #should call Book.new(...),add the new book object to @@on_shelf, and then
  # return the new book.

  def self.create(title, author, isbn)
    new_book_1 = Book.new(title, author, isbn)
    @create = new_book_1 + @@on_shelf
    return new_book_1
  end
# This class method should return the due date for books taken out today. It's up
# to you to decide how far in the future the due date should be. You can refer to
#the section about Time above for help getting started, and don't hesitate to ask for help if you're stuck!
  def self.current_due_date
    current_due_date = Time.now + 30*24*60*60
  end

  # overdue
  # This class method should return a list of books whose due dates are in the
  # past (ie. less than Time.now).
  def self.overdue
      past_books = []
      @@on_loan.each do |loan|
        if loan.due_date < Time.now
            past_books << value
        end
      end
      return past_books
    end

# This class method should return a random book from @@on_shelf (you may need
# to consult the Array docs to figure out how to do this).
  def self.browse
    @@on_shelf.sample
  end

  # This class method should return the value of @@on_shelf.
  def self.availiable
    @@on_shelf
  end

  # This class method should return the value of @@on_loan.
  def self.borrowed
    @@on_loan
  end


end

#Need to go back.Not working properly.
