module ABCing
  class AlphabetMatch
    def initialize(files)
      @files = files
    end

    def letters
      letters_from_files.flatten.sort.uniq
    end

    private

    def letters_from_files
      @files.collect { |f| class_letters File.open(f).read() }
    end

    def class_letters(file_contents)
      class_names(file_contents).map { |c| c[0] }
    end

    def class_names(contents)
      contents.scan(/class (\w+).*$/).flatten
    end
  end
end
