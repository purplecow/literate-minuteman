window.Minuteman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: () ->
    books = new Minuteman.Collections.Books()
    $("#books").append(new Minuteman.Views.BooksIndex(books).render().el)
    books.fetch()
