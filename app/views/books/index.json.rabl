collection @books
node do |book|
  partial "books/show", object: book
end

