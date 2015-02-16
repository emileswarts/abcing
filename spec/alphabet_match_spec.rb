
require_relative '../lib/abcing/alphabet_match'

describe ABCing::AlphabetMatch do
  before(:each) do
    Dir.mkdir 'dummy'
  end

  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  it 'collects 2 letters' do
    aaa_file = File.new("dummy/aaa.rb", "w")
    aaa_file.puts("class Aaa; end;")
    aaa_file.close

    ccc_file = File.new("dummy/ccc.rb", "w")
    ccc_file.puts("class Ccc; end;")
    ccc_file.close

    files = [
      './dummy/aaa.rb',
      './dummy/ccc.rb']

    matcher = ABCing::AlphabetMatch.new(files)

    expect(matcher.letters).to eq(['A', 'C'])
  end

  it 'collects multiple class names from a single file' do
    file = File.new("dummy/foo.rb", "w")
    file.puts(<<-EOT)
        class Animal
        end

        class Zoo
        end
      EOT
    file.close

    files = ['./dummy/foo.rb']

    matcher = ABCing::AlphabetMatch.new(files)

    expect(matcher.letters).to eq(['A', 'Z'])
  end
end
