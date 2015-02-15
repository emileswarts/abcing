module ABCing
  class AlphabetMatch
    def initialize(files)
      @files = files
    end

    def letters
      @files.collect do |file|
        file_contents = File.open(file).read()
        letter_from_line(class_name(file_contents))
      end
    end

    private

    def class_name(line)
      line.scan(/class (\w+).*$/).flatten.first
    end

    def letter_from_line(class_name)
      class_name[0]
    end
  end
end
