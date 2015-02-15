
require_relative '../lib/abcing/alphabet_match'

describe ABCing::AlphabetMatch do
  after(:each) do
    FileUtils.rm_rf 'dummy'
  end

  it '#result' do
    Dir.mkdir 'dummy'

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
end
