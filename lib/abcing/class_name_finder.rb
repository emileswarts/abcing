module ABCing
  class ClassNameFinder
    def initialize(contents)
      @contents = contents
    end

    def find
      @contents.collect { |c| c.scan(/class (\w+).*$/).flatten.uniq }.flatten.uniq
    end
  end
end
