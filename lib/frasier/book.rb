module Frasier

  class Book
    attr_accessor :title, :path

    def initialize(path)
      raise Errno::ENOENT unless File.exist?(path || "")
      @title = title_from_path(path)
      @path = path
    end

    def dice_word_list
      DiceList.new(File.open(path)).word_list
    end

    private

    def title_from_path(path)
      File.basename(path).split("_").map(&:capitalize).join(" ")
    end
  end
end
