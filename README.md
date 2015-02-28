# ABCing

[![ABCing Gem Version](https://badge.fury.io/rb/abcing.svg)](http://badge.fury.io/rb/abcing)
[![ABCing Travis build](https://travis-ci.org/emileswarts/ABCing.svg?branch=master)](https://travis-ci.org/emileswarts/ABCing.svg)
![](http://ruby-gem-downloads-badge.herokuapp.com/abcing/0.0.2?type=total&color=brightgreen)
![abcing gem](https://s3-eu-west-1.amazonaws.com/abcing/coverage.png)

### Green letter
It matches 'class Foo' in your application.
It matches 'Foo' in your test suite.

### Yellow letter
There is no class name starting with that letter.

### Red letter
It matches 'class Foo' in your application.
It does not match 'Foo' in your test suite.

This is also lenient in the way that it scores green letters.
If you have defined two classes Foo, and Foosball, and you only have a test for Foo, you will still get a green letter.
To get a red letter means that any class name starting with that letter is not present in your test suite.

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

## Run the tests

    $ bundle exec rspec

## Contributing

1. Fork it ( https://github.com/emileswarts/abcing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## TODO

1. Check for presence of config file for scan params
2. Add verbose mode that mentions the class names scanned for results
3. Add score results
4. Improve performance
5. Create badge for results to be used on github
