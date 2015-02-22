# ABCing

[![Gem Version](https://badge.fury.io/rb/abcing.svg)](http://badge.fury.io/rb/abcing)

 ![abcing gem](https://s3-eu-west-1.amazonaws.com/abcing/coverage.png)

Dumbed down automated test coverage metrics.
Checks your working directory for class names, and tries to match them in the test directories.

The way this works is:

If it finds a matching class name in one of your test directories, you get a green result.
If it finds a class name in the working directory but not in the test directory, it is printed in red.
Other letters (not present in your working directory or test directories) are printed in yellow.

## Usage

    $ abcing /path/to/project/root

Right now this will check /path/to/project/root/spec and /path/to/project/root/features to find test files.
It will use app/ and lib/ to find classes that should be tested.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abcing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abcing


## Contributing

1. Fork it ( https://github.com/[my-github-username]/abcing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## TODO

1. Check for presence of config file for scan params
2. Add verbose mode that mentions the class names scanned for results
3. Add score results
4. Improve performance
