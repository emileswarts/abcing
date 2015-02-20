module ABCing
  class Renderer
    def initialize
      @app_directories = ['/Users/korpz/vagrant-dev/www/surface-view/app']
      @test_directories = ['/Users/korpz/vagrant-dev/www/surface-view/spec']
    end

    def render
      params = {
        app_directories: @app_directories,
        test_directories: @test_directories }

      scan_results = ABCing::Scanner.new(params).results

      p "SPEC FILES: " + scan_results.fetch(:test_scan_results).join(' ')
      p "APP FILES: " + scan_results.fetch(:app_letter_matches).join(' ')
      # p "ALPHABET: " + alphabet.join(' ')
    end
  end
end
