module ABCing
  class AlphabetMatch
    def initialize(files)
      @files = files
    end

    def letters
      @files.collect do |file|
        file_contents = File.open(file).read()
        class_letters(file_contents)
      end.flatten
    end

    private

    def class_letters(file_contents)
      class_names(file_contents).map { |c| c[0] }
    end

    def class_names(contents)
      contents.scan(/class (\w+).*$/).flatten
    end
  end
end
