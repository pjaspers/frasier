require "helper"

describe Library do

  it 'lists all books in the library' do
    test_dir = File.join(File.dirname(__FILE__), "files")
    Library.stub :library_path, test_dir do
      assert Library.new.books.length, Dir.glob(File.join(test_dir, "*")).length
    end
  end

  it 'creates a place for the library' do
    test_dir = File.join(File.dirname(__FILE__), "tmplib")
    FileUtils.rmdir(test_dir)
    Library.stub :library_path, test_dir do
      Library.new
      assert File.exist?(test_dir)
      FileUtils.rmdir(test_dir)
    end
  end

  it 'finds a book based on title' do
    test_dir = File.join(File.dirname(__FILE__), "files")
    Library.stub :library_path, test_dir do
      lib = Library.new
      assert_equal "My Man Jeeves", lib.book_with_name("My Man Jeeves").title
    end
  end

  it 'find a book based on path part' do
    test_dir = File.join(File.dirname(__FILE__), "files")
    Library.stub :library_path, test_dir do
      lib = Library.new
      assert_equal "My Man Jeeves", lib.book_with_name("_jeeves").title
    end
  end
end
