class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'Book was successfully update.'
  end

  def show
    @book = Book.find(params[:id])
    
  end

  
  def create
    @book = Book.new(book_params)
    if @book.save
      # flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      # @book = Book.new
      @books = Book.all
      render ("books/index")
    end
  end

  def edit
   @book =Book.find(params[:id])
  # flash[:notice] = "Book was successfully update."
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    # flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  # index,show,new,editは自動的に作られた。
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
