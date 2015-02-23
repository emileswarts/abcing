module ABCing
  class Renderer
    def initialize(scan_results)
      @alphabet = ('A'..'Z').to_a
      @scan_results = scan_results
    end

    def render
      puts report
    end

    private

    def report
      coloured_letters.map do |coloured_letter, colour|
        coloured_letter.send(colour)
      end.join(' ')
    end

    def coloured_letters
      test_letters = @scan_results.fetch(:test_letter_matches)
      app_letters = @scan_results.fetch(:app_letter_matches)

      params = {
        test_letters: test_letters,
        app_letters: app_letters }

      ABCing::ColourAlphabetResult.new(params).calculate
    end
  end
end
