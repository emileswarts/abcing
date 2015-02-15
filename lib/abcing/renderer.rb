module ABCing
  class Renderer
    def initialize
      @working_copy = ['foo/lib']
      @test_directories = ['foo/spec']
    end

    def render
      alphabet = ('a'..'z').to_a

      working_copy_files = ABCing::ClassFileFinder.new(@working_copy).find
      test_files = ABCing::ClassFileFinder.new(@test_directories).find

      working_copy_letter_matches = ABCing::AlphabetMatch.new(working_copy_files).letters
      test_letter_matches = ABCing::AlphabetMatch.new(test_files).letters

      p alphabet.join(' ')
    end
  end
end
