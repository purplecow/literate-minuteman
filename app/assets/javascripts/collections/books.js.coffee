class Minuteman.Collections.Books extends Backbone.Collection
  url: '/books.json'
  model: Minuteman.Models.Book
  withCopies: -> 
    new Minuteman.Collections.Books(@select (book)-> book.get('copies').length > 0)
