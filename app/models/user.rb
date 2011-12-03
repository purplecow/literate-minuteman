class User < ActiveRecord::Base
  has_and_belongs_to_many :library_systems
  has_many :books, :dependent => :destroy

  validates_uniqueness_of :email
  validates_presence_of   :email
  validates_uniqueness_of :goodreads_id

  has_secure_password
  attr_accessible :email, :password, :password_confirmation

  def sync_books(list)
    return if list.empty?

    now = Time.now
    list.each do |b|
      book = books.find_or_create_by_title_and_author(b[:title], b[:author])
      book.update_attributes(:last_synced_at => now)
      book.sync_copies b[:copies]
    end
    books.where('last_synced_at < ?', now).destroy_all
  end

  def update!
    books = library_systems.inject([]) do |list, system|
      bot = system.search_bot(goodreads_id)
      list + bot.lookup
    end
    sync_books books
  end

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
  

end