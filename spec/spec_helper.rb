require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

def create_app_files(names)
  names.each do |name|
    out_file = File.new("dummy/lib/#{ name }.rb", 'w')
    out_file.puts("class #{ name.upcase }; end;")
    out_file.close
  end
end

def create_test_files(names)
  names.each do |name|
    out_file = File.new("dummy/spec/#{ name }.rb", 'w')
    out_file.puts("class #{ name.upcase }; end;")
    out_file.close
  end
end
