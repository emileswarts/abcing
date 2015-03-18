require 'abcing/first_letters'
require 'abcing/class_file_finder'
require 'abcing/class_name_finder'
require 'abcing/colour_alphabet_result'
require 'abcing/renderer'
require 'abcing/scanner'
require 'abcing/version'
require 'monkey_patch/string'

module ABCing
  class Runner
    def initialize(working_dir)
      @working_dir = working_dir
    end

    def run
      app_directories = [
        "#{@working_dir}/app",
        "#{@working_dir}/lib"
      ]

      test_directories = [
        "#{@working_dir}/spec",
        "#{@working_dir}/features"
      ]

      params = {
        app_directories: app_directories,
        test_directories: test_directories }

      scan_results = ABCing::Scanner.new(params).results
      ABCing::Renderer.new(scan_results).render
    end
  end
end
