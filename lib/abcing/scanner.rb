module ABCing
  class Scanner
    def initialize(params)
      @app_directories = params.fetch(:app_directories)
      @test_directories = params.fetch(:test_directories)
    end

    def results
      test_classes = []

      app_class_names.each do |a|
        @test_directories.each do |t|
          entries = test_class_names(a)
          test_classes << entries unless entries.empty?
        end
      end

      { test_letter_matches: first_letters(test_classes.flatten.uniq),
        app_letter_matches: first_letters(app_class_names) }
    end

    private

    def test_class_names(app_class_name)
      contents(test_files).collect { |e| e.scan(/^.*(#{app_class_name}).*$/) }.flatten
    end

    def app_class_names
      class_names contents(files @app_directories)
    end

    def contents(files)
      files.collect { |f| File.read(f) }
    end

    def test_files
      @test_directories.collect { |dir| Dir["#{dir}/**/*.rb"] }.flatten
    end

    def files(directories)
      ABCing::ClassFileFinder.new(directories).find
    end

    def class_names(file_contents)
      ABCing::ClassNameFinder.new(file_contents).find
    end

    def first_letters(class_names)
      ABCing::AlphabetMatch.new(class_names).letters
    end
  end
end
