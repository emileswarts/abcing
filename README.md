# ABCing

 ![alt tag](https://s3-eu-west-1.amazonaws.com/abcing/coverage.png)

Dumbed down automated test coverage metrics.
Checks your working directory for class names, and tries to match them in the test directories.

The way this works is:

If it finds a matching class name in one of your test directories, you get a green result.
If it finds a class name in the working directory but not in the test directory, it is printed in red.
Other letters (not present in your working directory or test directories) are printed in yellow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abcing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abcing

## Usage

abcing /path/to/project/root

Currently this only considers app/ and lib/ for the scan.
It will check spec/ and features/ for matching class names found in the working directory.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/abcing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
