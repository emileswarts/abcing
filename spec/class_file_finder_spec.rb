require 'fileutils'
require 'abcing/class_file_finder'

describe ABCing::ClassFileFinder do
  before(:each) do
    Dir.mkdir 'dummy'
    out_file = File.new("dummy/foo.rb", "w")
    out_file.puts("class Foo; end;")
    out_file.close

    out_file = File.new("dummy/bar.rb", "w")
    out_file.puts("class Foo; end;")
    out_file.close
  end

  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  context 'Included files' do
    it 'Finds files with class defined in them' do
      expected_results = [
        'dummy/bar.rb',
        'dummy/foo.rb',
      ]

      finder = ABCing::ClassFileFinder.new(['dummy'])
      expect(finder.find).to eq(expected_results)
    end
  end

  context 'Excluded files' do
    it 'that do not have a .rb extension' do
      out_file = File.new("dummy/foo_config.txt", "w")
      out_file.puts("class FooConfig; end;")
      out_file.close

      expected_results = [
        'dummy/bar.rb',
        'dummy/foo.rb',
      ]

      finder = ABCing::ClassFileFinder.new(['dummy'])
      expect(finder.find).to eq(expected_results)
    end
  end

  context 'Error' do
    it 'raises an exception when no files are supplied'
  end
end
