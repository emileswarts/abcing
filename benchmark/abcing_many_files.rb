module ABCing
  class Benchmark
    def self.setup_many_files
      100.times do |num|
        ["foo_#{num}", "bar_#{num}"].each do |name|
          out_file = File.new("benchmark/dummy/lib/#{ name }.rb", 'w')
          out_file.puts("class #{ name.capitalize }; end;")
          out_file.close
        end
      end

      100.times do |num|
        ["foo_#{num}", "bar_#{num}"].each do |name|
          out_file = File.new("benchmark/dummy/spec/#{ name }.rb", 'w')
          out_file.puts("#{ name.capitalize }")
          out_file.close
        end
      end
    end
  end
end
