object @book
attributes :id, :title, :author, :image_url
child :copies do |copy|
  attributes :id, :title, :call_number, :status
  node :location do |copy| 
    copy.location.name 
  end
end
