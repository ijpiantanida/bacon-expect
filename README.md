**UNMAINTAINED PROJECT**   
**I stopped developing in RubyMotion long time ago and can no longer maintain the project.**

# BaconExpect [![Build Status](https://travis-ci.org/ijpiantanida/bacon-expect.svg?branch=master)](https://travis-ci.org/ijpiantanida/bacon-expect) [![Code Climate](https://codeclimate.com/github/ijpiantanida/bacon-expect.png)](https://codeclimate.com/github/ijpiantanida/bacon-expect)

Bring [RSpec 3.0 expect syntax](https://www.relishapp.com/rspec/rspec-expectations/v/3-0/docs/built-in-matchers) to RubyMotion's MacBacon.
```ruby
expect(view("Tap me")).not_to be_hidden
```

Expect syntax allows a cleaner implementation because it doesn't need to monkey-patch the Object class to install the `should` method.

 # Installation
```
gem install bacon-expect

# or in Gemfile
gem 'bacon-expect'
```

# Usage
This gem ports most of the built-in matchers found in [RSpec 3.0](https://www.relishapp.com/rspec/rspec-expectations/v/3-0/docs/built-in-matchers)

**A full list of matchers examples can be found in the [sample app specs.](spec_app/spec/matchers)**

Examples:
```ruby
expect(nil).to be_nil
expect(true).not_to be_false

expect("super").to end_with("per")
expect{ 1/0 }.to raise_error(ZeroDivisionError)
expect{ raise ArgumentError.new("with a message") }.to raise_error(ArgumentError, /message/)
expect([1,2,3]).to have(3).items
expect("string").to respond_to(:upcase)
```

