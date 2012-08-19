class BooksController < ApplicationController
  before_filter :require_login, :find_books
  respond_to :html, :json

  def index
    respond_with @books
  end
  
  private
  def find_books
    @locations = @user.selected_locations
    @books = @user.books.includes(copies: :location).all
  end
end
