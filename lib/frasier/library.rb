module Frasier

  class Library
    LIBRARY_PATH = "#{ENV['HOME']}/.config/frasier"
    attr_accessor :books

    def initialize
      @books = []
      setup
      @books = find_books!
    end

    def setup
      return if File.exist?(self.class.library_path)

      FileUtils.mkdir_p(self.class.library_path)
    end

    def book_with_name(name)
      name = Regexp.new(name)
      books.detect do |book|
        book.title =~ name || book.path =~ name
      end
    end

    def random_book
      books.sample
    end

    def find_books!
      Dir.glob(File.join(self.class.library_path, "*")).map do |path|
        Book.new(path)
      end
    end

    def self.library_path
      LIBRARY_PATH
    end
  end
end
