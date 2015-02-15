module ABCing
  class AlphabetMatch
    def initialize(files)
      @files = files
    end

    def letters
      lines
    end

    private

    def lines
      @files.collect do |file|
        line = File.open(file).read()
        class_name = line.scan(/class (\w+).*$/)
        letter_from_line(class_name.flatten.first)
      end
    end

    def letter_from_line(class_name)
      class_name[0]
    end
  end
end
