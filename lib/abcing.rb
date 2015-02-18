require 'abcing/version'
require 'abcing/scanner'
require 'abcing/class_file_finder'
require 'abcing/alphabet_match'

module ABCing
  class Run
    def initialize
      @app_directories = ['lib', 'app']
      @test_directories = ['spec', 'features']
    end

    def render
      alphabet = ('A'..'Z').to_a

      params = {
        app_directories: @app_directories,
        test_directories: @test_directories }

      scan_results = ABCing::Scanner.new(params).results

      p "SPEC FILES: " + scan_results.fetch(:test_scan_results).join(' ')
      p "APP FILES: " + scan_results.fetch(:app_letter_matches).join(' ')
      p "ALPHABET: " + alphabet.join(' ')
    end
  end
end
