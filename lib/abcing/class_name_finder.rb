module ABCing
  class ClassNameFinder
    def initialize(content)
      @content = content
    end

    def find
      @content.scan(/class (\w+).*$/).flatten
    end
  end
end
