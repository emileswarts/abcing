module ABCing
  class Renderer
    def initialize(scan_results)
      @alphabet = ('A'..'Z').to_a
      @scan_results = scan_results
    end

    def render
      p "SPEC FILES: " + @scan_results.fetch(:test_scan_results).join(' ')
      p "APP FILES: " + @scan_results.fetch(:app_letter_matches).join(' ')
      p "ALPHABET: " + @alphabet.join(' ')
    end
  end
end
