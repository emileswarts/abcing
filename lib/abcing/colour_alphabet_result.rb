module ABCing
  class ColourAlphabetResult
    def initialize(params)
      @test_letters = params.fetch(:test_letters)
      @app_letters = params.fetch(:app_letters)
      @alphabet = ('A'..'Z').to_a
    end

    def calculate
      results = {}

      @alphabet.each do |a|
        results[a] = colour(a)
      end

      results
    end

    def colour(letter)
      return :green if test_letter_covered?(letter)

      return :red if test_letter_not_covered?(letter)

      :yellow
    end

    def test_letter_covered?(letter)
      @app_letters.include?(letter) and @test_letters.include?(letter)
    end

    def test_letter_not_covered?(letter)
      @app_letters.include?(letter) and !@test_letters.include?(letter)
    end
  end
end
