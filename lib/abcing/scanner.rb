module ABCing
  class Scanner
    def initialize(params)
      @app_directories = params.fetch(:app_directories)
      @test_directories = params.fetch(:test_directories)
    end

    def results
      { test_letter_matches: first_letters(test_class_results.flatten.uniq),
        app_letter_matches: first_letters(app_class_names) }
    end

    private

    def test_class_results
      app_class_names.each do |a|
        @test_directories.collect {|t| test_class_names a }
      end
    end

    def test_class_names(app_class_name)
      contents(test_files).collect do |e|
        e.scan(/^.*(#{app_class_name}).*$/)
      end.flatten
    end

    def app_class_names
      class_names contents(files @app_directories)
    end

    def contents(files)
      files.collect { |f| File.read(f) }
    end

    def test_files
      files @test_directories
    end

    def files(directories)
      ABCing::ClassFileFinder.new(directories).find
    end

    def class_names(file_contents)
      ABCing::ClassNameFinder.new(file_contents).find
    end

    def first_letters(class_names)
      ABCing::FirstLetters.new(class_names).letters
    end
  end
end
