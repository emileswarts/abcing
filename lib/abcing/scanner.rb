module ABCing
  class Scanner
    def initialize(params)
      @app_directories = params.fetch(:app_directories)
      @test_directories = params.fetch(:test_directories)
    end

    def results
      # p class_names contents(app_files)
      p app_class_names
      # { test_scan_results: [],
      #   app_letter_matches: app_class_names }
    end

    private

    def app_class_names
      class_names contents(app_files)
    end


    def contents(files)
      files.collect { |f| File.read(f) }
    end

    def app_files
      files @app_directories
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
  end
end
