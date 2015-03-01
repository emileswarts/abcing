require 'abcing/alphabet_match'
require 'abcing/class_file_finder'
require 'abcing/class_name_finder'
require 'abcing/colour_alphabet_result'
require 'abcing/renderer'
require 'abcing/scanner'
require 'abcing/version'

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

      scan_results = ABCing::LetterFinder.new(params).results
      ABCing::Renderer.new(scan_results).render
    end
  end
end

class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end
end
