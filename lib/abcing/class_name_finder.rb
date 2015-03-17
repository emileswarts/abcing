module ABCing
  class ClassNameFinder
    def initialize(contents)
      @contents = contents
    end

    def find
      class_name_lines.flatten.uniq
    end

    private

    def class_name_lines
      @contents.collect { |c| c.scan(class_match_regex).flatten.uniq }
    end

    def class_match_regex
      /class (\w+).*$/
    end
  end
end
