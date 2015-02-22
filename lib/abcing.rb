require 'abcing/version'
require 'abcing/scanner'
require 'abcing/class_file_finder'
require 'abcing/class_name_finder'
require 'abcing/renderer'
require 'abcing/alphabet_match'

module ABCing
  class Runner
    def initialize
      @app_directories = ['lib', 'app']
      @test_directories = ['spec', 'features']
    end

    def run
      app_directories = ['/Users/korpz/vagrant-dev/www/surface-view/app']
      test_directories = ['/Users/korpz/vagrant-dev/www/surface-view/spec']

      params = {
        app_directories: app_directories,
        test_directories: test_directories }

      scan_results = ABCing::Scanner.new(params).results

      ABCing::Renderer.new(scan_results).render
    end
  end
end
