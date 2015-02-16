module ABCing
  class Scanner
    def initialize(params)
      @app_directories = params.fetch(:app_directories)
      @test_directories = params.fetch(:test_directories)
    end

    def results
      { test_scan_results: test_letter_matches,
        app_letter_matches: app_letter_matches }
    end

    private
    def app_files
      files_finder(@app_directories)
    end

    def test_files
      files_finder(@test_directories)
    end

    def app_letter_matches
      letter_finder app_files
    end

    def test_letter_matches
      letter_finder test_files
    end

    def files_finder(files)
      ABCing::ClassFileFinder.new(files).find
    end

    def letter_finder(files)
      ABCing::AlphabetMatch.new(files).letters
    end
  end
end
