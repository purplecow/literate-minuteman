window.Minuteman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: (data) ->
    books = new Minuteman.Collections.Books(data)
    $("#books").append(new Minuteman.Views.BooksIndex(books: books).render().el)
