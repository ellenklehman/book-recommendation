class BooksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @list = List.find(params[:list_id])
    @book = Book.new
    respond_to do |format|
      format.html { redirect_to list_path(@list) }
      format.js
    end
  end

  def create
    @books = Book.all
    @list = List.find(params[:book][:list_id])
    @book = Book.new(book_params)
    @book.list_id = @list.id
    if @book.save
      flash[:notice] = "Your book was saved!"
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :description)
  end
end
