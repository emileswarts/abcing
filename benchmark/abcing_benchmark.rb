require 'benchmark'
require 'fileutils'
require_relative '../lib/abcing.rb'
require_relative './abcing_many_files'

class ABCingBenchmark
  def self.test_many_files
    setup
    ABCing::Benchmark.setup_many_files
    puts Benchmark.measure { ABCing::Runner.new('benchmark/dummy').run }
    teardown
  end

  private

  def self.setup
    FileUtils.rm_rf 'benchmark/dummy'
    Dir.mkdir 'benchmark/dummy'
    Dir.mkdir 'benchmark/dummy/lib'
    Dir.mkdir 'benchmark/dummy/spec'
  end

  def self.teardown
    FileUtils.rm_rf 'benchmark/dummy'
  end
end

ABCingBenchmark.setup
ABCingBenchmark.test_many_files
ABCingBenchmark.teardown
