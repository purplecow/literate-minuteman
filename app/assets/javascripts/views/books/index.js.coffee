class Minuteman.Views.BooksIndex extends Backbone.View
  initialize: (books) ->
    _.bindAll(this, 'render')

    @books = books
    @books.bind('reset', @render)
    @books.bind('change', @render)
    
  render: ->
    $(@el).html('')
    @books.books.each (book) =>
      $(@el).append(new Minuteman.Views.Book(book).render().el)
    this


class Minuteman.Views.Book extends Backbone.View
  template: JST['books/show']
  initialize: (book) ->
    @book = book
  render: ->
    $(@el).html(@template(book:@book))
    this
