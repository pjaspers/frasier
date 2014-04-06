module Frasier

  class Book
    attr_accessor :title, :path

    def initialize(path)
      raise ArgumentError, "No path specified" if (path || "").empty?
      @title = title_from_path(path)
      @path = path
    end

    private

    def title_from_path(path)
      File.basename(path).split("_").map(&:capitalize).join(" ")
    end
  end
end
