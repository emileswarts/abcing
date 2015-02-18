module ABCing
  class ClassNameFinder
    def initialize(content)
      @content = content
    end

    def find
      @content.scan(/class (\w+).*$/).flatten.uniq
    end
  end
end
